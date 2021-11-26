Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EC845F12E
	for <lists+linux-next@lfdr.de>; Fri, 26 Nov 2021 16:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbhKZQBj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Nov 2021 11:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhKZP7j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Nov 2021 10:59:39 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89ED3C061A14
        for <linux-next@vger.kernel.org>; Fri, 26 Nov 2021 07:45:15 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id i12so9325290pfd.6
        for <linux-next@vger.kernel.org>; Fri, 26 Nov 2021 07:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7z4GSDsZZfrBW4O3lrLzth/S7sFlYNKMEDtesMQKboA=;
        b=J1wu9U4rovvzme5erbiIcc3Eau03Jn9L9shgHby8XcqYV16S2rBgYhfiVFHluaARrR
         WNGDwjl2NYaoBPigcqjHBxx9a4AVEB2z161P3TVymOp6qPa5RQICsQYk6cCICHVMnuA5
         cGaS3KqYPN2voGqbbUW52woFg5F+kGoTwTReLyiT88BcA2t8UJF2TH2JzqEjaIKbBoQ/
         lpUWuWjX1CFoh6tJFqeehUAcRQYdhgkJMR46M0Y4pJtHji4cDP3T2j5rhtb1KJxTRkW5
         BxmO9gXqej2O5S3BbBDtSRqpJfpMaWAjNhMTwx9n8JM4lI4QDhSlKLRUsnsfJ0UajjJo
         cqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7z4GSDsZZfrBW4O3lrLzth/S7sFlYNKMEDtesMQKboA=;
        b=45qs1Gl/2h6M1EYgmF3A/84ccHtKJYoQnE/AWF/xmHqZuczk+2uYMh0e8sbfoejaai
         X1SwWLE3JqYno5mcujliWjWQA3vVcVDC9CHzgXMOyiSw1jr3BYenz2vLrQ43VKcVmrEQ
         cd+jI54BA7MU+WSeeGlbuEZPf/cytGWtjdbF0ucrljqyrm1SVNxBsg8paYSl5iJF7SpA
         fS/uAPXKhowY1t45KQBIrqjam25grE6K9zcM0Rt1T+gLMDyikTh5XCWBzrdttmUSGET8
         Gj+fAybniXZkEPKgrczXtR8lSKaKuazLJDI75bD8MGAEDBSqUAC2RcbEYbqxBHbY2/T6
         Y+sQ==
X-Gm-Message-State: AOAM531pEBJiUCBkGv94Yx4yzaPeEgb2kF0tgwWZ6BlTXg8nzjYaU6kH
        icMNENVWGCfJaaFSbMHQ1nDvQzfDzHJBVBU1
X-Google-Smtp-Source: ABdhPJwwv+aUNinVziE+dswSGmLxnCiK6AKdO6d2D9PsWZqlnCdeyUtE3pUbG8Z76VP6X1XWNkmgcA==
X-Received: by 2002:a63:7445:: with SMTP id e5mr2468725pgn.504.1637941513184;
        Fri, 26 Nov 2021 07:45:13 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p15sm5949939pjh.1.2021.11.26.07.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 07:45:12 -0800 (PST)
Message-ID: <61a10108.1c69fb81.2d75.fb15@mx.google.com>
Date:   Fri, 26 Nov 2021 07:45:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20211126
Subject: next/master baseline: 729 runs, 436 regressions (next-20211126)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 729 runs, 436 regressions (next-20211126)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

bcm2711-rpi-4-b              | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b              | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

bcm2711-rpi-4-b              | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b              | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig                    | 1          =

bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

bcm2711-rpi-4-b              | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | clang-13 | multi_=
v7_defconfig           | 1          =

d2500cc                      | x86_64 | lab-clabbe      | clang-13 | x86_64=
_defconfig             | 1          =

d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig             | 1          =

d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig+ima         | 1          =

d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig+debug       | 1          =

fsl-ls1028a-rdb              | arm64  | lab-nxp         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1028a-rdb              | arm64  | lab-nxp         | clang-13 | defcon=
fig                    | 1          =

fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-n4000-octopus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hsdk                         | arc    | lab-baylibre    | gcc-10   | hsdk_d=
efconfig               | 1          =

i945gsex-qs                  | i386   | lab-clabbe      | clang-10 | i386_d=
efconfig               | 1          =

i945gsex-qs                  | i386   | lab-clabbe      | clang-13 | i386_d=
efconfig               | 1          =

i945gsex-qs                  | i386   | lab-clabbe      | gcc-10   | i386_d=
efconfig               | 1          =

i945gsex-qs                  | i386   | lab-clabbe      | gcc-10   | i386_d=
efconfig+debug         | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6sll-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-13 | defcon=
fig                    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-13 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-13 | defcon=
fig                    | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | clang-13 | defcon=
fig                    | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig                    | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

qemu_i386                    | i386   | lab-baylibre    | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-broonie     | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-cip         | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora   | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-baylibre    | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-broonie     | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-cip         | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora   | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-cip         | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-cip         | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-cip         | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | clang-10 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-cip         | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | clang-13 | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-cip         | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-cip         | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211126/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211126
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f30a24ed97b401416118756fa35fbe5d28f999e3 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c13eb2f2a89cb0f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C433T=
A-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C433T=
A-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c13eb2f2a89=
cb0f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:12:47.819602  + KERNELCI_LAVA=3Dy /bin/sh /opt/kernelci/d=
mesg.sh
    2021-11-26T11:12:47.829620  <8>[   10.793933] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1d6b48a82eb85f2efa3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1d6b48a82e=
b85f2efa7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:15:20.597607  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   12.522305] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c323fce469f3bbf2efaf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c323fce469f=
3bbf2efb3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:20:46.400432  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:20:46.410145  <8>[   12.067566] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c633e0ad9b9e3af2efb5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-bcm2=
711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-bcm2=
711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c633e0ad9b9=
e3af2efb9
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce7ec42e7c0fc8f2efa6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce7ec42e7c0=
fc8f2efaa
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c61617b4af2d61f2efc8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-bc=
m2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-bc=
m2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c61717b4af2=
d61f2efcc
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce5ab0983cafe6f2efbd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce5bb0983ca=
fe6f2efc1
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbccdb35e1252df2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbccdb35e12=
52df2efab
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2b3d76d95f7aff2efbd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2b3d76d95f=
7aff2efc1
        new failure (last pass: next-20211124)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2711-rpi-4-b              | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbc8de8fcb127ff2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-bcm27=
11-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-bcm27=
11-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbc8de8fcb1=
27ff2efc5
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | clang-13 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ca29c6e1585ac8f2efbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0ca29c6e1585ac8f2e=
fbe
        new failure (last pass: next-20211125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
d2500cc                      | x86_64 | lab-clabbe      | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c308c5bbf876daf2efd6

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c308c5bbf87=
6daf2efda
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:20:31.738479  kern  :alert : cblist_init_generic: Setting=
 adjustable number of[   12.771906] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dal=
ert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:20:31.738788   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b7c92a96da06c9f2efa2

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b7c92a96da0=
6c9f2efa6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:32:16.326204  kern  :alert : cblist_init_generic: Setting=
 adjustable number of[   13.768183] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dal=
ert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:32:16.326559   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb9bb9d3d86aa6f2efb4

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb9bb9d3d86=
aa6f2efb8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:51.004411  kern  :alert : cblist_init_generic: Setting=
 adjustable number of[   12.578614] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dal=
ert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:48:51.004912   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd53951fa4c9dcf2efca

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd53951fa4c=
9dcf2efce
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:56:10.792871  kern  :alert : cblist_init_generic: Setting=
 adjustable number of[   13.002311] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dal=
ert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:56:10.793343   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf483730bc3454f2efc3

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf483730bc3=
454f2efc7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:04:31.426329  kern  :alert : cblist_init_generic: Setting=
 adjustable number of[   14.459738] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dal=
ert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:04:31.426786   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c164ec0c954daff2efe4

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c164ec0c954=
daff2efe8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:13:31.746617  kern  :alert : cblist_init_generic: Setting=
 adjustable number of[   13.693811] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dal=
ert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:13:31.746960   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
d2500cc                      | x86_64 | lab-clabbe      | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c291ba23332379f2efbb

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-clabbe/baseline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c291ba23332=
379f2efbf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:18:27.407275  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:27.615653  [   54.411230][  T182] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1028a-rdb              | arm64  | lab-nxp         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6efd2d4696a4ff2f014

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-fsl-ls1028=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-fsl-ls1028=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6efd2d4696=
a4ff2f018
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:36:52.494272  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   25.650192] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:36:52.494519   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1028a-rdb              | arm64  | lab-nxp         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cece15027e7109f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-nxp/baseline-fsl-ls1028a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cece15027e7=
109f2efaf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:10:41.785817  kern  :alert : cblist_init_generic: Setting=
 adju<8>[   21.150714] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:10:41.786087  stable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdd8572db652a1f2efa5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1028a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1028a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdd8572db65=
2a1f2efa9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:24.904410  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   24.997166] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:58:24.904832   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be78e50fb6c6bcf2efd2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1028a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1028a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be79e50fb6c=
6bcf2efd6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:52.244052  kern  :alert : cblist_init_generic: Setting=
 adju<8>[   21.823557] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:00:52.244323  stable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1028a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c405d4e9bca4bcf2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1028a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c405d4e9bca=
4bcf2efa3
        new failure (last pass: next-20211123)
        1 lines

    2021-11-26T11:24:34.553183  kern  :alert : cblist_init_generic: Setting=
 adju<8>[   23.489702] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:24:34.553360  stable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c396941f59053ef2ef9f

  Results:     17 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c396941f590=
53ef2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:22:49.397586  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:22:49.403946  <8>[   10.521750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-n4000-octopus    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c227988e593917f2f00d

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c227988e593=
917f2f011
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:16:34.256387  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   11.739745] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hsdk                         | arc    | lab-baylibre    | gcc-10   | hsdk_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdfa1f9dfd327ff2ef9f

  Results:     4 PASS, 1 FAIL, 1 SKIP
  Full config: hsdk_defconfig
  Compiler:    gcc-10 (arc-elf32-gcc (ARCompact/ARCv2 ISA elf32 toolchain -=
 build 581) 10.2.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arc/=
hsdk_defconfig/gcc-10/lab-baylibre/baseline-hsdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arc/=
hsdk_defconfig/gcc-10/lab-baylibre/baseline-hsdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arc/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdfa1f9dfd3=
27ff2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:51.098637  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:58:51.099319  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
i945gsex-qs                  | i386   | lab-clabbe      | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c380a5e0c8f4f7f2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-clabbe/baseline-i945gsex-qs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-clabbe/baseline-i945gsex-qs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c380a5e0c8f=
4f7f2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:22:21.134276  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues[   12.791427] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:22:21.134659  .   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
i945gsex-qs                  | i386   | lab-clabbe      | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ba6fad36fa91bff2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-clabbe/baseline-i945gsex-qs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-clabbe/baseline-i945gsex-qs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ba6fad36fa9=
1bff2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:43:40.040008  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues[   14.223984] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:43:40.040302  .   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
i945gsex-qs                  | i386   | lab-clabbe      | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb10531d553054f2efbd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-clabbe/baseline-i945gsex-qs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-clabbe/baseline-i945gsex-qs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb10531d553=
054f2efc1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:46:20.650098  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues[   14.231727] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:46:20.650373  .   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
i945gsex-qs                  | i386   | lab-clabbe      | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c0b05cbbb461f1f2efbb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-clabbe/baseline-i945gsex-qs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-clabbe/baseline-i945gsex-qs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c0b05cbbb46=
1f1f2efbf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:10:21.538931  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:10:21.617565  [   30.787199][  T181] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre    | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ccbf7275c6c3b0f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-baylibre/baseline-imx6q-var-dt6customboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ccc07275c6c=
3b0f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:01:45.256334  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:01:45.293306  <8>[   12.458228] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6sll-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cd8c3078e4b324f2f00a

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cd8c3078e4b=
324f2f00e
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:05:16.471604  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:05:16.503588  <8>[   21.680038] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cda3fda765b13ff2efc9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cda3fda765b=
13ff2efcd
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:05:28.804190  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:05:28.858648  <8>[   33.297838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ccc486a4bd0119f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ccc486a4bd0=
119f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:01:58.288321  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:01:58.318382  <8>[   20.891116] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be023f181886c6f2f002

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm/=
multi_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0be023f181886c6f2f=
003
        new failure (last pass: next-20211125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cddd73aff30225f2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cddd73aff30=
225f2efbb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:06:38.276215  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:06:38.344018  <8>[   89.341650] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c69d4eaf5021a0f2efa2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c69d4eaf502=
1a0f2efa6
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cf5f866e030a2cf2efa4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cf5f866e030=
a2cf2efa8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:12:46.504759  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   10.510286] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:12:46.506132   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6ecd2d4696a4ff2f00a

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6ecd2d4696=
a4ff2f00e
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:36:41.467922  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:36:41.469057  <8>[   14.512548] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cea49914ddd4d1f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cea49914ddd=
4d1f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:54.383385  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.660749] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bddcfb601baebdf2efbb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-=
ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bddcfb601ba=
ebdf2efbf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:20.434323  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:58:20.436889  <8>[   10.501822] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be8f43051c4576f2eff7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be8f43051c4=
576f2effb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:01:08.987744  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:01:08.990172  <8>[   10.438696] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c43222b9b770b9f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c43322b9b77=
0b9f2efbc
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:25:15.122834  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   10.494104] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:25:15.124025   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc3432a5fab66bf2efcc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc3432a5fab=
66bf2efd0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:51:14.040108  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:51:14.041205  <8>[   15.139218] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc3732a5fab66bf2efd6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc3732a5fab=
66bf2efda
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c301c5bbf876daf2efc6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c301c5bbf87=
6daf2efca
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:20:06.504066  <8>[   14.882243] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c65d3cc4c6b114f2efd4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c65d3cc4c6b=
114f2efd8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:34:38.315703  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.009692] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:34:38.316030   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ceb89aa1d38c9df2efe1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ceb89aa1d38=
c9df2efe5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:10:13.520687  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.477869] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:10:13.521046   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bce92e368fb1f3f2efdc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bce92e368fb=
1f3f2efe0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:14.196978  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.463488] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:54:14.197283   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd9dfdc3095ab7f2efe0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd9dfdc3095=
ab7f2efe4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:16.736845  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.463865] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:57:16.736987   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c4a47b9120322ef2efae

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c4a47b91203=
22ef2efb2
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:27:14.348024  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.012524] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c63e8eb177fd8df2f037

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c63e8eb177f=
d8df2f03b
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:34:13.950047  kern  :alert : cblist_init_generic: Setting=
 adju<8>[   10.398976] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce39e62ceb2925f2ef9f

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce39e62ceb2=
925f2efa3
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bea8bacc275540f2efa8

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bea8bacc275=
540f2efac
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:01:37.071260  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.814890] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf84f03314bd2bf2efb2

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf84f03314b=
d2bf2efb6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:05:17.468800  kern  :alert : cblist_init_generic: Setting=
 adju<8>[   13.779249] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c57503ac695dfbf2efd0

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c57503ac695=
dfbf2efd4
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:30:51.265240  kern  :alert : cblist_init_generic: Setting=
 adju<8>[   12.929414] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6cacd1e3c0d6af2efab

  Results:     100 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6cacd1e3c0=
d6af2efaf
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cec39914ddd4d1f2efb6

  Results:     100 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cec39914ddd=
4d1f2efba
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be6bf72703bef8f2f004

  Results:     100 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be6bf72703b=
ef8f2f008
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf98f6e1b40b1bf2efa7

  Results:     100 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf98f6e1b40=
b1bf2efab
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6025c2be45ae6f2efc4

  Results:     100 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6025c2be45=
ae6f2efc8
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:33:10.820474  kern  :alert : cblist_init_generic: Setting=
 adju<8>[    9.876217] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3D=
fail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c60970b568f0e0f2efb2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c60970b568f=
0e0f2efb6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:12.128448  <8>[   15.492912] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce3ccdf40db082f2efdc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce3ccdf40db=
082f2efe0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:16.465107  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:08:16.477877  <8>[   15.466338] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc912d6e4a0e7cf2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc912d6e4a0=
e7cf2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:52:46.870140  <8>[   15.429422] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bce1a8d40c8177f2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bce1a8d40c8=
177f2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:06.428024  <8>[   15.454064] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:54:06.428326  <8>[   15.474975] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:54:06.428563  + set +x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2822dae566b08f2efbe

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2822dae566=
b08f2efc2
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:10.324388  <8>[   15.488922] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c618f0a889e5d6f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c618f0a889e=
5d6f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:33.069190  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:33:33.077936  <8>[   15.075119] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce661d3ecb4f7ef2efc6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce661d3ecb4=
f7ef2efca
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:43.925532  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:08:43.925820  <8>[   14.978937] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcb7e80940d1bbf2efb4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcb7e80940d=
1bbf2efb8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:53:27.417028  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:53:27.426317  <8>[   14.999161] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd2efda664b370f2efb0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd2efda664b=
370f2efb4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:27.192185  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:27.192371  <8>[   14.981324] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1f486eafc505ff2f09d

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1f486eafc5=
05ff2f0a1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:15:50.945880  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:15:51.173745  <8>[   50.486305][  T239] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2942dae566b08f2efe0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2942dae566=
b08f2efe4
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:29.421543  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:29.421755  <8>[   14.938454] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c60b17b4af2d61f2efb1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c60b17b4af2=
d61f2efb5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:12.800776  <8>[   15.421278] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce62a3459c94a1f2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce62a3459c9=
4a1f2efb7
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb9fb9d3d86aa6f2efc4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb9fb9d3d86=
aa6f2efc8
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc05d2b7746ebaf2efce

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc05d2b7746=
ebaf2efd2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:50:31.424417  <8>[   15.462861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2842dae566b08f2efcd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2842dae566=
b08f2efd1
        new failure (last pass: next-20211124)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0efe1451269f181f2efad

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0efe1451269f=
181f2efb1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T14:30:36.502582  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T14:30:36.504271  <8>[   15.295896] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c61b2ead341df8f2efb9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c61c2ead341=
df8f2efbd
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:40.383219  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:33:40.383750  <8>[   15.153120] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce36a90639b423f2efc8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce36a90639b=
423f2efcc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:13.712488  <8>[   15.136400] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:08:13.713030  <8>[   15.154563] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T12:08:13.713389  + set +<8>[   15.158216] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 5084559_1.5.2.4.1>
    2021-11-26T12:08:13.713726  x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cabe74ce321c8af2f013

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cabe74ce321=
c8af2f017
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:53:18.926642  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:53:18.928358  <8>[   16.035125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cfab4e7699091bf2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cfab4e76990=
91bf2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:14:11.808856  <8>[   16.086016] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ed77b5634876f3f2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ed77b563487=
6f3f2efbb
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T14:21:22.529273  <8>[   15.919808] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb9060b80f1932f2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb9060b80f1=
932f2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:30.324527  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:48:30.325074  <8>[   15.238966] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:48:30.325456  <8>[   15.260487] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:48:30.325808  + set<8>[   15.263972] <LAVA_SIGNAL_ENDRUN =
0_dmesg 5083257_1.5.2.4.1>
    2021-11-26T10:48:30.326153   +x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bba1de8fcb127ff2efa8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bba1de8fcb1=
27ff2efad
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:44.449911  <8>[   15.111430] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:48:44.450293  <8>[   15.128870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:48:44.450481  + set +<8>[   15.132545] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 5083280_1.5.2.4.1>
    2021-11-26T10:48:44.450673  x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2796554bf932ef2efa1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2796554bf9=
32ef2efa5
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:10.104507  <8>[   15.898633] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:18:10.105058  <8>[   15.915663] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:18:10.105422  + set +x
    2021-11-26T11:18:10.105755  <8>[   15.919733] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 5083680_1.5.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c60870b568f0e0f2efa8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c60870b568f=
0e0f2efac
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:08.246776  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:33:08.247901  <8>[   15.016484] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce648b96e5bba3f2efe4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce648b96e5b=
ba3f2efe8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:51.437690  <8>[   15.001779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:08:51.437956  <8>[   15.021290] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T12:08:51.438136  + set +<8>[   15.024977] <LAVA_SIGNAL_ENDRU=
N 0_dmesg 1148943_1.5.2.4.1>
    2021-11-26T12:08:51.438300  x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbc94035d8852cf2efc5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbc94035d88=
52cf2efc9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:49:21.010053  kern  :alert : cblist_init_generic: Setting=
 adjustable number of <8>[   14.975074] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2c02e961a2f4ff2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2c02e961a2=
f4ff2efbb
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:19:10.805930  <8>[   14.976360] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:19:10.806150  <8>[   14.994511] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:19:10.806327  + set +x
    2021-11-26T11:19:10.806482  <8>[   14.999332] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1148323_1.5.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cbcf5d392bdc43f2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cbcf5d392bd=
c43f2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:57:40.285938  <8>[   15.163195] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d1c19caac906cbf2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d1c19caac90=
6cbf2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:23:04.112058  <8>[   15.135629] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcf257af793db1f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcf357af793=
db1f2efaf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:20.884162  <8>[   16.164754] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bee70d1887f69df2efb6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bee70d1887f=
69df2efba
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:41.619500  <8>[   15.249122] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf5f1a8cc6cd7cf2efa1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf5f1a8cc6c=
d7cf2efa5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:04:39.284410  <8>[   15.110484] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1ce85e5d23f45f2efbd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1ce85e5d23=
f45f2efc1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:14:53.013301  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:14:53.214360  <8>[   44.853878][  T237] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2aca22b5940b9f2efb4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2aca22b594=
0b9f2efb8
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:37.114295  <8>[   15.139098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d22ff85605af54f2efbd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d22ff85605a=
f54f2efc1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:24:50.849866  <8>[   15.119992] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0de63c128622cd2f2efe3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0de63c128622=
cd2f2efe7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:17:03.746565  <8>[   15.058409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf2fef08104e9bf2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf2fef08104=
e9bf2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:03:55.369409  <8>[   16.139503] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c3041755dffe9cf2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c3041755dff=
e9cf2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:20:15.302706  <8>[   15.064177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c4588bead0cc4af2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c4588bead0c=
c4af2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:25:52.745583  <8>[   15.096477] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cfc2a726531035f2efbf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cfc2a726531=
035f2efc3
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T12:14:37.908184  <8>[   15.132175] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c641943e22a662f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c641943e22a=
662f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:34:05.960225  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:34:05.961511  <8>[   15.878273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce769304afadddf2efb1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce769304afa=
dddf2efb5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:01.595874  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:09:01.596956  <8>[   15.715760] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bac4e6029e4654f2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bac4e6029e4=
654f2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:02.904202  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:45:02.905249  <8>[   15.701549] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bce109361737e9f2efa9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bce10936173=
7e9f2efad
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:13.458459  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:54:13.459452  <8>[   15.923727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd5a7aa8a14d66f2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd5a7aa8a14=
d66f2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:56:12.156623  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:56:12.157644  <8>[   15.674832] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2bd2e961a2f4ff2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2bd2e961a2=
f4ff2efa3
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:56.557092  <8>[   15.698518] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cd16026292ab6ff2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cd16026292a=
b6ff2efbb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:03:23.702969  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:03:23.704681  <8>[   15.685085] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d68c21118dd6bef2efba

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d68c21118dd=
6bef2efbe
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:43:42.894307  <8>[   15.489245] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be6423eb762617f2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be6423eb762=
617f2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:29.513968  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:00:29.514992  <8>[   16.408230] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c24c1a765ca860f2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c24c1a765ca=
860f2efab
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:17:18.049694  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:17:18.051366  <8>[   15.539521] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c455d900f29bd4f2efd7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c455d900f29=
bd4f2efdb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:25:50.730772  <8>[   15.621874] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cb5e0a31876ec8f2efb6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cb5e0a31876=
ec8f2efba
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:56:02.924122  <8>[   15.541703] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6436a87b29b45f2f023

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6436a87b29=
b45f2f027
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:34:06.964259  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:34:06.965523  <8>[   15.766018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce76a3459c94a1f2efde

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce76a3459c9=
4a1f2efe2
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c638e0ad9b9e3af2efc3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c638e0ad9b9=
e3af2efc7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:52.473674  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:33:52.479167  <8>[   15.679694] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bac2e6029e4654f2efb2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bac2e6029e4=
654f2efb6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:04.851076  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:45:04.851550  <8>[   15.570732] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb9ec0432696bdf2efbf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb9ec043269=
6bdf2efc3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:52.166366  <8>[   15.790450] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:48:52.166603  <5>[   15.792963] random: fast init done   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbc9de8fcb127ff2efcd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbc9de8fcb1=
27ff2efd1
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2be2e961a2f4ff2efa9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2be2e961a2=
f4ff2efad
        new failure (last pass: next-20211124)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0baf7e0e5eb6235f2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0baf7e0e5eb6=
235f2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:57.658165  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:45:57.658480  <8>[   15.619634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcd741b40b2ed3f2efc6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcd741b40b2=
ed3f2efca
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:53:51.565762  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:53:51.566098  <8>[   15.694318] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd4fd735504c00f2efd7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl-=
s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd4fd735504=
c00f2efdb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:48.723689  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:48.724019  <8>[   15.683602] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2efbdc54397c6f2f017

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2efbdc5439=
7c6f2f01b
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:19:55.806679  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:19:55.807054  <8>[   15.668066] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ed8e293251a4bbf2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ed8e293251a=
4bbf2efaf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T14:21:37.613250  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T14:21:37.614953  <8>[   15.815079] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fd171ce6e420a318f6d7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fd171ce6e42=
0a318f6de
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T15:28:01.010799  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:28:01.012826  <8>[   15.501538] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5e53205854480f2f019

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5e53205854=
480f2f01d
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:32:27.940935  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:32:27.942761  <8>[   16.530417] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d0874a4939519ef2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d0874a49395=
19ef2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:17:58.794766  <8>[   16.074643] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T12:17:58.818606  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:17:58.820281  <8>[   16.104318] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d8461a3713cc1df2efea

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d8461a3713c=
c1df2efee
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:51:00.272628  <8>[   15.990775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0e8d8cfd6b4f672f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0e8d8cfd6b4f=
672f2efaf
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T14:01:29.972633  <8>[   15.353819] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0e50a0d83df71bdf2efad

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0e50a0d83df7=
1bdf2efb1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:45:19.685659  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:45:19.689272  <8>[   15.690822] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fec73a59be30e418f6d3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fec73a59be3=
0e418f6da
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T15:35:08.504961  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:35:08.507437  <8>[   15.494556] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2c901426ba5e9f2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2c901426ba=
5e9f2efb0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:19:18.028676  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:19:18.031759  <8>[   15.389338] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c9e72f57bf6faaf2efa2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c9e72f57bf6=
faaf2efa6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:49:30.525304  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:49:30.540745  <8>[   15.592969] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cfaf71651be3b9f2efa1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
m-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cfaf71651be=
3b9f2efa5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:14:14.477487  <8>[   15.433557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0e199e8bb407055f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0e199e8bb407=
055f2efaf
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T13:30:40.272920  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:30:40.274738  <8>[   15.456416] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6553cc4c6b114f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6553cc4c6b=
114f2efaf
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce67a971f65f66f2efa2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce67a971f65=
f66f2efa6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:46.678269  <8>[   15.454193] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bad7534a29d77bf2eff6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bad7534a29d=
77bf2effa
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:26.769656  <8>[   15.296274] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:45:26.769861  <8>[   15.315368] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:45:26.770027  + set +x
    2021-11-26T10:45:26.770184  <8>[   15.320260] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1147928_1.5.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb62e2c8702878f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb62e2c8702=
878f2efbc
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T10:47:45.640430  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:47:45.676497  <8>[   15.372281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbc74035d8852cf2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbc74035d88=
52cf2efbc
        new failure (last pass: next-20211123)
        1 lines

    2021-11-26T10:49:31.054381  <8>[   15.515247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:49:31.054608  <8>[   15.534140] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:49:31.054773  + set +x<8>[   15.537959] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1147973_1.5.2.4.1>
    2021-11-26T10:49:31.054928     =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbdadb35e1252df2efba

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbdadb35e12=
52df2efbe
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:49:40.846522  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:49:40.858614  <8>[   16.201968] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2e4bdc54397c6f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2e4bdc5439=
7c6f2efa3
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:19:40.438159  <8>[   16.190433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6421a500124a2f2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6421a50012=
4a2f2efbb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:34:11.610111  <8>[   15.389700] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:34:11.610409  <8>[   15.408871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:34:11.610588  + set +x
    2021-11-26T11:34:11.610754  <8>[   15.413427] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1148467_1.5.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce68a971f65f66f2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce68a971f65=
f66f2efb0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:00.483802  <8>[   15.595474] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:09:00.484072  <8>[   15.615557] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T12:09:00.484243  + set +x<8>[   15.619471] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1148953_1.5.2.4.1>
    2021-11-26T12:09:00.484401     =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb76e2c8702878f2f03c

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb76e2c8702=
878f2f040
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T10:48:08.680540  <8>[   15.273322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:48:08.680843  <8>[   15.291478] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:48:08.681045  + set <8>[   15.295041] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 1147956_1.5.2.4.1>
    2021-11-26T10:48:08.681231  +x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc038d522abd98f2efbf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc038d522ab=
d98f2efc3
        new failure (last pass: next-20211118)
        1 lines

    2021-11-26T10:50:21.673204  <8>[   15.403880] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:50:21.673427  <8>[   15.422357] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:50:21.673601  + set +x
    2021-11-26T10:50:21.673753  <8>[   15.427044] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1147997_1.5.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc8f2d6e4a0e7cf2efa9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc8f2d6e4a0=
e7cf2efad
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:52:41.239609  <8>[   15.456359] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:52:41.239878  <8>[   15.475065] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:52:41.240056  + set +x<8>[   15.478969] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1148013_1.5.2.4.1>
    2021-11-26T10:52:41.240218     =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2bca22b5940b9f2efda

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2bca22b594=
0b9f2efde
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:19:10.712562  <8>[   15.326718] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:19:10.712787  <8>[   15.346770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:19:10.712925  + set +x
    2021-11-26T11:19:10.713048  <8>[   15.351575] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1148305_1.5.2.4.1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fde7fae2714f4018f6c7

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-minnowboard-turbot-E382=
6.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-minnowboard-turbot-E382=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fde8fae2714=
f4018f6cb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T15:30:42.878563  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:30:42.879061  [   10.085330] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fb28cb16635b37f2ef9f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3826.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3826.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fb28cb16635=
b37f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T15:19:50.880105  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:19:50.880650  [   17.134105] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fb907b1a70517e18f6ca

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fb907b1a705=
17e18f6d1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T15:21:23.028668  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:21:23.028870  [   10.742018] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fc0d64e4c10ab618f6e1

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-minnowboard=
-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-minnowboard=
-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fc0d64e4c10=
ab618f6e8
        new failure (last pass: next-20211112)
        1 lines

    2021-11-26T15:23:35.779344  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:23:35.779837  [   10.836644] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fcdfb2b899851918f6d3

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-minnowboar=
d-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-minnowboar=
d-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fcdfb2b8998=
51918f6da
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T15:27:12.115143  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:27:12.115670  [   17.908551] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0fdaaec64a987f618f6da

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0fdaaec64a98=
7f618f6e1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T15:30:15.539096  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T15:30:16.119947  [   95.136153][  T175] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6917ccafde2fbf2eff2

  Results:     18 PASS, 11 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6917ccafde=
2fbf2eff6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:35:19.493572  <8>[   64.825473] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:35:19.516268  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   64.848862] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce71a971f65f66f2efc0

  Results:     18 PASS, 11 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce71a971f65=
f66f2efc4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:04.397901  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.985142] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd22bb46a077cdf2efb3

  Results:     18 PASS, 11 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd22bb46a07=
7cdf2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:07.710609  <8>[   64.380578] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be23ed6018fd19f2efd1

  Results:     18 PASS, 11 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be23ed6018f=
d19f2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:59:14.104479  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.350650] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c37ceb91b1c0ecf2efb6

  Results:     18 PASS, 11 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c37ceb91b1c=
0ecf2efba
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:22:18.306328  <8>[   15.347808] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:22:18.330895  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.373741] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c64b3cc4c6b114f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-mt81=
83-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-mt81=
83-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c64b3cc4c6b=
114f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:34:26.475951  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.427161] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:34:26.476185   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce728168d5f87ff2efaf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sk=
u16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sk=
u16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce728168d5f=
87ff2efb3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:03.953650  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.277752] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:09:03.954056   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb8d60b80f1932f2efb4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb8d60b80f1=
932f2efb8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:28.473887  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.410262] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:48:28.474117   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbae1c41b1e77ef2efce

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-mt8183-=
kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbae1c41b1e=
77ef2efd2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:49.250800  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.254819] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:48:49.251395   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c28ceddff4ef20f2efb0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku1=
6.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku1=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c28ceddff4e=
f20f2efb4
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:26.660634  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   15.144921] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:18:26.661106   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6c724ba317ea9f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-qc=
om-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-qc=
om-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6c724ba317=
ea9f2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:36:16.251251  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback q[   20.112866] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:36:16.251520  ueues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d80b9b88d06bd0f2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d80b9b88d06=
bd0f2efb0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:49:59.524841  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback q[   20.208167] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:49:59.525181  ueues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc05d2b7746ebaf2efd8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc05d2b7746=
ebaf2efdc
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T10:50:40.819254  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback q[   20.158587] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:50:40.819536  ueues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd31d735504c00f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd32d735504=
c00f2efaf
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be49fefa92635df2efb0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom-=
qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom-=
qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be49fefa926=
35df2efb4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:21.281740  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback q[   20.241845] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c37fa5e0c8f4f7f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c37fa5e0c8f=
4f7f2efbc
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:22:16.328057  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback q[   20.228749] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c8d5245815464ef2efa1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c8d52458154=
64ef2efa5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:45:06.050492  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:45:06.144941  <8>[   16.117525] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d1fae084a4d432f2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d1fbe084a4d=
432f2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:24:10.745615  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:24:10.848672  <8>[   16.605667] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce3de62ceb2925f2f00a

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce3de62ceb2=
925f2f00e
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:05.445852  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:08:05.639637  <8>[   70.425939] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0dac02f6398e068f2efdd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0dac02f6398e=
068f2efe1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:01:29.860774  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:01:30.496852  <8>[  107.160630] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0caf2f50e459847f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0caf2f50e459=
847f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:54:07.202896  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:54:07.251525  <8>[    9.299218] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d2220bbffe339bf2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d2220bbffe3=
39bf2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:24:48.532324  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:24:48.588631  <8>[    9.349712] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5e75fdc20c4f3f2efa5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5e75fdc20c=
4f3f2efa9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:32:31.665994  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:32:31.704707  <8>[    7.087263] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce84c42e7c0fc8f2efbe

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce84c42e7c0=
fc8f2efc2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:14.370014  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:09:14.415042  <8>[    7.771204] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd587aa8a14d66f2efc7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd587aa8a14=
d66f2efcb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:56:04.233469  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:56:04.334758  <8>[   16.666497] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd978d222b0587f2efb1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd978d222b0=
587f2efb5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:04.662475  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c552810a70eabbf2efa1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c552810a70e=
abbf2efa5
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:30:07.011838  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:30:07.115381  <8>[   16.866655] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bde754d41db794f2efa4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bde754d41db=
794f2efa8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:25.339132  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:58:25.517840  <8>[   82.045482] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be7179ebdd3b0af2efe1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be7179ebdd3=
b0af2efe5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:27.779897  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:00:28.367827  <8>[   76.076358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c9b54c5ce77653f2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c9b54c5ce77=
653f2efb0
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:48:31.693180  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd9dfdc3095ab7f2efed

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd9dfdc3095=
ab7f2eff1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:07.863021  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:57:07.910517  <8>[    9.037835] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be3dd3b3f8f499f2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be3dd3b3f8f=
499f2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:59:47.455788  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:59:47.487162  <8>[    6.575393] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c7e87ded4ddcf6f2f033

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c7e87ded4dd=
cf6f2f037
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:41:08.012470  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:41:08.086452  <8>[   32.068426] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbf98d522abd98f2efaf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbf98d522ab=
d98f2efb3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:50:12.570504  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:50:12.613876  <8>[    9.002347] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc2c94b167fbf1f2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc2c94b167f=
bf1f2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:51:00.160888  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:51:00.205466  <8>[    8.911646] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2b2d76d95f7aff2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2b2d76d95f=
7aff2efb7
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:19:01.710615  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:19:01.750581  <8>[    7.243000] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c8ae9d44feda5ff2efb6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c8ae9d44fed=
a5ff2efba
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:44:32.799893  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:44:32.895600  <8>[   18.815539] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d24d9052d8b8aaf2effb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d24d9052d8b=
8aaf2efff
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:25:19.241377  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:25:19.375356  <8>[   22.167376] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce29cdf40db082f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce29cdf40db=
082f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:07:39.529405  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:07:39.812377  <8>[   61.648267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0dafc0caaac82a4f2efc0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0dafc0caaac8=
2a4f2efc4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:02:18.304571  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:02:18.632213  <8>[  100.089580] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cb4781170aef67f2efb0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cb4781170ae=
f67f2efb4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:55:35.504704  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:55:35.559166  <8>[    9.492267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d25e74c159ce72f2efdd

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d25e74c159c=
e72f2efe1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:25:53.709512  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:25:53.782024  <8>[   12.568510] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5e95fdc20c4f3f2efb2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5e95fdc20c=
4f3f2efb6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:32:39.557900  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:32:39.604086  <8>[    9.610176] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce86c42e7c0fc8f2efcc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce86c42e7c0=
fc8f2efd0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:19.146048  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:09:19.199716  <8>[   10.137031] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd577aa8a14d66f2efbb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd577aa8a14=
d66f2efbf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:52.898564  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:53.015611  <8>[   21.795322] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdbeef6eb9693ef2efa6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdbeef6eb96=
93ef2efaa
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:33.969255  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:57:34.106351  <8>[   22.742187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5146122f585f7f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5146122f58=
5f7f2efa4
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:28:55.452271  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:28:55.589062  <8>[   22.792995] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bde5572db652a1f2f020

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bde5572db65=
2a1f2f024
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:26.206414  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:58:26.372921  <8>[   70.074038] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be8543051c4576f2efd9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be8543051c4=
576f2efdd
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:57.842998  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:00:58.113862  <8>[   71.523727] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c8b18c0ce8817af2efd6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c8b18c0ce88=
17af2efda
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:44:05.992805  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:44:06.584810  <8>[  112.121192] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd32d735504c00f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd32d735504=
c00f2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:34.247615  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:34.306231  <8>[   11.714877] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdbfa0f726c194f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdbfa0f726c=
194f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:42.566763  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:57:42.638112  <8>[   12.683333] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6ea5a56dce5fff2efc8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6ea5a56dce=
5fff2efcc
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:36:47.745379  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:36:47.788009  <8>[    8.375321] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbe5db35e1252df2efce

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbe5db35e12=
52df2efd2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:49:56.218674  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:49:56.276907  <8>[   11.264389] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc4032a5fab66bf2efe3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc4032a5fab=
66bf2efe7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:51:29.497931  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:51:29.559452  <8>[   11.624582] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2676c853f51a3f2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2676c853f5=
1a3f2efbb
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:17:40.137489  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:17:40.189612  <8>[    9.775848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c926f7aa28f6dcf2efcb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c926f7aa28f=
6dcf2efcf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:46:27.327941  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:46:27.425917  <8>[   16.258903] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d1e6172cea6c20f2f009

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d1e7172cea6=
c20f2f00d
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:23:50.204450  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:23:50.306712  <8>[   16.370925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cea16135eee9a8f2efbf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cea16135eee=
9a8f2efc3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:49.940869  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:09:50.368810  <8>[   74.531378] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0da34b7e84d0236f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0da34b7e84d0=
236f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:59:14.880241  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:59:15.181868  <8>[   52.992496] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cb2e2988b3607af2f02d

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cb2e2988b36=
07af2f031
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:55:06.326022  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:55:06.377385  <8>[    9.351110] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d23d9c3dd91849f2efba

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d23d9c3dd91=
849f2efbe
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:25:19.207398  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:25:19.239736  <8>[    6.351098] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6172ead341df8f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6172ead341=
df8f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:13.615981  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:33:13.670283  <8>[    8.624440] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce37cdf40db082f2efcb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce37cdf40db=
082f2efcf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:07:58.079019  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:07:58.129657  <8>[   10.240302] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd1bbb46a077cdf2efa6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd1bbb46a07=
7cdf2efaa
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:04.068232  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:04.167666  <8>[   16.410452] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bde3572db652a1f2efb6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bde3572db65=
2a1f2efba
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:25.748478  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:58:25.855300  <8>[   17.322902] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c529997f536501f2efa3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c529997f536=
501f2efa7
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:29:26.719900  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:29:26.823667  <8>[   16.728730] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdd1b2cf8b8137f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdd1b2cf8b8=
137f2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:08.324743  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:58:08.772779  <8>[   89.589472] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bee90d1887f69df2efd4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bee90d1887f=
69df2efd8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:46.934604  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:02:47.246724  <8>[   71.194300] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c98c0406aa859ef2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c98c0406aa8=
59ef2efae
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:48:04.176841  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd9c8d222b0587f2efce

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd9c8d222b0=
587f2efd2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:56:59.889581  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:56:59.937628  <8>[   11.052828] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be6179ebdd3b0af2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be6179ebdd3=
b0af2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:26.491109  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:00:26.565998  <8>[   13.290921] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c76170c23b013cf2efc8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c76170c23b0=
13cf2efcc
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:38:54.104506  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:38:54.135466  <8>[    6.433007] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb98b9d3d86aa6f2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb98b9d3d86=
aa6f2efab
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:33.368364  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:48:33.410096  <8>[    8.074526] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc88d305b0166ef2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc88d305b01=
66ef2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:52:30.342731  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:52:30.382500  <8>[    7.513535] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2926554bf932ef2efcb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2926554bf9=
32ef2efcf
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:19.530416  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:19.570173  <8>[    7.220439] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c8fdb0fd0e1ee2f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c8fdb0fd0e1=
ee2f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:45:53.038891  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:45:53.136038  <8>[   18.950252] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d24b9052d8b8aaf2efe7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d24b9052d8b=
8aaf2efeb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:25:18.704364  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:25:18.864731  <8>[   22.128242] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce51e62ceb2925f2f075

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce51e62ceb2=
925f2f079
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:33.432112  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:08:33.680524  <8>[   48.966726] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0dae874e8a1d156f2efa8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0dae874e8a1d=
156f2efac
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:02:07.818582  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:02:08.439546  <8>[  115.568263] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cb342988b3607af2f040

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cb342988b36=
07af2f044
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:55:15.915272  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:55:15.962377  <8>[   11.083844] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d298ee9eaf833cf2efdf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d298ee9eaf8=
33cf2efe3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:26:33.331221  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:26:33.399232  <8>[   13.177273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5e85c2be45ae6f2efa2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5e85c2be45=
ae6f2efa6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:32:35.399258  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:32:35.441626  <8>[    7.637543] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce852380a3accff2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce852380a3a=
ccff2efab
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:19.799564  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:09:19.853040  <8>[   10.021938] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd43951fa4c9dcf2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd43951fa4c=
9dcf2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:33.393232  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:33.512329  <8>[   21.750268] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdbf559a4997a1f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdbf559a499=
7a1f2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:33.533586  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:57:33.671593  <8>[   22.536501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c53f41c05448a4f2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c53f41c0544=
8a4f2efb7
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:29:35.486139  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:29:35.623807  <8>[   22.328654] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdd2fb601baebdf2efa9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdd2fb601ba=
ebdf2efad
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:55.236780  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:57:55.560822  <8>[   77.348545] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be8743051c4576f2efe3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be8743051c4=
576f2efe7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:59.502740  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:00:59.775526  <8>[   74.638489] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c9b491996d3f6af2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c9b491996d3=
f6af2efa4
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:48:34.715527  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:48:35.002477  <8>[   99.738154] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdc0559a4997a1f2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-v=
irt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bdc0559a499=
7a1f2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:57:51.676905  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:57:51.747795  <8>[   32.135048] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be11ed6018fd19f2efb5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be11ed6018f=
d19f2efb9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:59:01.570652  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:59:01.634579  <8>[   12.083265] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c774541da16896f2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c774541da16=
896f2efbb
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:39:01.683253  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:39:01.745147  <8>[   13.424316] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bbbb1c41b1e77ef2efec

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bbbb1c41b1e=
77ef2eff0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:49:22.380274  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:49:22.433724  <8>[   11.114238] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc735dd4305d8ff2efc0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc735dd4305=
d8ff2efc4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:52:15.532563  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:52:15.593391  <8>[   11.497746] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2531db853a945f2efc8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2531db853a=
945f2efcc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:17:01.418241  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:17:03.882082  <8>[  252.046174][  T190] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2b1d76d95f7aff2efa9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2b1d76d95f=
7aff2efad
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:42.994684  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:43.047510  <8>[    9.336045] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-baylibre    | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5b4445f8ac6f8f2efbe

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5b4445f8ac=
6f8f2efc2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:31:51.696088  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:31:51.700123  <8>[    1.999223] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie     | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0caa428d36bc5e1f2efbf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0caa428d36bc=
5e1f2efc3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:52:46.636884  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:52:46.780205  <8>[   16.977077] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-cip         | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c801f66a876934f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c801f66a876=
934f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:41:28.916099  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:41:28.949098  <8>[    5.276787] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora   | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c354ead45a64a6f2f034

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c354ead45a6=
4a6f2f038
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:21:37.182693  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-baylibre    | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ba4b5cf219462ef2efcf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ba4b5cf2194=
62ef2efd3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:43:09.137602  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:43:09.141553  <8>[    1.978360] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie     | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb00b4e34cfdcff2efad

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb00b4e34cf=
dcff2efb1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:46:04.876355  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:46:04.925454  <8>[   14.282754] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-cip         | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0baa06439cd2037f2efd0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0baa06439cd2=
037f2efd4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:44:24.052161  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:44:24.109362  <8>[    7.601506] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora   | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ba4a96886cc5daf2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ba4a96886cc=
5daf2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:42:54.702705  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bae994ed611ce9f2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bae994ed611=
ce9f2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:49.363590  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c21dc1c9385b29f2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c21dc1c9385=
b29f2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:16:34.469860  <8>[    5.417242][  T176] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:16:34.510307  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:16:34.530591  <8>[    5.478975][  T183] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb65e2c8702878f2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb65e2c8702=
878f2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:47:53.566567  <8>[   12.268729] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:47:53.702789  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:47:53.734425  <8>[   12.437686] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c55358e6fbede4f2efc3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c55358e6fbe=
de4f2efc7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:29:58.995218  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:29:59.778036  <8>[  158.915779][  T180] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-cip         | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0baef94ed611ce9f2efdc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0baef94ed611=
ce9f2efe0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:44.830374  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:45:44.884659  <8>[    8.147513] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-cip         | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c35efde2742103f2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c35efde2742=
103f2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:21:41.541430  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:21:42.018131  <8>[   85.320554][  T175] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bad7534a29d77bf2efea

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bad7534a29d=
77bf2efee
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:32.466507  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:45:32.468770  <8>[    1.705672] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c06dbe22e6f9a1f2efbb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c06dbe22e6f=
9a1f2efbf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:09:08.059438  <8>[    4.297807][  T172] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:09:08.083552  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c58e2ccb942a89f2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c58e2ccb942=
a89f2efab
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:31:15.464249  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:31:15.468480  <8>[    2.317491] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ca438c228f7012f2efcf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ca438c228f7=
012f2efd3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:51:19.032498  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:51:19.094745  <8>[   12.030615] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-cip         | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c810f66a876934f2efb5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c810f66a876=
934f2efb9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:41:44.414945  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:41:44.461839  <8>[    7.420190] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | clang-10 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c350e6f84c92f2f2efa2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c350e6f84c9=
2f2f2efa6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:21:41.421870  <8>[    2.505701] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:21:41.433956  <4>[    2.516524] clocksource: timekeeping =
watchdog on CPU0: hpet read-back delay of 53460ns, attempt 4, awaiting re-i=
nitialization
    2021-11-26T11:21:41.446698  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ba7196886cc5daf2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ba7196886cc=
5daf2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:43:50.154953  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:43:50.158933  <8>[    2.125631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb15b4e34cfdcff2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb15b4e34cf=
dcff2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:46:15.172570  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:46:15.260189  <8>[   16.520613] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-cip         | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bac8534a29d77bf2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bac9534a29d=
77bf2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:08.277202  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:45:08.320421  <8>[    7.637155] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | clang-13 | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ba352ade903450f2efbe

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ba352ade903=
450f2efc2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:42:52.011181  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:42:52.013489  <8>[    1.700082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bad6e6029e4654f2efdf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bad6e6029e4=
654f2efe3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:31.746063  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:45:31.750082  <8>[    2.124036] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2076bdb9103eaf2efbb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2076bdb910=
3eaf2efbf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:15:57.510535  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:15:57.530874  <8>[    5.605333][  T184] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb505273e97bbcf2efbf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb505273e97=
bbcf2efc3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:47:24.525970  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:47:24.615366  <8>[   12.265747] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c53f997f536501f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c53f997f536=
501f2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:29:22.480763  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:29:23.392855  <8>[  165.305764][  T181] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-cip         | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb18b4e34cfdcff2efc7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb18b4e34cf=
dcff2efcb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:46:22.971224  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:46:23.023227  <8>[    7.080325] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-cip         | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c3383c021056e3f2efa3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c3383c02105=
6e3f2efa7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:21:10.411208  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:21:10.631175  <8>[   54.659756][  T177] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0baec94ed611ce9f2efc6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0baec94ed611=
ce9f2efca
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:45:38.863535  <8>[    2.517569] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:45:38.874731  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c06bbe22e6f9a1f2efb1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c06bbe22e6f=
9a1f2efb5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:09:08.397766  <8>[    4.427211][  T170] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:09:08.423203  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:09:08.439878  <8>[    4.471494][  T177] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c57b414be488aff2efba

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c57b414be48=
8aff2efbe
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:30:53.519386  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ca184ff6e39946f2efca

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ca184ff6e39=
946f2efce
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:50:33.861556  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:50:34.031353  <8>[   19.489773] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c7b14691cda055f2efc9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c7b14691cda=
055f2efcd
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:40:21.505330  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:40:21.539444  <8>[    5.357583] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2e018caaa103af2f01d

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2e018caaa1=
03af2f021
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:19:32.012325  <8>[    2.800750] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:19:32.020342  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b78e4474969239f2f013

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b78e4474969=
239f2f017
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:31:30.585309  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:31:30.589520  <8>[    2.280617] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcdf41b40b2ed3f2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcdf41b40b2=
ed3f2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:09.961775  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:54:09.966192  <8>[    2.078782] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be70e50fb6c6bcf2efb5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be70e50fb6c=
6bcf2efb9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:00:54.891767  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:00:54.895880  <8>[    2.242501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c0c9f585a41a38f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c0c9f585a41=
a38f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:10:53.637934  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:10:53.642053  <8>[    2.056013] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2bba22b5940b9f2efd0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2bba22b594=
0b9f2efd4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:19:10.989576  <8>[    2.048638] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:19:10.994644  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:19:10.998827  <8>[    2.059008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c4dad2aba6055df2effb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c4dad2aba60=
55df2efff
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:28:02.768080  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:28:02.821884  <8>[   12.246285][  T175] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b85882197372ebf2efcb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b8588219737=
2ebf2efcf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:34:45.129038  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:34:45.254834  <8>[   14.427434] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd32a3e961437ef2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd32a3e9614=
37ef2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:28.266204  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:28.371713  <8>[   15.804580] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf3a3730bc3454f2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf3a3730bc3=
454f2efb0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:04:05.053112  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:04:05.148239  <8>[   13.301070] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c297ef46b0fb9bf2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c297ef46b0f=
b9bf2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:18:29.320020  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:29.392470  <8>[   10.911434] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5a3445f8ac6f8f2efa8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5a3445f8ac=
6f8f2efac
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:31:31.253709  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:31:31.321896  <8>[   15.096244] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b7944474969239f2f023

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b7944474969=
239f2f027
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:31:37.893813  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:31:37.946488  <8>[    7.450562] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcce2e368fb1f3f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcce2e368fb=
1f3f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:53:45.118826  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:53:45.178004  <8>[    8.153410] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1a9365d0f77b0f2f031

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1a9365d0f7=
7b0f2f035
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:14:34.241113  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:14:34.293790  <8>[    7.695509] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c39b8be14ae211f2efa3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c39b8be14ae=
211f2efa7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:22:45.638438  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:22:45.697214  <8>[    8.072278] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6faf1b15b7126f2efca

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6faf1b15b7=
126f2efce
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:36:47.664436  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:36:48.627099  <8>[  153.740978][  T181] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b751c84dd5a5edf2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b751c84dd5a=
5edf2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:30:30.650753  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb3b5273e97bbcf2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb3b5273e97=
bbcf2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:47:15.279867  <8>[    2.621657] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:47:15.287302  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcf409361737e9f2efbe

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcf40936173=
7e9f2efc2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:31.877415  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:54:31.879595  <8>[    1.574873] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bee70d1887f69df2efc0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bee70d1887f=
69df2efc4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:55.250852  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:02:55.260091  <8>[    2.738849] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c118be42f2e701f2f03d

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c118be42f2e=
701f2f041
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:12:10.902313  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:12:10.904089  <8>[    1.571957] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2199067ade8abf2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2199067ade=
8abf2efab
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:16:16.626027  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:16:16.647623  <8>[    6.934489][  T175] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c5539ebd48ef03f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c5539ebd48e=
f03f2efaf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:30:14.968755  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:30:14.972967  <8>[    2.294648] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c9dc4c5ce77653f2efd6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c9dc4c5ce77=
653f2efda
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:49:27.251614  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:49:27.339695  <8>[   11.272748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c75d541da16896f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c75d541da16=
896f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:38:51.103221  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:38:51.163208  <8>[    7.631111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2de707e087575f2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2de707e087=
575f2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:19:32.350692  <8>[    2.683203] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:19:32.358578  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b790281ba0ac87f2efe8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b790281ba0a=
c87f2efec
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:31:31.068659  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:31:31.073150  <8>[    2.276433] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bca42d6e4a0e7cf2efdb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bca42d6e4a0=
e7cf2efdf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:53:10.558165  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be8443051c4576f2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be8443051c4=
576f2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:01:10.196085  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c0dbbe540b1ff4f2efca

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c0dbbe540b1=
ff4f2efce
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:11:11.639736  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:11:11.643782  <8>[    2.251735] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2a8ef46b0fb9bf2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2a8ef46b0f=
b9bf2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:18:51.547871  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:51.552101  <8>[    2.344728] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c4b27c4276c55ef2efad

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c4b27c4276c=
55ef2efb1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:27:26.251216  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:27:26.296947  <8>[   12.501831][  T175] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b86ceb3dfd99dff2efa4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b86ceb3dfd9=
9dff2efa8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:35:07.835206  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:35:07.910348  <8>[   10.723839] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd31d735504c00f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd31d735504=
c00f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:34.192878  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf61101ed863a2f2efa1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf61101ed86=
3a2f2efa5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:04:44.161447  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:04:44.219217  <8>[   11.634501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2bed76d95f7aff2f048

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2bed76d95f=
7aff2f04c
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:19:06.762101  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:19:06.826826  <8>[   13.783652] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c55458e6fbede4f2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c55458e6fbe=
de4f2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:30:13.243353  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:30:13.338878  <8>[   19.901049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b7bbe28c8e27fbf2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b7bbe28c8e2=
7fbf2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:32:07.241921  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:32:07.300558  <8>[    8.302631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcf957af793db1f2efc4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcf957af793=
db1f2efc8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:38.535221  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:54:38.591240  <8>[    8.016838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0beec0d1887f69df2efdf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0beec0d1887f=
69df2efe3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:56.576486  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:02:56.637584  <8>[    8.814595] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1e785e5d23f45f2efec

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1e785e5d23=
f45f2eff0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:15:41.717841  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:15:41.772546  <8>[    7.962296] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c3c9c8ead6be77f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c3c9c8ead6b=
e77f2efa4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:23:32.874739  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:23:32.909491  <8>[    5.684834] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6f9d2d4696a4ff2f01f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6f9d2d4696=
a4ff2f023
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:36:53.743215  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:36:54.563169  <8>[  168.781468][  T185] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b768de4eb0971af2efd3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b768de4eb09=
71af2efd7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:30:55.495076  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:30:55.497524  <8>[    1.688060] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb4e3e7bbfa667f2efa9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb4e3e7bbfa=
667f2efad
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:47:16.949366  <8>[    2.810690] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:47:16.962111  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd07e12801ccb8f2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd07e12801c=
cb8f2efb0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:39.666111  <8>[    3.583848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:54:39.673914  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0befbb37efe924bf2efb0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0befbb37efe9=
24bf2efb4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:58.771497  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:02:58.780103  <8>[    2.761498] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c117be42f2e701f2f033

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c117be42f2e=
701f2f037
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:12:12.854068  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:12:12.856161  <8>[    1.672222] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1d685e5d23f45f2efca

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1d685e5d23=
f45f2efce
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:15:08.167474  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:15:08.193592  <8>[    7.006871][  T175] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c58d414be488aff2f01a

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c58d414be48=
8aff2f01e
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:31:11.872874  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:31:11.877010  <8>[    2.130753] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ca418c228f7012f2efc4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ca418c228f7=
012f2efc8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:51:02.461071  <8>[   14.989305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:51:02.800168  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:51:02.892154  <8>[   15.421776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c7e837f65c2525f2efc0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c7e837f65c2=
525f2efc4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:41:03.534730  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:41:03.588764  <8>[    7.766239] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2c82e961a2f4ff2efda

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2c82e961a2=
f4ff2efde
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:19:23.579430  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:19:23.581891  <8>[    1.677871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b77e281ba0ac87f2efa2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b77e281ba0a=
c87f2efa6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:31:10.331953  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcf42e368fb1f3f2efeb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcf42e368fb=
1f3f2efef
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:30.280084  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0beabbacc275540f2f00b

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0beabbacc275=
540f2f00f
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:01:50.984939  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:01:50.989197  <8>[    2.219320] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c0c820273a77a7f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c0c820273a7=
7a7f2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:10:53.852868  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2a9a22b5940b9f2efa5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2a9a22b594=
0b9f2efa9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:18:52.035398  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c4b07c4276c55ef2efa3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c4b07c4276c=
55ef2efa7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:27:26.372678  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:27:26.418048  <8>[   12.488305][  T174] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b844ca306af3e5f2efa3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b844ca306af=
3e5f2efa7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:34:24.535082  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:34:24.604949  <8>[   12.516427] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd46a3e961437ef2efbe

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd46a3e9614=
37ef2efc2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:55.486519  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:55.545994  <8>[   10.759409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf8a101ed863a2f2efcc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf8a101ed86=
3a2f2efd0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:05:36.406243  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:05:36.475767  <8>[   14.557175] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c282ba23332379f2efa3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c282ba23332=
379f2efa7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:18:14.078828  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:14.177662  <8>[   18.208784] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c58f2ccb942a89f2efb1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c58f2ccb942=
a89f2efb5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:31:07.139723  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:31:07.208305  <8>[   13.358247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b77e24278bed77f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b77e24278be=
d77f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:31:08.107720  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:31:08.166942  <8>[    8.502942] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcfa57af793db1f2efce

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcfa57af793=
db1f2efd2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:28.229320  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:54:28.279028  <8>[    8.382910] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0beed0d1887f69df2efe9

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0beed0d1887f=
69df2efed
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:49.219177  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:02:49.267690  <8>[    8.843943] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1c1887c2e4a5ff2f018

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1c1887c2e4=
a5ff2f01c
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:14:58.663891  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:14:58.689201  <8>[    5.305264] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c42879541e6a8af2efc0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c42879541e6=
a8af2efc4
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:25:11.445073  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:25:11.523556  <8>[   58.531299] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6e3f353b5bd0cf2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6e3f353b5b=
d0cf2efbb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:36:12.771940  <8>[  288.734527][  T174] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:36:16.053066  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:36:17.564293  <8>[  293.533169][  T181] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0b757de4eb0971af2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0b757de4eb09=
71af2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:30:38.157982  <8>[    2.625063] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:30:38.165438  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:30:38.174137  <8>[    2.642666] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb8560b80f1932f2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb8560b80f1=
932f2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:48:11.276061  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcf557af793db1f2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcf557af793=
db1f2efbb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:33.891983  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:54:33.894402  <8>[    1.721527] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bee30d1887f69df2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bee30d1887f=
69df2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:51.176342  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c123be70064845f2efb3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c123be70064=
845f2efb7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:12:20.061029  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1e886eafc505ff2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1e886eafc5=
05ff2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:15:26.840136  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce518b96e5bba3f2efb6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce518b96e5b=
ba3f2efba
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:34.770354  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:08:34.781227  <8>[   15.721673] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d446fe3c76f62af2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d446fe3c76f=
62af2efaf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:33:40.463533  <8>[   14.460128] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T12:33:40.495131  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:33:40.495246  <8>[   14.488347] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d05bbf67e3af97f2efde

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d05bbf67e3a=
f97f2efe2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:17:06.840914  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callbac<8>[   15.096502] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:17:06.841112  k queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d8e86c4ac4b71ff2efa1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d8e86c4ac4b=
71ff2efa5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:53:42.651160  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.594417] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:53:42.651298   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf79f03314bd2bf2efa8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774b1-hih=
ope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774b1-hih=
ope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf79f03314b=
d2bf2efac
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:05:10.081313  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.699575] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:05:10.081431   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c312d7fb7034c6f2efd1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c312d7fb703=
4c6f2efd5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:20:32.564759  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.655503] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:20:32.564946   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cf940d9320f72af2efb0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cf950d9320f=
72af2efb4
        new failure (last pass: next-20211123)
        1 lines

    2021-11-26T12:13:39.307376  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   14.211253] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T12:13:39.307501   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d51067362fb056f2efbb

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d51067362fb=
056f2efbf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:37:11.210267  <8>[   16.381108] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T12:37:11.249068  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:37:11.249269  <8>[   16.421216] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0e28f8b99cefb05f2efa2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0e28f8b99cef=
b05f2efa6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:34:54.575917  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:34:54.576026  <8>[   17.035231] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1328ee38607aef2efba

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1338ee3860=
7aef2efbe
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:12:34.653424  <8>[   16.395445] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:12:34.690648  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:12:34.690850  <8>[   16.435302] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c504c038f9e8d9f2efb8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c504c038f9e=
8d9f2efbc
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:28:50.950168  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:28:50.950387  <8>[   16.330361] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d340880516cba3f2efad

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d340880516c=
ba3f2efb1
        new failure (last pass: next-20211123)
        1 lines

    2021-11-26T12:29:34.335086  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:29:34.335311  <8>[   16.070775] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cadfbb90c964c0f2efab

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cadfbb90c96=
4c0f2efaf
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:54:01.329568  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callbac<8>[    8.635110] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:54:01.329823  k queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bb3d5273e97bbcf2efaa

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bb3d5273e97=
bbcf2efae
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:47:11.517337  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   61.155876] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T10:47:11.517595   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c066de950ebac3f2efb5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-r8a7795=
0-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c066de950eb=
ac3f2efb9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:09:19.614846  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues<8>[    8.473892] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:09:19.615117  .   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c0cabe540b1ff4f2efbe

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c0cabe540b1=
ff4f2efc2
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:10:57.456855  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[    6.521930] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:10:57.457114   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ca90013e30dc4cf2efc0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ca90013e30d=
c4cf2efc4
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:52:42.117527  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[    8.981487] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T11:52:42.117785   callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ed5db5634876f3f2ef9f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-r8a7=
7960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-r8a7=
7960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ed5db563487=
6f3f2efa3
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0eebb922a559ccef2efa1

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0eebb922a559=
ccef2efa5
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0eb11d4a97c560bf2efa2

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
60-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-r8a779=
60-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0eb11d4a97c5=
60bf2efa7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T14:11:20.436040  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callbac<8>[   17.030562] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2021-11-26T14:11:20.436556  k queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0eb975cceb4a828f2efab

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a7796=
0-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-r8a7796=
0-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0eb975cceb4a=
828f2efaf
        new failure (last pass: next-20211125)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ece7429d0f21e9f2ef9f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ece7429d0f2=
1e9f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T14:19:01.216746  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T14:19:01.301349  <8>[   43.652864][  T383] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a77960-ulcb                | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ecf9c429bc6dc2f2ef9f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ecf9c429bc6=
dc2f2efa3
        new failure (last pass: next-20211123)
        1 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6a64eaf5021a0f2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6a64eaf502=
1a0f2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:35:43.584958  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:35:43.592301  [   16.099828] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce51e62ceb2925f2f07f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce51e62ceb2=
925f2f083
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:25.443543  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:08:25.450707  [   15.939113] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cd3d928f18c9d9f2efa6

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cd3d928f18c=
9d9f2efaa
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:03:57.365928  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0dec38a7e059513f2efe4

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0dec38a7e059=
513f2efe8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:18:41.048053  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:18:41.057835  <4>[   18.794798] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bde4572db652a1f2efc0

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bde4572db65=
2a1f2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:58:26.374162  <8>[   18.860341] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T10:58:26.404704  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c17ca7dc829742f2efa5

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c17ca7dc829=
742f2efa9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:13:49.296422  <8>[   19.762037] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-11-26T11:13:49.333872  kern  :alert : cblist_init_generic: Setting=
 adjustable number of<8>[   19.801128] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cadcf9deed6baff2efa3

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cadcf9deed6=
baff2efa7
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:53:44.724458  <8>[   18.747535] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bedf20536867b7f2efd3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bedf2053686=
7b7f2efd7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:02:39.606539  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:02:39.617867  <8>[   16.032345] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c3041755dffe9cf2efb7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c3041755dff=
e9cf2efbb
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:20:11.178210  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:20:11.190082  <8>[   16.061929] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cda63d8d240fbaf2efc4

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cda63d8d240=
fbaf2efc8
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:05:29.173411  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:05:29.188903  <8>[   15.989027] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0da66b7e84d0236f2efba

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0da66b7e84d0=
236f2efbe
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:59:58.916561  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:59:58.932578  <8>[   15.928533] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd779083f03f6df2f006

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd779083f03=
f6df2f00a
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:56:33.776134  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:56:33.792518  <8>[   15.940489] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c1b00413fda9dbf2efad

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c1b00413fda=
9dbf2efb1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:14:41.924874  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:14:41.938001  <8>[   16.038563] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c3b8ac9fc87317f2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c3b8ac9fc87=
317f2efab
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:23:13.717310  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:23:13.728850  <8>[   15.879645] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cb392988b3607af2f054

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0cb3a2988b36=
07af2f058
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:55:15.781715  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:55:15.792467  <8>[   15.864969] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6553cc4c6b114f2efb5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6553cc4c6b=
114f2efb9
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:34:22.479588  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:34:22.501599  <8>[   16.510564] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce788168d5f87ff2efc7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce788168d5f=
87ff2efcb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:09:08.952901  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:09:08.954151  <8>[   16.437788] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc2a32a5fab66bf2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc2a32a5fab=
66bf2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:50:58.064252  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:50:58.065308  <8>[   16.387719] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcb9e80940d1bbf2efc7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcb9e80940d=
1bbf2efcb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:53:18.225191  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:53:18.246295  <8>[   16.323966] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2abef46b0fb9bf2efc7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2abef46b0f=
b9bf2efcb
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:18:43.282579  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:18:43.303543  <8>[   16.410926] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c60a70b568f0e0f2efbc

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c60a70b568f=
0e0f2efc0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:24.709109  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:33:24.710126  <8>[   16.438418] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ba8d6439cd2037f2efaf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ba8d6439cd2=
037f2efb3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:44:24.179938  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:44:24.180963  <8>[   16.174709] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc952d6e4a0e7cf2efc3

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5=
-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5=
-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bc952d6e4a0=
e7cf2efc7
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:53:03.746052  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:53:03.747317  <8>[   16.374285] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bce557af793db1f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bce557af793=
db1f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:54:24.385835  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:54:24.389132  <8>[   16.317800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c2d7707e087575f2efb5

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c2d7707e087=
575f2efb9
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:19:26.241857  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:19:26.242905  <8>[   16.191571] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c890822ffbf7eff2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-sun50i-=
h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c890822ffbf=
7eff2efb0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:43:54.219873  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:43:54.220886  <8>[   16.438330] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf071e2e4ca896f2efbf

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf071e2e4ca=
896f2efc3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:03:16.960924  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:03:16.967225  <8>[   16.385947] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bf6d1a8cc6cd7cf2efc2

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bf6d1a8cc6c=
d7cf2efc6
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:05:00.831268  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:05:00.832650  <8>[   16.460987] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-orangepi-one-plus  | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c4bc8c4ff4fb28f2efa0

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-orangepi-one-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c4bc8c4ff4f=
b28f2efa4
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:27:37.033092  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:27:37.034291  <8>[   16.458355] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce698168d5f87ff2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce698168d5f=
87ff2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:08:52.476335  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:08:52.477627  <8>[   16.186225] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c6289aaa1aa2aef2efa7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-clabbe/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c6289aaa1aa=
2aef2efab
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:33:33.826640  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:33:33.827734  <8>[   16.082607] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0d45e9d1a1bf1c0f2ef9f

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0d45e9d1a1bf=
1c0f2efa3
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T12:34:31.538662  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:34:31.539078  <8>[   16.952966] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0e4a2022042120af2f013

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0e4a20220421=
20af2f017
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T13:43:37.568103  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T13:43:37.568331  <8>[   16.931768] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0be33808867e5f6f2efad

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0be33808867e=
5f6f2efb1
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:59:46.323837  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:59:46.325105  <8>[   16.211263] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c348ead45a64a6f2f020

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c348ead45a6=
4a6f2f024
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:21:26.857601  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:21:26.858660  <8>[   16.190320] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bcc9e80940d1bbf2efd7

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6=
-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bcc9e80940d=
1bbf2efdb
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:53:31.943213  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:53:31.944175  <8>[   16.070847] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bd17e12801ccb8f2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0bd17e12801c=
cb8f2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T10:55:08.497950  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T10:55:08.499049  <8>[   16.008153] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c330fce469f3bbf2efc6

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c330fce469f=
3bbf2efca
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T11:21:09.877785  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:21:09.878901  <8>[   16.044898] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0beacad276cb94ff2efac

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-sun50i=
-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0beacad276cb=
94ff2efb0
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:01:43.486131  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:01:43.486805  <8>[   16.936634] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c4b17b9120322ef2efc1

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0c4b17b91203=
22ef2efc5
        new failure (last pass: next-20211125)
        1 lines

    2021-11-26T11:27:29.759845  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T11:27:29.760189  <8>[   16.890725] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0ce976135eee9a8f2efa8

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61a0ce976135eee=
9a8f2efac
        new failure (last pass: next-20211124)
        1 lines

    2021-11-26T12:09:28.748940  kern  :alert : cblist_init_generic: Setting=
 adjustable number of callback queues.
    2021-11-26T12:09:28.749344  <8>[   16.875412] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | clang-13 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c71efa66992026f2efa1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0c71efa66992026f2e=
fa2
        failing since 3 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | clang-13 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0cf3f73be807587f2efa0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0cf3f73be807587f2e=
fa1
        failing since 2 days (last pass: next-20211118, first fail: next-20=
211124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bc932d6e4a0e7cf2efbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0bc932d6e4a0e7cf2e=
fbe
        failing since 3 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0bdaa8d64064daef2efbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0bdaa8d64064daef2e=
fbe
        failing since 3 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c283ba23332379f2efad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0c283ba23332379f2e=
fae
        failing since 3 days (last pass: next-20211118, first fail: next-20=
211123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61a0c3d6a2675ec4d7f2efd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211126/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61a0c3d6a2675ec4d7f2e=
fd1
        failing since 3 days (last pass: next-20211118, first fail: next-20=
211123) =

 =20
