Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 646EB69F40E
	for <lists+linux-next@lfdr.de>; Wed, 22 Feb 2023 13:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjBVMKV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Feb 2023 07:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBVMKU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2023 07:10:20 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788104EE5
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 04:10:15 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id na9-20020a17090b4c0900b0023058bbd7b2so8040310pjb.0
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 04:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=J7EFMH4JQ7fyVgxIsH1HGYBGzHJlCBcUbThadQ5n3Vc=;
        b=aZipyBri2iIk/jqafak1DniXMNTPpwSl4F0fpmoeKCdcYxEm/1QzBuSBbMtbgoPGpV
         +XdBD4Pg4M/9gDc7yOCqtM7i2Ys4Yr8VD0bxabezluQVjXjpDLeGU2lr35Ouk3Sud/rw
         AIVtf/vogyqn2YMeKpeyNKCzhHfwKRmIWr6FTWQ1T6g8F2TEBy8Oy2Vhf4bp9Hpc6o1N
         ja+m4tS4QRx1J2MjJvlGpN+hM5DwWmIQyo676siP8IR+k/3/tT8wtazpbdoAsmQctIaQ
         A+U1c3XdOBkfctHer360dnK2yhT8pgAOepDZBguFoOy1RoQ91Fpo0E/0RA/xYiKifca7
         IUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7EFMH4JQ7fyVgxIsH1HGYBGzHJlCBcUbThadQ5n3Vc=;
        b=VV/FFlCe2AbkzEJnxIZZNxg0ps9+OSsFHuRmy8BycS0KX5YBj9zmme0/Q8NLxGMxim
         /EqVG702lj3b9WYRQNjnRTbjWd0gqo4iGd+V9dtMrWlUu3WlIahgBxRavl6psDOoJABd
         nWsCiV4YYWpPONg/Gn3RHkRygTzSMrmCb2q0y9AYyYm5/y/qThZv6MMN800Sa9drBCxl
         rM96GjtRC2vx2x9/roDX8LbB5XCTyH6Yk5m8K8BFXwDHCrFoy++auS0Iahtrk1oU5yas
         z72frDcRPgVTBIhtownd1ngJ/eHNVEV7Grq9YFq5RwLZDe6jNxxQOTCP/kW16mQYJpyY
         rw+A==
X-Gm-Message-State: AO0yUKXTP823reXL+ZXNcfxywAU5TjhZ2QnNUNLLHquA4v6Vr+FkeLBL
        O4ym5B25WXC6oLtBfToCPl+KiTtJVFPod/n7TeY=
X-Google-Smtp-Source: AK7set8nIzYzt6V1POui4Hwh27EFuDC+Ucn4LeHxzSjVSJhOKUDhlm3VKPV7f0LfAA9QH9Ia9hrJfA==
X-Received: by 2002:a17:903:746:b0:19b:5f88:7975 with SMTP id kl6-20020a170903074600b0019b5f887975mr6143440plb.44.1677067812931;
        Wed, 22 Feb 2023 04:10:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902820900b0019c33775574sm5204519pln.198.2023.02.22.04.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 04:10:12 -0800 (PST)
Message-ID: <63f60624.170a0220.1e47b.91a1@mx.google.com>
Date:   Wed, 22 Feb 2023 04:10:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230222
X-Kernelci-Report-Type: test
Subject: next/master baseline: 717 runs, 156 regressions (next-20230222)
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

next/master baseline: 717 runs, 156 regressions (next-20230222)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | sama=
5_defconfig              | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+kselftest          | 1          =

qemu_arm-vexpress-a9         | arm    | lab-baylibre    | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+kselftest          | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230222/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230222
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c755ff45161d308c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c755ff45161d308c8=
632
        failing since 158 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | sama=
5_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c46dba5cf4709d8c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c46dba5cf4709d8c8=
66c
        failing since 21 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c9daf715bc1e4e8c8686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c9daf715bc1e4e8c8=
687
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c5d5986e3a3e278c8653

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c5d5986e3a3e278c865c
        failing since 35 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-22T07:35:25.301742  <8>[   15.815830] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3364517_1.5.2.4.1>
    2023-02-22T07:35:25.411098  / # #
    2023-02-22T07:35:25.512681  export SHELL=3D/bin/sh
    2023-02-22T07:35:25.513055  #
    2023-02-22T07:35:25.614340  / # export SHELL=3D/bin/sh. /lava-3364517/e=
nvironment
    2023-02-22T07:35:25.614713  =

    2023-02-22T07:35:25.614903  / # <3>[   16.047837] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-22T07:35:25.716019  . /lava-3364517/environment/lava-3364517/bi=
n/lava-test-runner /lava-3364517/1
    2023-02-22T07:35:25.716596  =

    2023-02-22T07:35:25.721621  / # /lava-3364517/bin/lava-test-runner /lav=
a-3364517/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c77c66fd85ec528c8634

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c77c66fd85ec528c863d
        failing since 34 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-22T07:42:26.853169  <8>[   16.651782] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3364568_1.5.2.4.1>
    2023-02-22T07:42:26.963574  / # #
    2023-02-22T07:42:27.067272  export SHELL=3D/bin/sh
    2023-02-22T07:42:27.068739  #
    2023-02-22T07:42:27.171591  / # export SHELL=3D/bin/sh. /lava-3364568/e=
nvironment
    2023-02-22T07:42:27.172671  =

    2023-02-22T07:42:27.275251  / # . /lava-3364568/environment/lava-336456=
8/bin/lava-test-runner /lava-3364568/1
    2023-02-22T07:42:27.276917  =

    2023-02-22T07:42:27.281890  / # /lava-3364568/bin/lava-test-runner /lav=
a-3364568/1
    2023-02-22T07:42:27.363821  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca23df68071ac58c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5ca23df68071ac58c8646
        failing since 34 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-22T07:54:01.515240  <8>[   15.101638] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3364721_1.5.2.4.1>
    2023-02-22T07:54:01.626368  / # #
    2023-02-22T07:54:01.730140  export SHELL=3D/bin/sh
    2023-02-22T07:54:01.731259  #
    2023-02-22T07:54:01.731823  / # <3>[   15.251897] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-22T07:54:01.833839  export SHELL=3D/bin/sh. /lava-3364721/envir=
onment
    2023-02-22T07:54:01.835063  =

    2023-02-22T07:54:01.938000  / # . /lava-3364721/environment/lava-336472=
1/bin/lava-test-runner /lava-3364721/1
    2023-02-22T07:54:01.939662  =

    2023-02-22T07:54:01.944689  / # /lava-3364721/bin/lava-test-runner /lav=
a-3364721/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c58c6a6114abf38c8635

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c58c6a6114abf38c863e
        failing since 23 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-22T07:34:23.062723  + set +x
    2023-02-22T07:34:23.063069  [   13.067692] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910615_1.5.2.3.1>
    2023-02-22T07:34:23.171300  / # #
    2023-02-22T07:34:23.272889  export SHELL=3D/bin/sh
    2023-02-22T07:34:23.273355  #
    2023-02-22T07:34:23.374615  / # export SHELL=3D/bin/sh. /lava-910615/en=
vironment
    2023-02-22T07:34:23.375103  =

    2023-02-22T07:34:23.476414  / # . /lava-910615/environment/lava-910615/=
bin/lava-test-runner /lava-910615/1
    2023-02-22T07:34:23.476998  =

    2023-02-22T07:34:23.480269  / # /lava-910615/bin/lava-test-runner /lava=
-910615/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c742f93a1fa88e8c8668

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c742f93a1fa88e8c8671
        failing since 23 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-22T07:41:36.640078  + set +x
    2023-02-22T07:41:36.640249  [   12.067644] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910618_1.5.2.3.1>
    2023-02-22T07:41:36.746976  / # #
    2023-02-22T07:41:36.848683  export SHELL=3D/bin/sh
    2023-02-22T07:41:36.849092  #
    2023-02-22T07:41:36.951096  / # export SHELL=3D/bin/sh. /lava-910618/en=
vironment
    2023-02-22T07:41:36.951560  =

    2023-02-22T07:41:37.052754  / # . /lava-910618/environment/lava-910618/=
bin/lava-test-runner /lava-910618/1
    2023-02-22T07:41:37.053333  =

    2023-02-22T07:41:37.056283  / # /lava-910618/bin/lava-test-runner /lava=
-910618/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c986b7674c91d48c86b6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c986b7674c91d48c86bf
        failing since 23 days (last pass: next-20221205, first fail: next-2=
0230130)

    2023-02-22T07:51:15.410615  + set +x
    2023-02-22T07:51:15.410789  [   12.832220] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910630_1.5.2.3.1>
    2023-02-22T07:51:15.518299  / # #
    2023-02-22T07:51:15.619857  export SHELL=3D/bin/sh
    2023-02-22T07:51:15.620250  #
    2023-02-22T07:51:15.721528  / # export SHELL=3D/bin/sh. /lava-910630/en=
vironment
    2023-02-22T07:51:15.722109  =

    2023-02-22T07:51:15.823300  / # . /lava-910630/environment/lava-910630/=
bin/lava-test-runner /lava-910630/1
    2023-02-22T07:51:15.823915  =

    2023-02-22T07:51:15.827123  / # /lava-910630/bin/lava-test-runner /lava=
-910630/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d3b55a40846f208c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d3b55a40846f208c8=
634
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d3d05a40846f208c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d3d05a40846f208c8=
638
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d4ac79aac1abec8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d4ac79aac1abec8c8=
636
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c8bab7d34467758c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c8bab7d34467758c8=
644
        failing since 316 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c5bd10182599fe8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c5bd10182599fe8c8=
647
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63f5c2185d2b1838638c8630

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c2185d2b1838638c8637
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:19:21.435878  / # #
    2023-02-22T07:19:21.537526  export SHELL=3D/bin/sh
    2023-02-22T07:19:21.537954  #
    2023-02-22T07:19:21.639278  / # export SHELL=3D/bin/sh. /lava-282287/en=
vironment
    2023-02-22T07:19:21.639705  =

    2023-02-22T07:19:21.741008  / # . /lava-282287/environment/lava-282287/=
bin/lava-test-runner /lava-282287/1
    2023-02-22T07:19:21.741794  =

    2023-02-22T07:19:21.746515  / # /lava-282287/bin/lava-test-runner /lava=
-282287/1
    2023-02-22T07:19:21.813321  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:19:21.813585  + <8>[   22.372412] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 282287_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f5c2185d2b1838638c863b
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:19:23.905620  /lava-282287/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f5c2185d2b1838638c863d
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:19:24.962212  /lava-282287/1/../bin/lava-test-case
    2023-02-22T07:19:24.962627  <8>[   25.513851] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f5c2185d2b1838638c8642
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:19:26.036803  /lava-282287/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f5c2185d2b1838638c8643
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:19:26.040043  <8>[   26.624177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-22T07:19:27.098197  /lava-282287/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63f5c588dd52cd0cd38c862f

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c588dd52cd0cd38c8636
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:34:10.459682  / # #
    2023-02-22T07:34:10.561363  export SHELL=3D/bin/sh
    2023-02-22T07:34:10.561966  #
    2023-02-22T07:34:10.663237  / # export SHELL=3D/bin/sh. /lava-282306/en=
vironment
    2023-02-22T07:34:10.663793  =

    2023-02-22T07:34:10.765280  / # . /lava-282306/environment/lava-282306/=
bin/lava-test-runner /lava-282306/1
    2023-02-22T07:34:10.766164  =

    2023-02-22T07:34:10.782852  / # /lava-282306/bin/lava-test-runner /lava=
-282306/1
    2023-02-22T07:34:10.840436  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:34:10.840756  + <8>[   22.336909] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 282306_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f5c588dd52cd0cd38c863a
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:34:12.935705  /lava-282306/1/../bin/lava-test-case
    2023-02-22T07:34:12.936103  <8>[   24.444310] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-22T07:34:12.936345  /lava-282306/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f5c588dd52cd0cd38c863c
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:34:13.994510  /lava-282306/1/../bin/lava-test-case
    2023-02-22T07:34:13.994907  <8>[   25.482943] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-22T07:34:13.995161  /lava-282306/1/../bin/lava-test-case
    2023-02-22T07:34:13.995390  <8>[   25.499923] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f5c588dd52cd0cd38c8641
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:34:15.069854  /lava-282306/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f5c588dd52cd0cd38c8642
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:34:15.073078  <8>[   26.595142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-22T07:34:16.130019  /lava-282306/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c81d16c7e8454c8c866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c81d16c7e8454c8c8=
66b
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/63f5c894ab94e0b38e8c863e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c894ab94e0b38e8c8645
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:47:12.034980  / # #
    2023-02-22T07:47:12.136971  export SHELL=3D/bin/sh
    2023-02-22T07:47:12.137462  #
    2023-02-22T07:47:12.238986  / # export SHELL=3D/bin/sh. /lava-282326/en=
vironment
    2023-02-22T07:47:12.239660  =

    2023-02-22T07:47:12.340911  / # . /lava-282326/environment/lava-282326/=
bin/lava-test-runner /lava-282326/1
    2023-02-22T07:47:12.342026  =

    2023-02-22T07:47:12.346816  / # /lava-282326/bin/lava-test-runner /lava=
-282326/1
    2023-02-22T07:47:12.413825  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:47:12.414172  + <8>[   22.455784] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 282326_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f5c894ab94e0b38e8c8649
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:47:14.509930  /lava-282326/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f5c894ab94e0b38e8c864b
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:47:15.569875  /lava-282326/1/../bin/lava-test-case
    2023-02-22T07:47:15.570282  <8>[   25.600859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-22T07:47:15.570543  /lava-282326/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f5c894ab94e0b38e8c8650
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:47:16.645101  /lava-282326/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f5c894ab94e0b38e8c8651
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:47:16.648334  <8>[   26.715508] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-22T07:47:17.707471  /lava-282326/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63f5c92137d6e20c778c8632

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c92137d6e20c778c8639
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:49:40.278936  / # #
    2023-02-22T07:49:40.381032  export SHELL=3D/bin/sh
    2023-02-22T07:49:40.381491  #
    2023-02-22T07:49:40.482934  / # export SHELL=3D/bin/sh. /lava-282336/en=
vironment
    2023-02-22T07:49:40.483545  =

    2023-02-22T07:49:40.584990  / # . /lava-282336/environment/lava-282336/=
bin/lava-test-runner /lava-282336/1
    2023-02-22T07:49:40.585844  =

    2023-02-22T07:49:40.591286  / # /lava-282336/bin/lava-test-runner /lava=
-282336/1
    2023-02-22T07:49:40.658287  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:49:40.658628  + <8>[   22.482639] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 282336_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f5c92137d6e20c778c863d
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:49:42.750441  /lava-282336/1/../bin/lava-test-case
    2023-02-22T07:49:42.750828  <8>[   24.586999] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-22T07:49:42.751071  /lava-282336/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f5c92137d6e20c778c863f
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:49:43.808949  /lava-282336/1/../bin/lava-test-case
    2023-02-22T07:49:43.809356  <8>[   25.624861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-22T07:49:43.809612  /lava-282336/1/../bin/lava-test-case
    2023-02-22T07:49:43.809841  <8>[   25.643452] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f5c92137d6e20c778c8644
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:49:43.868240  <8>[   25.718616] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2023-02-22T07:49:44.886560  /lava-282336/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f5c92137d6e20c778c8645
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:49:44.889807  <8>[   26.740201] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-22T07:49:45.947715  /lava-282336/1/../bin/lava-test-case
    2023-02-22T07:49:45.948122  <8>[   27.761380] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-22T07:49:45.948361  /lava-282336/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63f5c999844eec6f938c8630

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c999844eec6f938c8637
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:51:40.292272  <8>[   21.903700] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 282344_1.5.2.4.1>
    2023-02-22T07:51:40.397820  / # #
    2023-02-22T07:51:40.499761  export SHELL=3D/bin/sh
    2023-02-22T07:51:40.500219  #
    2023-02-22T07:51:40.601722  / # export SHELL=3D/bin/sh. /lava-282344/en=
vironment
    2023-02-22T07:51:40.602156  =

    2023-02-22T07:51:40.703493  / # . /lava-282344/environment/lava-282344/=
bin/lava-test-runner /lava-282344/1
    2023-02-22T07:51:40.704271  =

    2023-02-22T07:51:40.709695  / # /lava-282344/bin/lava-test-runner /lava=
-282344/1
    2023-02-22T07:51:40.776679  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f5c999844eec6f938c863b
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:51:42.871689  /lava-282344/1/../bin/lava-test-case
    2023-02-22T07:51:42.872070  <8>[   24.469502] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-22T07:51:42.872324  /lava-282344/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f5c999844eec6f938c863d
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:51:43.928584  /lava-282344/1/../bin/lava-test-case
    2023-02-22T07:51:43.928991  <8>[   25.507232] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f5c999844eec6f938c8642
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:51:45.002976  /lava-282344/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f5c999844eec6f938c8643
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-22T07:51:45.006182  <8>[   26.617020] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-22T07:51:46.059632  /lava-282344/1/../bin/lava-test-case
    2023-02-22T07:51:46.060034  <8>[   27.637236] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-22T07:51:46.060276  /lava-282344/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63f5c91126ae69b35a8c8664

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63f5c91126ae69b35a8c8675
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-22T07:49:10.002973  /lava-282333/1/../bin/lava-test-case
    2023-02-22T07:49:10.005162  <8>[   17.371303] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63f=
5c91126ae69b35a8c8677
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-22T07:49:12.015546  /lava-282333/1/../bin/lava-test-case
    2023-02-22T07:49:12.015911  <8>[   19.445004] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-22T07:49:12.016179  /lava-282333/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63f5c987b7674c91d48c86c1

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63f5c987b7674c91d48c86d2
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-22T07:51:24.915346  /lava-282342/1/../bin/lava-test-case
    2023-02-22T07:51:24.918496  <8>[   17.187719] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63f=
5c987b7674c91d48c86d4
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-22T07:51:26.926607  /lava-282342/1/../bin/lava-test-case
    2023-02-22T07:51:26.926985  <8>[   19.261160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-22T07:51:26.927228  /lava-282342/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c1f3d863bc099f8c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c1f4d863bc099f8c8643
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:19:03.839973  / ##
    2023-02-22T07:19:03.941354  export SHELL=3D/bin/sh
    2023-02-22T07:19:03.941691   #
    2023-02-22T07:19:04.042811  / # export SHELL=3D/bin/sh. /lava-3364392/e=
nvironment
    2023-02-22T07:19:04.043220  =

    2023-02-22T07:19:04.043386  / # <3>[   18.349579] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:19:04.144478  . /lava-3364392/environment/lava-3364392/bi=
n/lava-test-runner /lava-3364392/1
    2023-02-22T07:19:04.145119  =

    2023-02-22T07:19:04.149262  / # /lava-3364392/bin/lava-test-runner /lav=
a-3364392/1
    2023-02-22T07:19:04.215108  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c55004865476bf8c86c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c55004865476bf8c86cd
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:33:27.577496  / # #
    2023-02-22T07:33:27.679233  export SHELL=3D/bin/sh
    2023-02-22T07:33:27.679842  #
    2023-02-22T07:33:27.781500  / # export SHELL=3D/bin/sh. /lava-3364507/e=
nvironment
    2023-02-22T07:33:27.781959  <3>[   18.129599] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:33:27.782186  =

    2023-02-22T07:33:27.883528  / # . /lava-3364507/environment/lava-336450=
7/bin/lava-test-runner /lava-3364507/1
    2023-02-22T07:33:27.884205  =

    2023-02-22T07:33:27.890606  / # /lava-3364507/bin/lava-test-runner /lav=
a-3364507/1
    2023-02-22T07:33:27.922432  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7bc752041af9e8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c7bc752041af9e8c8639
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:43:45.355616  <8>[   18.339951] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3364616_1.5.2.4.1>
    2023-02-22T07:43:45.459540  / # #
    2023-02-22T07:43:45.561349  export SHELL=3D/bin/sh
    2023-02-22T07:43:45.561808  #
    2023-02-22T07:43:45.663249  / # export SHELL=3D/bin/sh. /lava-3364616/e=
nvironment
    2023-02-22T07:43:45.663711  =

    2023-02-22T07:43:45.663979  / # <3>[   18.595891] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:43:45.765355  . /lava-3364616/environment/lava-3364616/bi=
n/lava-test-runner /lava-3364616/1
    2023-02-22T07:43:45.766081  =

    2023-02-22T07:43:45.782160  / # /lava-3364616/bin/lava-test-runner /lav=
a-3364616/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c8d3b7d34467758c8677

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c8d3b7d34467758c8680
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:48:24.545357  / # #
    2023-02-22T07:48:24.647073  export SHELL=3D/bin/sh
    2023-02-22T07:48:24.647504  #
    2023-02-22T07:48:24.748847  / # export SHELL=3D/bin/sh. /lava-3364651/e=
nvironment
    2023-02-22T07:48:24.749259  =

    2023-02-22T07:48:24.749501  / # <3>[   18.195537] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:48:24.850846  . /lava-3364651/environment/lava-3364651/bi=
n/lava-test-runner /lava-3364651/1
    2023-02-22T07:48:24.851577  =

    2023-02-22T07:48:24.858562  / # /lava-3364651/bin/lava-test-runner /lav=
a-3364651/1
    2023-02-22T07:48:24.920439  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c94d050bd319c58c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c94d050bd319c58c8653
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:50:24.998802  #
    2023-02-22T07:50:25.100982  / # #export SHELL=3D/bin/sh
    2023-02-22T07:50:25.101829  =

    2023-02-22T07:50:25.203740  / # export SHELL=3D/bin/sh. /lava-3364705/e=
nvironment
    2023-02-22T07:50:25.204192  =

    2023-02-22T07:50:25.204468  / # <3>[   18.221730] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:50:25.305859  . /lava-3364705/environment/lava-3364705/bi=
n/lava-test-runner /lava-3364705/1
    2023-02-22T07:50:25.306560  =

    2023-02-22T07:50:25.325454  / # /lava-3364705/bin/lava-test-runner /lav=
a-3364705/1
    2023-02-22T07:50:25.381426  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7ff3d2bf1c4d28c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c7ff3d2bf1c4d28c8=
644
        failing since 28 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c93737d6e20c778c86ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c93737d6e20c778c8=
6ad
        failing since 16 days (last pass: next-20230203, first fail: next-2=
0230206) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c20abcbecc64be8c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c20abcbecc64be8c863b
        failing since 35 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-22T07:19:17.798953  / # #
    2023-02-22T07:19:17.900871  export SHELL=3D/bin/sh
    2023-02-22T07:19:17.901391  #
    2023-02-22T07:19:18.002774  / # export SHELL=3D/bin/sh. /lava-3364388/e=
nvironment
    2023-02-22T07:19:18.003317  =

    2023-02-22T07:19:18.104722  / # . /lava-3364388/environment/lava-336438=
8/bin/lava-test-runner /lava-3364388/1
    2023-02-22T07:19:18.105606  =

    2023-02-22T07:19:18.109245  / # /lava-3364388/bin/lava-test-runner /lav=
a-3364388/1
    2023-02-22T07:19:18.181128  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:19:18.181746  + cd /lava-3364388/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c5716bc45b4d048c86ff

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c5716bc45b4d048c8708
        failing since 35 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-22T07:33:46.003155  / # #
    2023-02-22T07:33:46.105295  export SHELL=3D/bin/sh
    2023-02-22T07:33:46.105885  #
    2023-02-22T07:33:46.106220  / # export SHELL=3D/bin/sh<3>[   17.992541]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:33:46.207736  . /lava-3364496/environment
    2023-02-22T07:33:46.208222  =

    2023-02-22T07:33:46.309786  / # . /lava-3364496/environment/lava-336449=
6/bin/lava-test-runner /lava-3364496/1
    2023-02-22T07:33:46.310639  =

    2023-02-22T07:33:46.328133  / # /lava-3364496/bin/lava-test-runner /lav=
a-3364496/1
    2023-02-22T07:33:46.393046  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c81816c7e8454c8c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c81816c7e8454c8c8=
64f
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c883a13ee0c1588c8647

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c883a13ee0c1588c8650
        failing since 35 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-22T07:46:50.102361  / # #
    2023-02-22T07:46:50.204517  export SHELL=3D/bin/sh
    2023-02-22T07:46:50.205020  #
    2023-02-22T07:46:50.205264  / # <3>[   18.174672] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:46:50.306561  export SHELL=3D/bin/sh. /lava-3364614/envir=
onment
    2023-02-22T07:46:50.306998  =

    2023-02-22T07:46:50.408335  / # . /lava-3364614/environment/lava-336461=
4/bin/lava-test-runner /lava-3364614/1
    2023-02-22T07:46:50.409050  =

    2023-02-22T07:46:50.418265  / # /lava-3364614/bin/lava-test-runner /lav=
a-3364614/1
    2023-02-22T07:46:50.485288  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c90126ae69b35a8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c90126ae69b35a8c8639
        failing since 35 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-22T07:48:41.499144  / # #
    2023-02-22T07:48:41.601468  export SHELL=3D/bin/sh
    2023-02-22T07:48:41.601962  #
    2023-02-22T07:48:41.703330  / # export SHELL=3D/bin/sh. /lava-3364660/e=
nvironment
    2023-02-22T07:48:41.703839  =

    2023-02-22T07:48:41.805268  / # . /lava-3364660/environment/lava-336466=
0/bin/lava-test-runner /lava-3364660/1
    2023-02-22T07:48:41.806026  =

    2023-02-22T07:48:41.810220  / # /lava-3364660/bin/lava-test-runner /lav=
a-3364660/1
    2023-02-22T07:48:41.881987  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:48:41.882355  + cd /lava-3364660/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c97ab7674c91d48c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c97ab7674c91d48c8638
        failing since 35 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-22T07:51:03.853215  + set +x<8>[   18.386507] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3364707_1.5.2.4.1>
    2023-02-22T07:51:03.958907  / # #
    2023-02-22T07:51:04.061337  export SHELL=3D/bin/sh
    2023-02-22T07:51:04.061999  #
    2023-02-22T07:51:04.163533  / # export SHELL=3D/bin/sh. /lava-3364707/e=
nvironment
    2023-02-22T07:51:04.164200  =

    2023-02-22T07:51:04.265982  / # . /lava-3364707/environment/lava-336470=
7/bin/lava-test-runner /lava-3364707/1
    2023-02-22T07:51:04.266802  =

    2023-02-22T07:51:04.283688  / # /lava-3364707/bin/lava-test-runner /lav=
a-3364707/1
    2023-02-22T07:51:04.342548  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c20702ebe05ba68c8639

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c20702ebe05ba68c8642
        failing since 4 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-22T07:19:05.990293  + set +x
    2023-02-22T07:19:05.992260  <8>[   18.324596] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3364385_1.5.2.4.1>
    2023-02-22T07:19:06.098020  / # #
    2023-02-22T07:19:06.199845  export SHELL=3D/bin/sh
    2023-02-22T07:19:06.200228  #
    2023-02-22T07:19:06.301607  / # export SHELL=3D/bin/sh. /lava-3364385/e=
nvironment
    2023-02-22T07:19:06.301991  =

    2023-02-22T07:19:06.403358  / # . /lava-3364385/environment/lava-336438=
5/bin/lava-test-runner /lava-3364385/1
    2023-02-22T07:19:06.404058  =

    2023-02-22T07:19:06.423070  / # /lava-3364385/bin/lava-test-runner /lav=
a-3364385/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c58423ed5942848c868f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c58423ed5942848c8698
        failing since 4 days (last pass: next-20221129, first fail: next-20=
230217)

    2023-02-22T07:34:03.050221  / # #
    2023-02-22T07:34:03.152526  export SHELL=3D/bin/sh
    2023-02-22T07:34:03.153164  #
    2023-02-22T07:34:03.254704  / # export SHELL=3D/bin/sh. /lava-3364489/e=
nvironment
    2023-02-22T07:34:03.255369  =

    2023-02-22T07:34:03.356869  / # . /lava-3364489/environment/lava-336448=
9/bin/lava-test-runner /lava-3364489/1
    2023-02-22T07:34:03.357571  =

    2023-02-22T07:34:03.377128  / # /lava-3364489/bin/lava-test-runner /lav=
a-3364489/1
    2023-02-22T07:34:03.453964  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:34:03.454496  + cd /lava-3364489/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c894ae1bf49c318c8639

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c895ae1bf49c318c8642
        failing since 4 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-22T07:47:03.436156  / # #
    2023-02-22T07:47:03.537941  export SHELL=3D/bin/sh
    2023-02-22T07:47:03.538380  #
    2023-02-22T07:47:03.639826  / # export SHELL=3D/bin/sh. /lava-3364604/e=
nvironment
    2023-02-22T07:47:03.640225  =

    2023-02-22T07:47:03.741693  / # . /lava-3364604/environment/lava-336460=
4/bin/lava-test-runner /lava-3364604/1
    2023-02-22T07:47:03.742460  =

    2023-02-22T07:47:03.746765  / # /lava-3364604/bin/lava-test-runner /lav=
a-3364604/1
    2023-02-22T07:47:03.826616  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:47:03.827221  + cd /lava-3364604/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c912d25331a19b8c86d0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c912d25331a19b8c86d9
        failing since 1 day (last pass: next-20221129, first fail: next-202=
30221)

    2023-02-22T07:49:06.836145  <8>[   18.252409] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3364683_1.5.2.4.1>
    2023-02-22T07:49:06.942502  / # #
    2023-02-22T07:49:07.044532  export SHELL=3D/bin/sh
    2023-02-22T07:49:07.045034  #
    2023-02-22T07:49:07.146488  / # export SHELL=3D/bin/sh. /lava-3364683/e=
nvironment
    2023-02-22T07:49:07.146996  =

    2023-02-22T07:49:07.248385  / # . /lava-3364683/environment/lava-336468=
3/bin/lava-test-runner /lava-3364683/1
    2023-02-22T07:49:07.249211  =

    2023-02-22T07:49:07.268607  / # /lava-3364683/bin/lava-test-runner /lav=
a-3364683/1
    2023-02-22T07:49:07.332486  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c990b7674c91d48c8716

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech=
-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech=
-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c990b7674c91d48c871f
        failing since 4 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-22T07:51:26.512382  / # #
    2023-02-22T07:51:26.614328  export SHELL=3D/bin/sh
    2023-02-22T07:51:26.614851  #
    2023-02-22T07:51:26.716224  / # export SHELL=3D/bin/sh. /lava-3364703/e=
nvironment
    2023-02-22T07:51:26.716751  =

    2023-02-22T07:51:26.818149  / # . /lava-3364703/environment/lava-336470=
3/bin/lava-test-runner /lava-3364703/1
    2023-02-22T07:51:26.818959  =

    2023-02-22T07:51:26.823335  / # /lava-3364703/bin/lava-test-runner /lav=
a-3364703/1
    2023-02-22T07:51:26.902367  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-22T07:51:26.903011  + cd /lava-3364703/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca14d43be863ce8c8692

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5ca14d43be863ce8c869b
        failing since 4 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-22T07:53:30.099568  <8>[   18.274702] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3364713_1.5.2.4.1>
    2023-02-22T07:53:30.205132  / # #
    2023-02-22T07:53:30.307081  export SHELL=3D/bin/sh
    2023-02-22T07:53:30.307624  #
    2023-02-22T07:53:30.409060  / # export SHELL=3D/bin/sh. /lava-3364713/e=
nvironment
    2023-02-22T07:53:30.409574  =

    2023-02-22T07:53:30.510896  / # . /lava-3364713/environment/lava-336471=
3/bin/lava-test-runner /lava-3364713/1
    2023-02-22T07:53:30.511680  =

    2023-02-22T07:53:30.515933  / # /lava-3364713/bin/lava-test-runner /lav=
a-3364713/1
    2023-02-22T07:53:30.595840  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c81416c7e8454c8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c81416c7e8454c8c8=
63b
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c8c665f74782808c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c8c665f74782808c8=
630
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c9667eb3de3bff8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c9667eb3de3bff8c8=
647
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c8139cb83b83d38c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c8139cb83b83d38c8=
646
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c1f2d863bc099f8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c1f2d863bc099f8c8638
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:19:05.233016  / # #
    2023-02-22T07:19:05.334796  export SHELL=3D/bin/sh
    2023-02-22T07:19:05.335289  #
    2023-02-22T07:19:05.436466  / # export SHELL=3D/bin/sh. /lava-3364391/e=
nvironment
    2023-02-22T07:19:05.437036  =

    2023-02-22T07:19:05.437289  / # <3>[   18.064785] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:19:05.538574  . /lava-3364391/environment/lava-3364391/bi=
n/lava-test-runner /lava-3364391/1
    2023-02-22T07:19:05.539435  =

    2023-02-22T07:19:05.551667  / # /lava-3364391/bin/lava-test-runner /lav=
a-3364391/1
    2023-02-22T07:19:05.608687  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c54ff5eef52d7b8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c54ff5eef52d7b8c8638
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:33:28.570411  / # #
    2023-02-22T07:33:28.673357  export SHELL=3D/bin/sh
    2023-02-22T07:33:28.673750  #
    2023-02-22T07:33:28.775120  / # export SHELL=3D/bin/sh. /lava-3364494/e=
nvironment
    2023-02-22T07:33:28.775598  =

    2023-02-22T07:33:28.775932  / # <3>[   18.119216] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:33:28.877583  . /lava-3364494/environment/lava-3364494/bi=
n/lava-test-runner /lava-3364494/1
    2023-02-22T07:33:28.878890  =

    2023-02-22T07:33:28.882578  / # /lava-3364494/bin/lava-test-runner /lav=
a-3364494/1
    2023-02-22T07:33:28.943644  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7bb6504760c5e8c866b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c7bb6504760c5e8c8674
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:43:45.918597  / # #
    2023-02-22T07:43:46.020431  export SHELL=3D/bin/sh
    2023-02-22T07:43:46.020885  #
    2023-02-22T07:43:46.122065  / # export SHELL=3D/bin/sh. /lava-3364615/e=
nvironment
    2023-02-22T07:43:46.122491  =

    2023-02-22T07:43:46.122727  / # <3>[   18.104476] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:43:46.223963  . /lava-3364615/environment/lava-3364615/bi=
n/lava-test-runner /lava-3364615/1
    2023-02-22T07:43:46.224636  =

    2023-02-22T07:43:46.240931  / # /lava-3364615/bin/lava-test-runner /lav=
a-3364615/1
    2023-02-22T07:43:46.295820  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c8d565f74782808c866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c8d565f74782808c8676
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:48:26.081504  / # #
    2023-02-22T07:48:26.183059  export SHELL=3D/bin/sh
    2023-02-22T07:48:26.183389  #
    2023-02-22T07:48:26.284550  / # export SHELL=3D/bin/sh. /lava-3364661/e=
nvironment
    2023-02-22T07:48:26.284897  =

    2023-02-22T07:48:26.285083  / # <3>[   18.070803] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:48:26.386260  . /lava-3364661/environment/lava-3364661/bi=
n/lava-test-runner /lava-3364661/1
    2023-02-22T07:48:26.387038  =

    2023-02-22T07:48:26.402640  / # /lava-3364661/bin/lava-test-runner /lav=
a-3364661/1
    2023-02-22T07:48:26.457495  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c94b050bd319c58c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f5c94b050bd319c58c8645
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-22T07:50:26.555210  / # #
    2023-02-22T07:50:26.656584  export SHELL=3D/bin/sh
    2023-02-22T07:50:26.656900  #
    2023-02-22T07:50:26.758026  / # export SHELL=3D/bin/sh. /lava-3364699/e=
nvironment
    2023-02-22T07:50:26.758369  =

    2023-02-22T07:50:26.758564  / # <3>[   18.056214] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-22T07:50:26.859782  . /lava-3364699/environment/lava-3364699/bi=
n/lava-test-runner /lava-3364699/1
    2023-02-22T07:50:26.860523  =

    2023-02-22T07:50:26.868965  / # /lava-3364699/bin/lava-test-runner /lav=
a-3364699/1
    2023-02-22T07:50:26.930867  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d62766e85f445c8c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d62766e85f445c8c8=
638
        failing since 25 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d57a03ff8163718c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d57a03ff8163718c8=
635
        new failure (last pass: next-20230221) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c13e8b5953eeb68c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c13e8b5953eeb68c8=
644
        failing since 182 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cf12a1ae27f0da8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cf12a1ae27f0da8c8=
630
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-baylibre    | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c693e4935b2c478c868c

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f5c693e4935b2c478c8694
        failing since 7 days (last pass: next-20230214, first fail: next-20=
230215)

    2023-02-22T07:38:14.972659  /lava-3364530/1/../bin/lava-test-case
    2023-02-22T07:38:15.096325  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cb8665133be6f98c8630

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f5cb8665133be6f98c8638
        failing since 7 days (last pass: next-20230214, first fail: next-20=
230215)

    2023-02-22T07:59:49.686873  /lava-53659/1/../bin/lava-test-case
    2023-02-22T07:59:49.752716  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c42f133be879228c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c42f133be879228c8=
66c
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c615b0548d6eaa8c86ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c615b0548d6eaa8c8=
6cb
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c867e12f1888768c8679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c867e12f1888768c8=
67a
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cbd63fb30d65bf8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cbd63fb30d65bf8c8=
630
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c58f5ebbd086bd8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c58f5ebbd086bd8c8=
647
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d9ef78151a72d58c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d9ef78151a72d58c8=
652
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5db3d81acc06e4a8c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5db3d81acc06e4a8c8=
642
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d9f13a27a485188c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d9f13a27a485188c8=
642
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c2a0a1c60cd8158c869d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c2a0a1c60cd8158c8=
69e
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c53530a04bee4a8c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c53530a04bee4a8c8=
63a
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c5ad5679ea259d8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c5ad5679ea259d8c8=
640
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c5ae64dbd979a88c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c5ae64dbd979a88c8=
649
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7a5d095a9b35f8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c7a5d095a9b35f8c8=
636
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7caff69e1f2718c866e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c7caff69e1f2718c8=
66f
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c86ae12f1888768c8687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c86ae12f1888768c8=
688
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c6fd78ad7f03c08c866c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c6fd78ad7f03c08c8=
66d
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c73b411ac480b78c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c73b411ac480b78c8=
652
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c91ae62e2affad8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c91ae62e2affad8c8=
630
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca32d5f4b116388c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ca32d5f4b116388c8=
64b
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca821dec56339a8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ca821dec56339a8c8=
632
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cd3e33fb71ecd48c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cd3e33fb71ecd48c8=
632
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cd66606f82b8f98c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cd66606f82b8f98c8=
63c
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ce5719af39dc5a8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ce5719af39dc5a8c8=
637
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c4c61c3143dc9a8c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c4c61c3143dc9a8c8=
643
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c4ee11c6ddd45e8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c4ee11c6ddd45e8c8=
63b
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c602098eafb5c18c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c602098eafb5c18c8=
681
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c756fd3d5bebfe8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c756fd3d5bebfe8c8=
630
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c81ecc7866542a8c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c81ecc7866542a8c8=
655
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c5d6986e3a3e278c865f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c5d6986e3a3e278c8=
660
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c768534d3576448c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c768534d3576448c8=
658
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca96fea0fc65908c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ca96fea0fc65908c8=
636
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cc76ab5b0434978c8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cc76ab5b0434978c8=
679
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d9ed161a7182ea8c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d9ed161a7182ea8c8=
63a
        failing since 4 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5da76976ffd3ed18c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5da76976ffd3ed18c8=
630
        failing since 4 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5d9ced63972c2af8c8679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5d9ced63972c2af8c8=
67a
        failing since 4 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c2e0bcd46041f28c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c2e0bcd46041f28c8=
63c
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c37c98b3754b528c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c37c98b3754b528c8=
659
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c53604865476bf8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c53604865476bf8c8=
646
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c59a5ebbd086bd8c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c59a5ebbd086bd8c8=
655
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c59b5ebbd086bd8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c59b5ebbd086bd8c8=
658
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7a3d095a9b35f8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c7a3d095a9b35f8c8=
633
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7cbff69e1f2718c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c7cbff69e1f2718c8=
672
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c868bb3cfe15fc8c86a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c868bb3cfe15fc8c8=
6a2
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c739632a57f9658c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c739632a57f9658c8=
630
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c775e0d4f1eb8e8c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c775e0d4f1eb8e8c8=
65d
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c956050bd319c58c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c956050bd319c58c8=
667
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca5ad5f4b116388c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ca5ad5f4b116388c8=
670
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca84f100263e568c86dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ca84f100263e568c8=
6de
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ccee36061eae898c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ccee36061eae898c8=
638
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cda32d9ef456198c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cda32d9ef456198c8=
658
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ce2f8b782808a38c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ce2f8b782808a38c8=
66c
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c4da870fe431718c866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c4da870fe431718c8=
66b
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c50367ab14df1e8c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c50367ab14df1e8c8=
670
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c617b0548d6eaa8c86cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c617b0548d6eaa8c8=
6ce
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c613e82bdd27c68c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c613e82bdd27c68c8=
64d
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c75216f8d729838c8717

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c75216f8d729838c8=
718
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5caaa8dc69b07c28c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5caaa8dc69b07c28c8=
630
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cc4efb58b77ccb8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cc4efb58b77ccb8c8=
630
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c5040c91234f9e8c86e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c5040c91234f9e8c8=
6ea
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c57e23ed5942848c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c57e23ed5942848c8=
681
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7218a373ece138c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c7218a373ece138c8=
66a
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c7ead609c475de8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c7ead609c475de8c8=
641
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c915b4bc4c823c8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c915b4bc4c823c8c8=
631
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c9a19530f721978c86a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c9a19530f721978c8=
6a5
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c962050bd319c58c867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c962050bd319c58c8=
680
        failing since 91 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c85ebb3cfe15fc8c8697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c85ebb3cfe15fc8c8=
698
        failing since 91 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63f5d5c009d75442878c8633

  Results:     75 PASS, 13 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/63f5d5c009d75442878c867a
        failing since 2 days (last pass: next-20230217, first fail: next-20=
230220)

    2023-02-22T08:43:06.978433  /lava-9275748/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
3f5d5c009d75442878c867b
        failing since 2 days (last pass: next-20230217, first fail: next-20=
230220)

    2023-02-22T08:43:05.295932  <4>[   35.623478] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2

    2023-02-22T08:43:05.949998  /lava-9275748/1/../bin/lava-test-case

    2023-02-22T08:43:05.962760  <8>[   36.291787] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c8019cb83b83d38c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c8019cb83b83d38c8=
636
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c302bcd46041f28c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c302bcd46041f28c8=
65e
        new failure (last pass: next-20230221) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c8013d2bf1c4d28c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c8013d2bf1c4d28c8=
64d
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c805c78e69309b8c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c805c78e69309b8c8=
666
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c81616c7e8454c8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c81616c7e8454c8c8=
63e
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c803c78e69309b8c8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c803c78e69309b8c8=
663
        failing since 14 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5ca94fea0fc65908c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5ca94fea0fc65908c8=
631
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cc9cd68c3dd96b8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cc9cd68c3dd96b8c8=
658
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5cfd164bef960408c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5cfd164bef960408c8=
642
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f5c9ef665ec683388c8684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230222/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f5c9ef665ec683388c8=
685
        failing since 90 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =20
