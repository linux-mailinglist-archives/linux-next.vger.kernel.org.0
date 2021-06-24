Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3AD3B347C
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 19:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbhFXRPH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 13:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbhFXRPH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2021 13:15:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808E7C061574
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 10:12:46 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 13-20020a17090a08cdb029016eed209ca4so3910711pjn.1
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=15VTNcXx/X5gSvrsULqguFU30QGmPo35Ey6UYD1RsN0=;
        b=IDmy3KJ6AmHjIW28IRpNVVykGT+qCmabEL9ky9DM3fz3mFjNaeNiH03Cy9Pcsj8A4Z
         3JiJDa1zw0o2OSi9Xu94u1Q/b6hDPMf3IwHTCXOR0tpa18MJMzcEWdJfGShZEZb9uFpB
         Ph+9Jb4qSu8Col31ziy5khqMGYB/6cqPovipVWkMmtnqP4WnUBbVn+mAomOyuykxmByX
         a/ePCbva+MIX9m5mYkt65BDwFUPo19hiiatHCrr7DrW+sSm8UNtpzEyj6SmXu4yIihJH
         JcVKJhbdFaPHMZ/vxoGVH0B1KcMP9BYk/mnoAi1VA9u98G3naU56ORfeDcOo9otgE5u6
         pPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=15VTNcXx/X5gSvrsULqguFU30QGmPo35Ey6UYD1RsN0=;
        b=fC8wKx1a6I6mbRjihlQeoq1zl5oAl2sLmnOJk8AQhicOI8E1X95U6ILrrmcG20iVgL
         8s2yaI5mv685ZHOW2RqHu1pIv19LayrrGDViLYieJ4KRIgjbMyWc7MXIKM+ut5KByCzw
         ZOL1wg1U+aH3E3ZT6Z8o7T9/VyLYGjoi4YceTDQEVHpZpiidzYSRJxXIwtHjbqlAVYut
         +reBdJz57AJjag6dB8HddT80QIFrzLqztQhKnyhlkimoSyzjmWqdPvOcKV28zpsU4JgA
         fpvqda2kM+ur980owT+APLl71kHIR0kY0LGljnGo2MXbTD3bB6Q+U3b9tNDk4eX95DK+
         T/xw==
X-Gm-Message-State: AOAM532Se2GUO4O8toAOfsut9rND03UytL7kkCsKPpPnuiTj09V4RI+t
        oh4LkKkADRUNysEBpZakN82/GH5kBfRrQ1hH
X-Google-Smtp-Source: ABdhPJyChjZ9Hhi3TTVgBXUk/lXq1ks8muyGoPfZ/wV/FWjRbSp4N4opJvA3QOA9zkp7H4d0O1xXCw==
X-Received: by 2002:a17:902:7103:b029:124:72fd:fbd1 with SMTP id a3-20020a1709027103b029012472fdfbd1mr5442669pll.64.1624554764975;
        Thu, 24 Jun 2021 10:12:44 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i6sm3397965pgg.50.2021.06.24.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 10:12:44 -0700 (PDT)
Message-ID: <60d4bd0c.1c69fb81.e71a4.89d3@mx.google.com>
Date:   Thu, 24 Jun 2021 10:12:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210624
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 600 runs, 204 regressions (next-20210624)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 600 runs, 204 regressions (next-20210624)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

bcm2837-rpi-3-b-32           | arm    | lab-baylibre    | gcc-8    | bcm283=
5_defconfig            | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

hip07-d05                    | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                    | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 2          =

imx6q-sabresd                | arm    | lab-nxp         | gcc-8    | imx_v6=
_v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-12 | defcon=
fig                    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-8    | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

meson-g12a-u200              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 2          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 2          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-12 | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 2          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

qemu_arm-versatilepb         | arm    | lab-baylibre    | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-broonie     | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-cip         | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-collabora   | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-linaro-lkft | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-linaro-lkft | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-linaro-lkft | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | clang-10 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | clang-12 | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-12 | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-8    | defcon=
fig                    | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-12 | defcon=
fig                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 2          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210624/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210624
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      2a8927f0efb6fb34b9d11dab3bd3f018e866d36d =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4806a757815c1104132a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4806a757815c110413=
2aa
        failing since 119 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ac3766d1e1573413292

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ac3766d1e1573413=
293
        failing since 7 days (last pass: next-20210611, first fail: next-20=
210617) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47d2fe6f8efffe4413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47d2fe6f8efffe4413=
267
        failing since 7 days (last pass: next-20210616, first fail: next-20=
210617) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d474337d57c8b41441326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d474337d57c8b414413=
26b
        failing since 7 days (last pass: next-20210616, first fail: next-20=
210617) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b3dd8d844d64241328b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b3dd8d844d642413=
28c
        failing since 7 days (last pass: next-20210616, first fail: next-20=
210617) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2837-rpi-3-b              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47c533b5ae137b6413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47c533b5ae137b6413=
26a
        failing since 7 days (last pass: next-20210611, first fail: next-20=
210617) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2837-rpi-3-b-32           | arm    | lab-baylibre    | gcc-8    | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47842fba3a43a50413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47842fba3a43a50413=
268
        failing since 14 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47844de512c953a413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47844de512c953a413=
267
        failing since 55 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hip07-d05                    | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d493324635e579f441326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-hip0=
7-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d493324635e579f4413=
26d
        failing since 72 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hip07-d05                    | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60d4a3a4bf3a388eb1413266

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d4a3a4bf3a388=
eb141326a
        failing since 65 days (last pass: next-20210416, first fail: next-2=
0210419)
        12 lines

    2021-06-24T15:24:02.192227  kern  :alert : Unable to handle kernel pagi=
ng req[   22.568782] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfa=
il UNITS=3Dlines MEASUREMENT=3D12>
    2021-06-24T15:24:02.192478  uest at virtual address fffffbfffe8000e4
    2021-06-24T15:24:02.192666  kern  :alert : Mem abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d4a3a4bf3a388=
eb141326b
        failing since 65 days (last pass: next-20210416, first fail: next-2=
0210419)
        2 lines

    2021-06-24T15:24:02.219389  kern  :alert :   ESR =3D 0x96000006
    2021-06-24T15:24:02.219653  ker[   22.586992] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-24T15:24:02.219843  n  :alert :   EC =3D 0x25: DABT (curre[   2=
2.598103] <LAVA_SIGNAL_ENDRUN 0_dmesg 4087679_1.5.2.3.1>
    2021-06-24T15:24:02.220024  nt EL), IL =3D 32 bits   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabresd                | arm    | lab-nxp         | gcc-8    | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47aaf12044ff585413276

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47aaf12044ff585413=
277
        failing since 241 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47c523b5ae137b6413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47c523b5ae137b6413=
267
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47cdcce710baada413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mn-ddr=
4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mn-ddr=
4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47cdcce710baada413=
268
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4829342acacb0be413287

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4829342acacb0be413=
288
        failing since 0 day (last pass: next-20210617, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e5883cf242aa9413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e5883cf242aa9413=
275
        failing since 0 day (last pass: next-20210617, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4755ca812707de9413282

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4755ca812707de9413=
283
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e0b92db1ea4aa413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e0b92db1ea4aa413=
268
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4804f4bab70cb3a41327d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4804f4bab70cb3a413=
27e
        failing since 0 day (last pass: next-20210617, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4764c065194aece413285

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4764c065194aece413=
286
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47cf0ce710baada41326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47cf0ce710baada413=
26e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp         | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47d937f8671e1394132af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47d937f8671e139413=
2b0
        failing since 0 day (last pass: next-20210617, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4764e025209500941328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4764e0252095009413=
28b
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47d904947a1877741326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47d904947a18777413=
26d
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d481c7a02e814669413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d481c7a02e814669413=
268
        new failure (last pass: next-20210617) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ba009edef7ff941328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ba009edef7ff9413=
28b
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47feea8f60f3caa41326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47feea8f60f3caa413=
270
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47523f7badb602741328f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47523f7badb6027413=
290
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47cf4ce710baada413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47cf4ce710baada413=
274
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e99a32f92cdf5413288

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e99a32f92cdf5413=
289
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47aeecf0e8e0205413301

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47aeecf0e8e0=
205413305
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        11 lines

    2021-06-24T12:30:12.156761  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000031
    2021-06-24T12:30:12.157060  kern  :alert : Mem abort inf<8>[   44.86297=
1] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D11>
    2021-06-24T12:30:12.157254  o:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47aeecf0e8e0=
205413306
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        2 lines

    2021-06-24T12:30:12.178904  kern  :alert :   ESR =3D 0x96000005
    2021-06-24T12:30:12.179186  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:30:12.179361  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:30:12.179518  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:30:12.179668  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2021-06-24T12:30:12.200516  kern  :alert : Data abo<8>[   44.893265] <L=
AVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUR=
EMENT=3D2>
    2021-06-24T12:30:12.200817  rt inf<8>[   44.900417] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 486370_1.5.2.4.1>
    2021-06-24T12:30:12.200993  o:
    2021-06-24T12:30:12.201172  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
005
    2021-06-24T12:30:12.201341  kern  :alert :   CM =3D 0, WnR =3D 0   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47da3770c33faf041327e

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47da3770c33f=
af0413282
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        11 lines

    2021-06-24T12:42:02.113503  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000031
    2021-06-24T12:42:02.113685  kern  :alert : Mem abort inf<8>[   44.78638=
3] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D11>
    2021-06-24T12:42:02.113821  o:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47da3770c33f=
af0413283
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        2 lines

    2021-06-24T12:42:02.135335  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:42:02.135512  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:42:02.135644  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:42:02.135764  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:42:02.157430  kern  :alert :   FSC =3D 0x04: level 0 <8>[=
   44.812928] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNIT=
S=3Dlines MEASUREMENT=3D2>
    2021-06-24T12:42:02.157702  translation <8>[   44.822520] <LAVA_SIGNAL_=
ENDRUN 0_dmesg 486506_1.5.2.4.1>
    2021-06-24T12:42:02.157879  fault
    2021-06-24T12:42:02.158041  kern  :alert : Data abort info:
    2021-06-24T12:42:02.158197  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2021-06-24T12:42:02.158351  kern  :alert :   CM =3D 0, WnR =3D 0   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d474558636bc33c041329c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d474558636bc3=
3c04132a0
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        11 lines

    2021-06-24T12:02:18.270338  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000031
    2021-06-24T12:02:18.270520  kern  :alert : Mem abort info<8>[   44.8015=
64] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D11>
    2021-06-24T12:02:18.270653  :   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d474558636bc3=
3c04132a1
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        2 lines

    2021-06-24T12:02:18.292386  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:02:18.292560  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:02:18.292692  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:02:18.292813  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:02:18.292927  kern <8>[   44.825274] <LAVA_SIGNAL_TESTCAS=
E TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47d53e6f8efffe44132b0

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47d53e6f8eff=
fe44132b4
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        22 lines

    2021-06-24T12:40:30.551302  kern  :alert : Mem abort inf<8>[   44.90536=
1] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D22>
    2021-06-24T12:40:30.551598  o:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47d53e6f8eff=
fe44132b5
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        4 lines

    2021-06-24T12:40:30.552649  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:40:30.552825  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:40:30.552982  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:40:30.553136  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:40:30.553286  kern  :alert :   FSC =3D 0x04: level 0 tra<=
8>[   44.932116] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail U=
NITS=3Dlines MEASUREMENT=3D4>
    2021-06-24T12:40:30.553452  nslation fa<8>[   44.941400] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 486517_1.5.2.4.1>
    2021-06-24T12:40:30.553604  ult
    2021-06-24T12:40:30.553758  kern  :alert : Data abort info:   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47bdafc72dd2b57413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47bdafc72dd2b57413=
267
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47cf6183a1c13de413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47cf6183a1c13de413=
267
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4820aa02e8146694132bf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4820aa02e814669413=
2c0
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47d8dcf9f0f802f41326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47d8dcf9f0f802f413=
26e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d494a645de56d44e41326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d494a645de56d44e413=
26e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48388001012a771413285

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48388001012a771413=
286
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d474d3e87d4cf612413272

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d474d3e87d4cf=
612413276
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        22 lines

    2021-06-24T12:04:09.178085  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000000000<8>[   44.832891] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D22>
    2021-06-24T12:04:09.179433  31   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d474d3e87d4cf=
612413277
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        4 lines

    2021-06-24T12:04:09.184471  kern  :alert : Mem abort info:
    2021-06-24T12:04:09.185525  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:04:09.186622  kern  :alert<8>[   44.849941] <LAVA_SIGNAL_=
TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2021-06-24T12:04:09.187712   :   <8>[   44.856621] <LAVA_SIGNAL_ENDRUN =
0_dmesg 486156_1.5.2.4.1>
    2021-06-24T12:04:09.188777  EC =3D 0x25: DABT (current EL), IL =3D 32 b=
its
    2021-06-24T12:04:09.189836  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:04:09.190955  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:04:09.192023  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-06-24T12:04:09.193083  kern  :alert : Data abort info:   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48657acec7485f9413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48657acec7485f9413=
273
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48f91e52bbf55c241332d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48f91e52bbf55c2413=
32e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47446b304565866413289

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47446b304565=
86641328d
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        22 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47446b304565=
86641328e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        4 lines

    2021-06-24T12:02:08.238479  kern  :alert : Mem abort info:
    2021-06-24T12:02:08.239422  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:02:08.240202  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:02:08.240978  kern<8>[   44.833743] <LAVA_SIGNAL_TESTCASE=
 TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2021-06-24T12:02:08.241806    :alert : Unable<8>[   44.842605] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 4087341_1.5.2.4.1>
    2021-06-24T12:02:08.242600   to handle kernel NULL pointer dereference =
at virtual address 0000000000000031
    2021-06-24T12:02:08.243367  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:02:08.244143  kern  :alert : Mem abort info:
    2021-06-24T12:02:08.244916  kern  :alert :   ESR =3D 0x96000004   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47c499ff094ea224132d9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47c499ff094e=
a224132dd
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        22 lines

    2021-06-24T12:36:21.149932  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000000000<8>[   44.846885] <LA=
VA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASURE=
MENT=3D22>
    2021-06-24T12:36:21.150874  31
    2021-06-24T12:36:21.151583  kern  :alert : Mem abort info:
    2021-06-24T12:36:21.152265  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:36:21.152958  kern  :alert : Unable to handle kernel NULL=
 pointer dereferen<8>[   44.866505] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dem=
erg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D4>
    2021-06-24T12:36:21.153804  ce at virtual add<8>[   44.875410] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 4087692_1.5.2.4.1>
    2021-06-24T12:36:21.154565  ress 0000000000000031
    2021-06-24T12:36:21.155258  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:36:21.155945  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47c499ff094e=
a224132de
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        4 lines =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e75170c5bc7fa413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e75170c5bc7fa413=
275
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ba2cf698c84b541327b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ba2cf698c84b5413=
27c
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e9383cf242aa941327e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e9383cf242aa9413=
27f
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47534567ef9e14b41327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47534567ef9e14b413=
27d
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47bd6792dbaa880413291

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47bd6792dbaa880413=
292
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47d2c2b6e51637f4132df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47d2c2b6e51637f413=
2e0
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d476bcb537c692a5413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d476bcb537c692a5413=
285
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4787446ef255438413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4787446ef255438413=
268
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4804d4bab70cb3a41327a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4804d4bab70cb3a413=
27b
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48987e5d9a69a77413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48987e5d9a69a77413=
274
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47623564096e5bc413296

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47623564096e5bc413=
297
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b4c4d95a57896413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b4c4d95a57896413=
273
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d487a7f1c6a63fea41326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d487a7f1c6a63fea413=
270
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d480759539f0c213413286

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d480759539f0c213413=
287
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4764b0252095009413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4764b0252095009413=
274
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b608ee218c8b541328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b608ee218c8b5413=
28b
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4877e32ef4a903f413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4877e32ef4a903f413=
26a
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47f856040d52a734132c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47f856040d52a73413=
2ca
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d488d3b6972c19a941328e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d488d3b6972c19a9413=
28f
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4763758d9811d644132a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4763758d9811d64413=
2a5
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b38d8d844d64241327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b38d8d844d642413=
27d
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4868e49363109e741326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4868e49363109e7413=
26b
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d485f2b998e57fab413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d485f2b998e57fab413=
268
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d475af09d8afaa8541327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d475af09d8afaa85413=
27d
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4843a6c3aad20b3413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4843a6c3aad20b3413=
271
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4779aa11cb6580341326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4779aa11cb65803413=
26c
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47bd8792dbaa88041329d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47bd8792dbaa880413=
29e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4879532ef4a903f41326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4879532ef4a903f413=
26e
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47b120b37d987cb41327c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47b120b37d98=
7cb413280
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        11 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47b120b37d98=
7cb413281
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        2 lines

    2021-06-24T12:30:53.546572  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:30:53.573790  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:30:53.575068  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-06-24T12:30:53.576284  kern  :a<8>[   45.169614] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-24T12:30:53.577517  lert : Data abor<8>[   45.178009] <LAVA_SIG=
NAL_ENDRUN 0_dmesg 486171_1.5.2.4.1>
    2021-06-24T12:30:53.578707  t info:
    2021-06-24T12:30:53.579894  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2021-06-24T12:30:53.581072  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-06-24T12:30:53.582315  kern  :alert : [0000000000000031] user addr=
ess but active_mm is swapper   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47f23dda43ab37a41326c

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47f23dda43ab=
37a413270
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623)
        11 lines

    2021-06-24T12:48:15.416019  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000031
    2021-06-24T12:48:15.417191  kern  :alert : Mem abort inf<8>[   45.11703=
2] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines M=
EASUREMENT=3D11>
    2021-06-24T12:48:15.418436  o:
    2021-06-24T12:48:15.419623  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:48:15.420814  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:48:15.422158  kern  :alert :   SET =3D 0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47f23dda43ab=
37a413271
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623)
        2 lines

    2021-06-24T12:48:15.451383  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:48:15.452769  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-06-24T12:48:15.454760  kern  <8>[   45.145440] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-24T12:48:15.456025  :alert : Data a<8>[   45.153805] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 486252_1.5.2.4.1>
    2021-06-24T12:48:15.457330  bort info:
    2021-06-24T12:48:15.458520  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2021-06-24T12:48:15.459682  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-06-24T12:48:15.460864  kern  :alert : [0000000000000031] user addr=
ess but active_mm is swapper
    2021-06-24T12:48:15.462120  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60d4911f8680c47032413288

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d4911f8680c47=
03241328c
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        11 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d4911f8680c47=
03241328d
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        2 lines

    2021-06-24T14:05:09.012735  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T14:05:09.024165  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T14:05:09.026319  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-06-24T14:05:09.027703  kern  :a<8>[   45.489499] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-24T14:05:09.029131  lert : Data abo<8>[   45.497911] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 486473_1.5.2.4.1>
    2021-06-24T14:05:09.030596  rt info:
    2021-06-24T14:05:09.032254  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2021-06-24T14:05:09.034806  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-06-24T14:05:09.036241  kern  :alert : [0000000000000031] user addr=
ess but active_mm is swapper   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47532567ef9e14b413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47532567ef9e14b413=
27a
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d477986b66aed5f741326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d477986b66aed5f7413=
26e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47c26c51b1f7f1941327f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47c26c51b1f7f19413=
280
        new failure (last pass: next-20210618) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47cffce710baada413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47cffce710baada413=
281
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47f47b82bce9b92413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47f47b82bce9b92413=
284
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47531f7badb60274132c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm1=
-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47531f7badb6027413=
2c2
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47c3ae30a200fde413292

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47c3ae30a200fde413=
293
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47df333604346514132d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47df33360434651413=
2d6
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48500d810ef7e3641326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48500d810ef7e36413=
270
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-baylibre    | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4793ccae7071d9d413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4793ccae7071d9d413=
267
        failing since 218 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-broonie     | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4797e105c20cb4a413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4797e105c20cb4a413=
27a
        failing since 218 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-cip         | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4787a46ef25543841328c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4787a46ef255438413=
28d
        failing since 218 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-collabora   | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4792cde82c3c6034132af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4792cde82c3c603413=
2b0
        failing since 218 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-linaro-lkft | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a33a636c2aac1841326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a33a636c2aac18413=
26c
        failing since 218 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47f2db82bce9b92413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47f2db82bce9b92413=
267
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4818cf7b1a18d11413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4818cf7b1a18d11413=
26a
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e3ec2b28a2ba4413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e3ec2b28a2ba4413=
272
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48260c1957c1c1a413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48260c1957c1c1a413=
274
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-linaro-lkft | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a6bb49715a7ad841327f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a6bb49715a7ad8413=
280
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e02b071095823413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e02b071095823413=
271
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4809c9539f0c2134132ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4809c9539f0c213413=
2ac
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ddc8a102d6d0d4132db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ddc8a102d6d0d413=
2dc
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d480ff4fd89c2d0041328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d480ff4fd89c2d00413=
28b
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-linaro-lkft | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a69649715a7ad8413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a69649715a7ad8413=
27a
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47776cb20eaab1b41326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47776cb20eaab1b413=
26d
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d478c40532d9ca91413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d478c40532d9ca91413=
269
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b44d8d844d642413291

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b44d8d844d642413=
292
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4782a9a5d625bd7413290

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/baseline-qemu_x86_64.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/baseline-qemu_x86_64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4782a9a5d625bd7413=
291
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d479932533f3e50441327e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d479932533f3e504413=
27f
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47bffaf4700c91a413295

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-broonie/baseline-qemu_x86_64.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47bffaf4700c91a413=
296
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d477993ff19085f5413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d477993ff19085f5413=
272
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47811a6459981ee413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47811a6459981ee413=
27a
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47aa7459d1fdf04413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47aa7459d1fdf04413=
281
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4777aa2dcf3d02741328c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4777aa2dcf3d027413=
28d
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d478eadd977719ee4132ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d478eadd977719ee413=
2ac
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b3ad8d844d64241327f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b3ad8d844d642413=
280
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a30ffb1f5e785e413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a30ffb1f5e785e413=
268
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a34d3fdc344be741326e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a34d3fdc344be7413=
26f
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a52fe8d67f273841326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a52fe8d67f2738413=
26d
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47f1adda43ab37a413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47f1adda43ab37a413=
267
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d481004fd89c2d00413296

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d481004fd89c2d00413=
297
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e85170c5bc7fa413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e85170c5bc7fa413=
284
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4826242acacb0be413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4826242acacb0be413=
272
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a69790dae8e83841326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a69790dae8e838413=
26d
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e018372db329641326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e018372db3296413=
26b
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d480602566db068741326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d480602566db0687413=
26c
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ded8372db3296413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ded8372db3296413=
268
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d480fb4fd89c2d00413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d480fb4fd89c2d00413=
285
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a695724961259b413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a695724961259b413=
269
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4777687179c7d3c41326e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4777687179c7d3c413=
26f
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4789c5205170e63413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4789c5205170e63413=
26a
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b1e9d37b66a5f413286

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b1e9d37b66a5f413=
287
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4783e05d6af2abb413379

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4783e05d6af2abb413=
37a
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d478b6a39caa08da4132e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d478b6a39caa08da413=
2e2
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47bc45a42a99d84413286

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-broonie/baseline-qemu_x86_64-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-broonie/baseline-qemu_x86_64-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47bc45a42a99d84413=
287
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47788a11cb65803413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47788a11cb65803413=
267
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4781d05d6af2abb41336f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4781d05d6af2abb413=
370
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47aab12044ff58541326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47aab12044ff585413=
26e
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4779771594c913c41326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4779771594c913c413=
270
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d478dddd977719ee41329f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d478dddd977719ee413=
2a0
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b3ed8d844d64241328e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b3ed8d844d642413=
28f
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a3383fdc344be7413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a3383fdc344be7413=
26a
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a34bfb1f5e785e41326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a34bfb1f5e785e413=
26e
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a52ed00b454b0f413281

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a52ed00b454b0f413=
282
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47f55b82bce9b92413296

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47f55b82bce9b92413=
297
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d481dc76a16302c641326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d481dc76a16302c6413=
26b
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47f33924da0d8b1413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47f33924da0d8b1413=
267
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48263c1957c1c1a413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48263c1957c1c1a413=
27a
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | clang-10 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a6bd58ecd166cb413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a6bd58ecd166cb413=
27a
        new failure (last pass: next-20210616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47dd9cf9f0f802f413287

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47dd9cf9f0f802f413=
288
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4802418879ad00c413298

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4802418879ad00c413=
299
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47dcbcf9f0f802f413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47dcbcf9f0f802f413=
284
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d480fc4fd89c2d00413287

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d480fc4fd89c2d00413=
288
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | clang-12 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a69358ecd166cb413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a69358ecd166cb413=
273
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47784e1c18b66b6413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47784e1c18b66b6413=
268
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d478c518d89f863b413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d478c518d89f863b413=
275
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b1d0b37d987cb4132d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b1d0b37d987cb413=
2d4
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4787a8d1fec71f041327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4787a8d1fec71f0413=
27d
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d479ba9ceb3aa04d413292

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d479ba9ceb3aa04d413=
293
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47bc35a42a99d84413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-broonie/baseline-qemu_x86_64-ue=
fi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-broonie/baseline-qemu_x86_64-ue=
fi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47bc35a42a99d84413=
284
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d477efe1c18b66b64132d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d477efe1c18b66b6413=
2d9
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d478dcdd977719ee41329c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d478dcdd977719ee413=
29d
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-cip         | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47a6c14ba724259413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47a6c14ba724259413=
269
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d477b56b66aed5f741327e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d477b56b66aed5f7413=
27f
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4791fde82c3c603413297

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4791fde82c3c603413=
298
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b1972f201094e413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b1972f201094e413=
27a
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a3394c686c2c14413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a3394c686c2c14413=
273
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a3744c686c2c1441327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a3744c686c2c14413=
27d
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-linaro-lkft | gcc-8    | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4a52ce8d67f2738413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4a52ce8d67f2738413=
267
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b45d8d844d642413294

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b45d8d844d642413=
295
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ff59111ea2208413276

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ff59111ea2208413=
277
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4756b464dea05ad41327f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4756b464dea05ad413=
280
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47c0db0c9d27c80413291

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47c0db0c9d27c80413=
292
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47e8da32f92cdf5413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47e8da32f92cdf5413=
284
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ea783cf242aa9413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ea783cf242aa9413=
284
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4bc41626c98cb14413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4bc41626c98cb14413=
269
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47a9c459d1fdf0441326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47a9c459d1fdf04413=
270
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47cf7ce710baada41327a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47cf7ce710baada413=
27b
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4740bea7bfc9675413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4740bea7bfc9675413=
281
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47ad8cf0e8e02054132e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47ad8cf0e8e0205413=
2e1
        failing since 9 days (last pass: next-20210611, first fail: next-20=
210615) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47bddaf4700c91a413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47bddaf4700c91a413=
268
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47aa87c6342dc85413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47aa87c6342dc85413=
267
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48149fe00a69a6b413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48149fe00a69a6b413=
275
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47431b74710635d413288

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47431b74710635d413=
289
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47b818ee218c8b54132a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47b818ee218c8b5413=
2a8
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d480064bab70cb3a413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d480064bab70cb3a413=
267
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47db34947a18777413290

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47db34947a18=
777413294
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        11 lines

    2021-06-24T12:42:01.161909  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000031
    2021-06-24T12:42:01.162175  kern  :alert : Mem abort info:
    2021-06-24T12:42:01.162409  kern  :alert :   ESR =3D 0x96000004
    2021-06-24T12:42:01.162868  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:42:01.163102  kern  :alert :   SET =3D 0, F<8>[   16.5300=
24] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines =
MEASUREMENT=3D11>
    2021-06-24T12:42:01.163324  nV =3D 0
    2021-06-24T12:42:01.163539  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47db34947a18=
777413295
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        2 lines

    2021-06-24T12:42:01.164770  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-06-24T12:42:01.165007  kern  :alert : Data abort info:
    2021-06-24T12:42:01.225811  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2021-06-24T12:42:01.226321  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-06-24T12:42:01.226564  kern  :alert : [0000000000000031] user addr=
ess but active_mm is swapper
    2021-06-24T12:42:01.226792  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP
    2021-06-24T12:42:01.227013  kern  :emerg : Code: cb080028 b9400f02 f900=
03e8 f94146c9 (3940c529) =

    2021-06-24T12:42:01.227468  <8>[   16.585381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47d3be6f8efffe4413275

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47d3be6f8efffe4413=
276
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60d47ac8766d1e1573413299

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60d47ac8766d1e1=
57341329d
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        11 lines

    2021-06-24T12:29:54.411745  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000031
    2021-06-24T12:29:54.411999  kern  :aler<8>[   45.823829] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D11>
    2021-06-24T12:29:54.412209  t : Mem abort info:
    2021-06-24T12:29:54.412431  kern  :alert :   ESR =3D 0x96000005
    2021-06-24T12:29:54.412632  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-06-24T12:29:54.412840  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-06-24T12:29:54.413036  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-06-24T12:29:54.413243  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2021-06-24T12:29:54.413435  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60d47ac8766d1e1=
57341329e
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623)
        2 lines

    2021-06-24T12:29:54.464822  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
005<8>[   45.860553] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfa=
il UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-24T12:29:54.465193  kern  :alert : <8>[   45.870162] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 4087556_1.5.2.4.1>
    2021-06-24T12:29:54.465495    CM =3D 0, WnR =3D 0
    2021-06-24T12:29:54.465794  kern  :alert : [0000000000000031] user addr=
ess but active_mm is swapper
    2021-06-24T12:29:54.466004  kern  :emerg : Internal error: Oops: 960000=
05 [#1] PREEMPT SMP
    2021-06-24T12:29:54.466236  kern  :emerg : Code: f9400d48 cb080028 f900=
0be8 f941440a (3940c54a) =

    2021-06-24T12:29:54.466496  + set +x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | clang-12 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4801e18879ad00c413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4801e18879ad00c413=
281
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47cfd183a1c13de41326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47cfd183a1c13de413=
26d
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d47eca1a5deff7b9413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d47eca1a5deff7b9413=
271
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4752af7badb60274132a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4752af7badb6027413=
2a8
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-8    | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d4835b001012a77141326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d4835b001012a771413=
26d
        new failure (last pass: next-20210623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60d48792f1c6a63fea41326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d48792f1c6a63fea413=
26b
        failing since 0 day (last pass: next-20210618, first fail: next-202=
10623) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60d480e84fd89c2d00413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210624/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60d480e84fd89c2d00413=
26a
        failing since 0 day (last pass: next-20210622, first fail: next-202=
10623) =

 =20
