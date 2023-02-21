Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A9969DE91
	for <lists+linux-next@lfdr.de>; Tue, 21 Feb 2023 12:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbjBULQk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Feb 2023 06:16:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbjBULQi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Feb 2023 06:16:38 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEB9B773
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2023 03:16:33 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v3-20020a17090a6b0300b002341a2656e5so4244391pjj.1
        for <linux-next@vger.kernel.org>; Tue, 21 Feb 2023 03:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=efXOGn+dxTZ12trX1K3v6H6Gk2iiym+fV1NjIN8NSAw=;
        b=s24VpKoJcA3KaTQQniXzH35zGW67rm1euEt3IRoqPt3zBjUcZ0Bd/iTWNhxsqJCBFM
         4Slyrkcy6pNt9kLh6gPGEuwZ/jGopz2RpXehSvmdsSGw2nvJWKHXTHUIkdTKlZhmGSWn
         UAh4evhnWf9TkHeXKYAcIEujHWikCxi2AoKm/WRLrZBiM4g7jFOT+JThv1156799U7/L
         ti5Tqzydan3sH83GjOy68i/ul0QzIXujP4CGgtVHkSMC4CFnrhAfa+RTvL8I/6A66ym0
         VLJf1/etYzSWZYCyVHD7klzGlmrTnGUb8vzeMsJgmngd2ySV72WwpUHw3EHRo6+GheND
         fEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efXOGn+dxTZ12trX1K3v6H6Gk2iiym+fV1NjIN8NSAw=;
        b=JX0cgL48tt+qtqxuQabL6AtTbAwt0/aawzBb4YMR1slzj5Ij+w0OunmgfzyuHfxSy7
         llArqOSYLQIhd98hrKXQf7TaHumHvH7NorxVV0Qg5zs9ADsfOhLTb16JkYXXbtrAtlS7
         lrcU2hc1aHxhU14Zve2yYCcvYM9bltsC8I5rr8hIg5lDuLUuurCASBL8OzfeKxuthNJM
         C0i6DWE2DKTpD/Y6G94YezUq4EftbqY7Lt8OSd/rINlRG3DwH7dM+Ko2YqRxJIsDlnQH
         9a18ariqe1EzXF7CuJrO/bEFW0G4JW5lmhRXgYPxMhLrPWeQdmdQZiUrqDnGfy1YQHu0
         9EGg==
X-Gm-Message-State: AO0yUKVlnTbtjNLZgbjoNHbzBXMWYmnl9gQQekc5D8bmCn2Lsb76YwI0
        9yVWjsfPLmlfiFXbDP0zfN2JD5c992A1jVFp
X-Google-Smtp-Source: AK7set9xCnFyK1qP0BQzXDFS9c1fcI7ppV1sJs/7Cz5aAMx4KtrFlXuXjY0APIxAgt/M5ZWmgEVQWQ==
X-Received: by 2002:a17:90b:3a8c:b0:233:b5c2:7d17 with SMTP id om12-20020a17090b3a8c00b00233b5c27d17mr6543171pjb.23.1676978190935;
        Tue, 21 Feb 2023 03:16:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090a2a8e00b00231224439c1sm3003008pjd.27.2023.02.21.03.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 03:16:30 -0800 (PST)
Message-ID: <63f4a80e.170a0220.8fb45.4e2b@mx.google.com>
Date:   Tue, 21 Feb 2023 03:16:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230221
X-Kernelci-Report-Type: test
Subject: next/master baseline: 843 runs, 190 regressions (next-20230221)
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

next/master baseline: 843 runs, 190 regressions (next-20230221)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | sama=
5_defconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10     | bcm2=
835_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 2          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 3          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-baylibre    | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+debug              | 1          =

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

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

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

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

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

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230221/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230221
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      465461cf48465b8a0a54025db5ae2b3df7a04577 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46f403f0827ed948c863c

  Results:     18 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-R721T=
-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
3f46f413f0827ed948c864f
        new failure (last pass: next-20230220)

    2023-02-21T07:13:37.536321  /usr/bin/tpm2_getcap

    2023-02-21T07:13:37.563934  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =


    2023-02-21T07:13:37.570874  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =


    2023-02-21T07:13:37.582413  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =


    2023-02-21T07:13:37.585363  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure

    2023-02-21T07:13:37.589215  ERROR: Unable to run tpm2_getcap

    2023-02-21T07:13:38.583178  ERROR:tcti:src/tss2-tcti/tcti-device.c:286:=
tcti_device_receive() Failed to read response from fd 3, got errno 14: Bad =
address =


    2023-02-21T07:13:38.593381  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:307:Esys_GetCapability_Finish() Received a non-TPM Error =


    2023-02-21T07:13:38.601831  ERROR:esys:src/tss2-esys/api/Esys_GetCapabi=
lity.c:107:Esys_GetCapability() Esys Finish ErrorCode (0x000a000a) =


    2023-02-21T07:13:38.606825  ERROR: Esys_GetCapability(0xA000A) - tcti:I=
O failure
 =

    ... (44 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f487d2820b41726b8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f487d2820b41726b8c8=
632
        failing since 157 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10     | sama=
5_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46d95c2192407808c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46d95c2192407808c8=
633
        failing since 20 days (last pass: next-20230125, first fail: next-2=
0230131) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10     | bcm2=
835_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63f472cfa59c7378d98c8633

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f472cfa59c7378d98c863c
        new failure (last pass: next-20230220)

    2023-02-21T07:28:52.343143  + set +x
    2023-02-21T07:28:52.347125  <8>[   19.076217] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 49165_1.5.2.4.1>
    2023-02-21T07:28:52.479791  / # #
    2023-02-21T07:28:52.582168  export SHELL=3D/bin/sh
    2023-02-21T07:28:52.582717  #
    2023-02-21T07:28:52.684253  / # export SHELL=3D/bin/sh. /lava-49165/env=
ironment
    2023-02-21T07:28:52.684780  =

    2023-02-21T07:28:52.786311  / # . /lava-49165/environment/lava-49165/bi=
n/lava-test-runner /lava-49165/1
    2023-02-21T07:28:52.787036  =

    2023-02-21T07:28:52.794231  / # /lava-49165/bin/lava-test-runner /lava-=
49165/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46f5c15e01700a68c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46f5c15e01700a68c8=
630
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46f4f3f0827ed948c866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46f4f3f0827ed948c8676
        failing since 33 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-21T07:14:00.783096  <8>[   15.099731] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362579_1.5.2.4.1>
    2023-02-21T07:14:00.891308  / # #
    2023-02-21T07:14:00.992940  export SHELL=3D/bin/sh
    2023-02-21T07:14:00.993381  #
    2023-02-21T07:14:01.094557  / # export SHELL=3D/bin/sh. /lava-3362579/e=
nvironment
    2023-02-21T07:14:01.094997  =

    2023-02-21T07:14:01.196242  / # . /lava-3362579/environment/lava-336257=
9/bin/lava-test-runner /lava-3362579/1
    2023-02-21T07:14:01.196903  =

    2023-02-21T07:14:01.197093  / # /lava-3362579/bin/lava-test-runner /lav=
a-3362579/1<3>[   15.481378] Bluetooth: hci0: command 0x0c03 tx timeout
    2023-02-21T07:14:01.205963   =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47169f86089e04b8c865e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47169f86089e04b8c8667
        failing since 33 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-21T07:23:08.647309  <8>[   16.753017] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362721_1.5.2.4.1>
    2023-02-21T07:23:08.757199  / # #
    2023-02-21T07:23:08.861173  export SHELL=3D/bin/sh
    2023-02-21T07:23:08.862405  #
    2023-02-21T07:23:08.964722  / # export SHELL=3D/bin/sh. /lava-3362721/e=
nvironment
    2023-02-21T07:23:08.965968  =

    2023-02-21T07:23:09.068324  / # . /lava-3362721/environment/lava-336272=
1/bin/lava-test-runner /lava-3362721/1
    2023-02-21T07:23:09.070380  =

    2023-02-21T07:23:09.074523  / # /lava-3362721/bin/lava-test-runner /lav=
a-3362721/1
    2023-02-21T07:23:09.169023  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47349d8ab8862f38c8682

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47349d8ab8862f38c868b
        failing since 34 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-21T07:31:04.071439  <8>[   15.349473] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362845_1.5.2.4.1>
    2023-02-21T07:31:04.182396  / # #
    2023-02-21T07:31:04.286415  export SHELL=3D/bin/sh
    2023-02-21T07:31:04.287684  <3>[   15.407470] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-02-21T07:31:04.288329  #
    2023-02-21T07:31:04.390992  / # export SHELL=3D/bin/sh. /lava-3362845/e=
nvironment
    2023-02-21T07:31:04.392262  =

    2023-02-21T07:31:04.494928  / # . /lava-3362845/environment/lava-336284=
5/bin/lava-test-runner /lava-3362845/1
    2023-02-21T07:31:04.497002  =

    2023-02-21T07:31:04.501787  / # /lava-3362845/bin/lava-test-runner /lav=
a-3362845/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46f057cc001cfcc8c8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46f057cc001cfcc8c8659
        failing since 21 days (last pass: next-20221205, first fail: next-2=
0230130)

    2023-02-21T07:12:48.771898  + set +x
    2023-02-21T07:12:48.772064  [   12.803940] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910018_1.5.2.3.1>
    2023-02-21T07:12:48.879815  / # #
    2023-02-21T07:12:48.981513  export SHELL=3D/bin/sh
    2023-02-21T07:12:48.981862  #
    2023-02-21T07:12:49.083026  / # export SHELL=3D/bin/sh. /lava-910018/en=
vironment
    2023-02-21T07:12:49.083438  =

    2023-02-21T07:12:49.184632  / # . /lava-910018/environment/lava-910018/=
bin/lava-test-runner /lava-910018/1
    2023-02-21T07:12:49.185161  =

    2023-02-21T07:12:49.188242  / # /lava-910018/bin/lava-test-runner /lava=
-910018/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470bcefdbd3ab288c8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f470bcefdbd3ab288c863a
        failing since 21 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-21T07:20:08.521773  + set +x
    2023-02-21T07:20:08.522109  [   12.067739] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910026_1.5.2.3.1>
    2023-02-21T07:20:08.629405  / # #
    2023-02-21T07:20:08.731249  export SHELL=3D/bin/sh
    2023-02-21T07:20:08.731772  #
    2023-02-21T07:20:08.833046  / # export SHELL=3D/bin/sh. /lava-910026/en=
vironment
    2023-02-21T07:20:08.833471  =

    2023-02-21T07:20:08.934662  / # . /lava-910026/environment/lava-910026/=
bin/lava-test-runner /lava-910026/1
    2023-02-21T07:20:08.935283  =

    2023-02-21T07:20:08.938158  / # /lava-910026/bin/lava-test-runner /lava=
-910026/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47317143f6c1fb98c86ac

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47317143f6c1fb98c86b5
        failing since 22 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-21T07:30:12.520837  + set +x
    2023-02-21T07:30:12.521028  [   13.074479] <LAVA_SIGNAL_ENDRUN 0_dmesg =
910039_1.5.2.3.1>
    2023-02-21T07:30:12.629116  / # #
    2023-02-21T07:30:12.730705  export SHELL=3D/bin/sh
    2023-02-21T07:30:12.731201  #
    2023-02-21T07:30:12.835194  / # export SHELL=3D/bin/sh. /lava-910039/en=
vironment
    2023-02-21T07:30:12.838270  =

    2023-02-21T07:30:12.944697  / # . /lava-910039/environment/lava-910039/=
bin/lava-test-runner /lava-910039/1
    2023-02-21T07:30:12.945560  =

    2023-02-21T07:30:12.948988  / # /lava-910039/bin/lava-test-runner /lava=
-910039/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4761dacf175e7c38c86a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4761dacf175e7c38c8=
6a9
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47695c7d05e49098c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47695c7d05e49098c8=
634
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4772d8b645051148c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4772d8b645051148c8=
630
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46d97c2192407808c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46d97c2192407808c8=
639
        failing since 315 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63f476bfb4611d4ea38c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f476bfb4611d4ea38c8=
637
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63f46dba8a22614f988c865c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46dba8a22614f988c8663
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:07:23.274570  <8>[   22.018456] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 281572_1.5.2.4.1>
    2023-02-21T07:07:23.380555  / # #
    2023-02-21T07:07:23.482529  export SHELL=3D/bin/sh
    2023-02-21T07:07:23.482996  #
    2023-02-21T07:07:23.584380  / # export SHELL=3D/bin/sh. /lava-281572/en=
vironment
    2023-02-21T07:07:23.585094  =

    2023-02-21T07:07:23.686561  / # . /lava-281572/environment/lava-281572/=
bin/lava-test-runner /lava-281572/1
    2023-02-21T07:07:23.687465  =

    2023-02-21T07:07:23.692033  / # /lava-281572/bin/lava-test-runner /lava=
-281572/1
    2023-02-21T07:07:23.762912  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f46dba8a22614f988c8667
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:07:25.859128  /lava-281572/1/../bin/lava-test-case
    2023-02-21T07:07:25.859500  <8>[   24.588265] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-21T07:07:25.859748  /lava-281572/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f46dba8a22614f988c8669
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:07:26.917634  /lava-281572/1/../bin/lava-test-case
    2023-02-21T07:07:26.918037  <8>[   25.626150] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-21T07:07:26.918296  /lava-281572/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f46dba8a22614f988c866e
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:07:27.994302  /lava-281572/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f46dba8a22614f988c866f
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:07:27.997513  <8>[   26.740199] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-21T07:07:29.051903  /lava-281572/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/63f46eaa3909f167578c866c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46eaa3909f167578c8673
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:11:23.953534  / # #
    2023-02-21T07:11:24.055778  export SHELL=3D/bin/sh
    2023-02-21T07:11:24.056419  #
    2023-02-21T07:11:24.157845  / # export SHELL=3D/bin/sh. /lava-281580/en=
vironment
    2023-02-21T07:11:24.158567  =

    2023-02-21T07:11:24.260077  / # . /lava-281580/environment/lava-281580/=
bin/lava-test-runner /lava-281580/1
    2023-02-21T07:11:24.260922  =

    2023-02-21T07:11:24.280942  / # /lava-281580/bin/lava-test-runner /lava=
-281580/1
    2023-02-21T07:11:24.336859  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:11:24.337233  + <8>[   22.558616] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 281580_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f46eaa3909f167578c8677
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:11:26.430093  /lava-281580/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f46eaa3909f167578c8679
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:11:27.490467  /lava-281580/1/../bin/lava-test-case
    2023-02-21T07:11:27.490868  <8>[   25.700812] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-21T07:11:27.491110  /lava-281580/1/../bin/lava-test-case
    2023-02-21T07:11:27.491341  <8>[   25.719504] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f46eaa3909f167578c867e
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:11:28.565262  /lava-281580/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f46eaa3909f167578c867f
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:11:28.568494  <8>[   26.815649] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-21T07:11:29.626118  /lava-281580/1/../bin/lava-test-case
    2023-02-21T07:11:29.626518  <8>[   27.836876] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-21T07:11:29.626760  /lava-281580/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63f470eeb6dc5717f48c8664

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f470eeb6dc5717f48c866b
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:20:58.609855  / # #
    2023-02-21T07:20:58.711943  export SHELL=3D/bin/sh
    2023-02-21T07:20:58.712596  #
    2023-02-21T07:20:58.814118  / # export SHELL=3D/bin/sh. /lava-281590/en=
vironment
    2023-02-21T07:20:58.814662  =

    2023-02-21T07:20:58.916373  / # . /lava-281590/environment/lava-281590/=
bin/lava-test-runner /lava-281590/1
    2023-02-21T07:20:58.917187  =

    2023-02-21T07:20:58.922023  / # /lava-281590/bin/lava-test-runner /lava=
-281590/1
    2023-02-21T07:20:58.992998  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:20:58.993366  + <8>[   22.505619] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 281590_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f470eeb6dc5717f48c866f
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:21:01.086062  /lava-281590/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f470eeb6dc5717f48c8671
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:21:02.142636  /lava-281590/1/../bin/lava-test-case
    2023-02-21T07:21:02.143061  <8>[   25.648614] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-21T07:21:02.143290  /lava-281590/1/../bin/lava-test-case
    2023-02-21T07:21:02.143520  <8>[   25.665184] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-21T07:21:02.143741  /lava-281590/1/../bin/lava-test-case
    2023-02-21T07:21:02.143950  <8>[   25.683820] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-21T07:21:02.144144  /lava-281590/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f470eeb6dc5717f48c8676
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:21:03.218027  /lava-281590/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f470eeb6dc5717f48c8677
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:21:03.221213  <8>[   26.759450] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-21T07:21:04.278611  /lava-281590/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63f4717a4d3eba72448c8742

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4717a4d3eba72448c8749
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:23:07.379630  / # #
    2023-02-21T07:23:07.481224  export SHELL=3D/bin/sh
    2023-02-21T07:23:07.481697  #
    2023-02-21T07:23:07.582931  / # export SHELL=3D/bin/sh. /lava-281603/en=
vironment
    2023-02-21T07:23:07.583457  =

    2023-02-21T07:23:07.684772  / # . /lava-281603/environment/lava-281603/=
bin/lava-test-runner /lava-281603/1
    2023-02-21T07:23:07.685558  =

    2023-02-21T07:23:07.692505  / # /lava-281603/bin/lava-test-runner /lava=
-281603/1
    2023-02-21T07:23:07.760806  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:23:07.761196  + <8>[   22.520973] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 281603_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f4717a4d3eba72448c874d
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:23:09.853913  /lava-281603/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f4717a4d3eba72448c874f
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:23:10.912139  /lava-281603/1/../bin/lava-test-case
    2023-02-21T07:23:10.912503  <8>[   25.663715] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-21T07:23:10.912752  /lava-281603/1/../bin/lava-test-case
    2023-02-21T07:23:10.912985  <8>[   25.680530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-21T07:23:10.913216  /lava-281603/1/../bin/lava-test-case
    2023-02-21T07:23:10.913440  <8>[   25.699500] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-21T07:23:10.913687  /lava-281603/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f4717a4d3eba72448c8754
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:23:11.987015  /lava-281603/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f4717a4d3eba72448c8755
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:23:11.990221  <8>[   26.776254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-21T07:23:13.047404  /lava-281603/1/../bin/lava-test-case
    2023-02-21T07:23:13.047777  <8>[   27.797538] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-21T07:23:13.048016  /lava-281603/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/63f4735b878070df4d8c8659

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4735b878070df4d8c8660
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:30:42.930271  + set +x
    2023-02-21T07:30:42.933334  <8>[   45.300986][  T189] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 281620_1.5.2.4.1>
    2023-02-21T07:30:43.052375  #
    2023-02-21T07:30:43.161675  / # #export SHELL=3D/bin/sh
    2023-02-21T07:30:43.162148  =

    2023-02-21T07:30:43.265398  / # export SHELL=3D/bin/sh. /lava-281620/en=
vironment
    2023-02-21T07:30:43.265878  =

    2023-02-21T07:30:43.367112  / # . /lava-281620/environment/lava-281620/=
bin/lava-test-runner /lava-281620/1
    2023-02-21T07:30:43.368002  =

    2023-02-21T07:30:43.381242  / # /lava-281620/bin/lava-test-runner /lava=
-281620/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f4735b878070df4d8c8664
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:30:47.669487  /lava-281620/1/../bin/lava-test-case
    2023-02-21T07:30:47.795563  <8>[   50.161989][  T258] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f4735b878070df4d8c8666
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:30:49.279076  /lava-281620/1/../bin/lava-test-case
    2023-02-21T07:30:49.390886  <8>[   51.757377][  T268] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f4735b878070df4d8c866b
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:30:52.069940  /lava-281620/1/../bin/lava-test-case
    2023-02-21T07:30:52.186816  <8>[   54.554167][  T299] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f4735b878070df4d8c866c
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:30:53.418568  /lava-281620/1/../bin/lava-test-case
    2023-02-21T07:30:53.555295  <8>[   55.921955][  T305] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63f4744bdbc46b4f6d8c863c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4744bdbc46b4f6d8c8643
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:35:24.458015  / # #
    2023-02-21T07:35:24.560054  export SHELL=3D/bin/sh
    2023-02-21T07:35:24.560620  #
    2023-02-21T07:35:24.662058  / # export SHELL=3D/bin/sh. /lava-281632/en=
vironment
    2023-02-21T07:35:24.662704  =

    2023-02-21T07:35:24.764042  / # . /lava-281632/environment/lava-281632/=
bin/lava-test-runner /lava-281632/1
    2023-02-21T07:35:24.764870  =

    2023-02-21T07:35:24.770174  / # /lava-281632/bin/lava-test-runner /lava=
-281632/1
    2023-02-21T07:35:24.891201  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:35:24.891605  + <8>[   22.482358] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 281632_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f4744bdbc46b4f6d8c8647
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:35:26.982333  /lava-281632/1/../bin/lava-test-case
    2023-02-21T07:35:26.982745  <8>[   24.585670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-21T07:35:26.982994  /lava-281632/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f4744bdbc46b4f6d8c8649
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:35:28.038349  /lava-281632/1/../bin/lava-test-case
    2023-02-21T07:35:28.038762  <8>[   25.623618] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-21T07:35:28.039009  /lava-281632/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f4744bdbc46b4f6d8c864e
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:35:29.112420  /lava-281632/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f4744bdbc46b4f6d8c864f
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:35:29.115565  <8>[   26.732247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-21T07:35:30.174037  /lava-281632/1/../bin/lava-test-case
    2023-02-21T07:35:30.174431  <8>[   27.752780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-21T07:35:30.174678  /lava-281632/1/../bin/lava-test-case
    2023-02-21T07:35:30.174974  <8>[   27.770105] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-21T07:35:30.175257  /lava-281632/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63f47617acf175e7c38c8635

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47617acf175e7c38c863c
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:43:01.386263  / # #
    2023-02-21T07:43:01.488583  export SHELL=3D/bin/sh
    2023-02-21T07:43:01.489340  #
    2023-02-21T07:43:01.590839  / # export SHELL=3D/bin/sh. /lava-281635/en=
vironment
    2023-02-21T07:43:01.591312  =

    2023-02-21T07:43:01.692779  / # . /lava-281635/environment/lava-281635/=
bin/lava-test-runner /lava-281635/1
    2023-02-21T07:43:01.693781  =

    2023-02-21T07:43:01.698140  / # /lava-281635/bin/lava-test-runner /lava=
-281635/1
    2023-02-21T07:43:01.769185  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:43:01.769512  + <8>[   44.605523] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 281635_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f47617acf175e7c38c8640
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:43:03.863298  /lava-281635/1/../bin/lava-test-case
    2023-02-21T07:43:03.863629  <8>[   46.712117] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-21T07:43:03.863814  /lava-281635/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f47617acf175e7c38c8642
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:43:04.922441  /lava-281635/1/../bin/lava-test-case
    2023-02-21T07:43:04.922731  <8>[   47.748841] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-21T07:43:04.922883  /lava-281635/1/../bin/lava-test-case
    2023-02-21T07:43:04.923026  <8>[   47.765199] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-21T07:43:04.923169  /lava-281635/1/../bin/lava-test-case
    2023-02-21T07:43:04.923307  <8>[   47.785512] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-21T07:43:04.923443  /lava-281635/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f47617acf175e7c38c8647
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:43:05.996373  /lava-281635/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f47617acf175e7c38c8648
        failing since 13 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-21T07:43:05.999461  <8>[   48.860962] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-21T07:43:07.053065  /lava-281635/1/../bin/lava-test-case
    2023-02-21T07:43:07.053355  <8>[   49.882084] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-21T07:43:07.053503  /lava-281635/1/../bin/lava-test-case
    2023-02-21T07:43:07.053656  <8>[   49.899594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-21T07:43:07.053800  /lava-281635/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63f46dce954e6a35df8c8682

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63f46dce954e6a35df8c8693
        failing since 32 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-21T07:07:39.952825  /lava-281571/1/../bin/lava-test-case
    2023-02-21T07:07:39.955903  <8>[   17.818008] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63f=
46dce954e6a35df8c8695
        failing since 32 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-21T07:07:41.965159  /lava-281571/1/../bin/lava-test-case
    2023-02-21T07:07:41.965552  <8>[   19.891667] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-21T07:07:41.965815  /lava-281571/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63f471052e84560b6e8c865f

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63f471052e84560b6e8c8670
        failing since 32 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-21T07:21:26.561328  /lava-281600/1/../bin/lava-test-case
    2023-02-21T07:21:26.564442  <8>[   17.914254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63f=
471052e84560b6e8c8672
        failing since 32 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-21T07:21:28.573584  /lava-281600/1/../bin/lava-test-case
    2023-02-21T07:21:28.573886  <8>[   19.988004] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-21T07:21:28.574035  /lava-281600/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46d782a6b24317f8c868f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46d782a6b24317f8c8698
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:06:22.189003  <8>[   17.981736] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362529_1.5.2.4.1>
    2023-02-21T07:06:22.293048  / # #
    2023-02-21T07:06:22.394739  export SHELL=3D/bin/sh
    2023-02-21T07:06:22.395142  #
    2023-02-21T07:06:22.496493  / # export SHELL=3D/bin/sh. /lava-3362529/e=
nvironment
    2023-02-21T07:06:22.497130  =

    2023-02-21T07:06:22.497366  / # <3>[   18.219654] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:06:22.598652  . /lava-3362529/environment/lava-3362529/bi=
n/lava-test-runner /lava-3362529/1
    2023-02-21T07:06:22.599297  =

    2023-02-21T07:06:22.615568  / # /lava-3362529/bin/lava-test-runner /lav=
a-3362529/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e69cf6c3223a58c8831

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46e69cf6c3223a58c883a
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:10:14.194875  / # #
    2023-02-21T07:10:14.297427  export SHELL=3D/bin/sh
    2023-02-21T07:10:14.298227  #
    2023-02-21T07:10:14.399611  / # export SHELL=3D/bin/sh. /lava-3362562/e=
nvironment
    2023-02-21T07:10:14.400062  =

    2023-02-21T07:10:14.400299  / # <3>[   18.338894] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:10:14.501654  . /lava-3362562/environment/lava-3362562/bi=
n/lava-test-runner /lava-3362562/1
    2023-02-21T07:10:14.502333  =

    2023-02-21T07:10:14.514549  / # /lava-3362562/bin/lava-test-runner /lav=
a-3362562/1
    2023-02-21T07:10:14.578476  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4702104291a790f8c86be

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4702104291a790f8c86c7
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:17:32.451377  / # #
    2023-02-21T07:17:32.553560  export SHELL=3D/bin/sh
    2023-02-21T07:17:32.553964  #
    2023-02-21T07:17:32.655309  / # export SHELL=3D/bin/sh. /lava-3362648/e=
nvironment
    2023-02-21T07:17:32.655731  =

    2023-02-21T07:17:32.656058  / # <3>[   18.283732] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:17:32.757910  . /lava-3362648/environment/lava-3362648/bi=
n/lava-test-runner /lava-3362648/1
    2023-02-21T07:17:32.758583  =

    2023-02-21T07:17:32.775488  / # /lava-3362648/bin/lava-test-runner /lav=
a-3362648/1
    2023-02-21T07:17:32.836420  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4708466b3f89ed58c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4708466b3f89ed58c864e
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:19:26.100235  <8>[   18.117234] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362712_1.5.2.4.1>
    2023-02-21T07:19:26.204479  / # #
    2023-02-21T07:19:26.306560  export SHELL=3D/bin/sh
    2023-02-21T07:19:26.306951  #
    2023-02-21T07:19:26.408339  / # export SHELL=3D/bin/sh. /lava-3362712/e=
nvironment
    2023-02-21T07:19:26.408915  =

    2023-02-21T07:19:26.409259  / # <3>[   18.359098] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:19:26.510681  . /lava-3362712/environment/lava-3362712/bi=
n/lava-test-runner /lava-3362712/1
    2023-02-21T07:19:26.511790  =

    2023-02-21T07:19:26.528854  / # /lava-3362712/bin/lava-test-runner /lav=
a-3362712/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47430bd7333256e8c8634

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47430bd7333256e8c863d
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:34:49.744627  / # #
    2023-02-21T07:34:49.846756  export SHELL=3D/bin/sh
    2023-02-21T07:34:49.847354  #
    2023-02-21T07:34:49.847625  / # <3>[   18.399123] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:34:49.948939  export SHELL=3D/bin/sh. /lava-3362860/envir=
onment
    2023-02-21T07:34:49.949541  =

    2023-02-21T07:34:50.051132  / # . /lava-3362860/environment/lava-336286=
0/bin/lava-test-runner /lava-3362860/1
    2023-02-21T07:34:50.051913  =

    2023-02-21T07:34:50.057722  / # /lava-3362860/bin/lava-test-runner /lav=
a-3362860/1
    2023-02-21T07:34:50.199656  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f475c1139e2f1ec88c8697

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f475c1139e2f1ec88c86a0
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:41:33.304348  <8>[  101.292916] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362888_1.5.2.4.1>
    2023-02-21T07:41:33.408625  / # #
    2023-02-21T07:41:33.510771  export SHELL=3D/bin/sh
    2023-02-21T07:41:33.511568  #
    2023-02-21T07:41:33.613534  / # export SHELL=3D/bin/sh<3>[  101.522975]=
 brcmfmac:. /lava-3362888/environment
    2023-02-21T07:41:33.613932   brcmf_sdio_htclk: HT Avail timeout (100000=
0): clkctl 0x50
    2023-02-21T07:41:33.614170  =

    2023-02-21T07:41:33.715537  / # . /lava-3362888/environment/lava-336288=
8/bin/lava-test-runner /lava-3362888/1
    2023-02-21T07:41:33.716866  =

    2023-02-21T07:41:33.725200  / # /lava-3362888/bin/lava-test-runner /lav=
a-3362888/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46d9fc2192407808c8660

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46d9fc2192407808c8667
        failing since 34 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-21T07:06:55.816078  =

    2023-02-21T07:06:55.917611  / # #export SHELL=3D/bin/sh
    2023-02-21T07:06:55.917964  =

    2023-02-21T07:06:56.019279  / # export SHELL=3D/bin/sh. /lava-3362531/e=
nvironment
    2023-02-21T07:06:56.019634  =

    2023-02-21T07:06:56.120973  / # . /lava-3362531/environment/lava-336253=
1/bin/lava-test-runner /lava-3362531/1
    2023-02-21T07:06:56.121593  =

    2023-02-21T07:06:56.126235  / # /lava-3362531/bin/lava-test-runner /lav=
a-3362531/1
    2023-02-21T07:06:56.204272  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:06:56.204909  + cd /lava-3362531/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e78e6ece9ee258c8640

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46e78e6ece9ee258c8649
        failing since 34 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-21T07:10:36.092233  / # #
    2023-02-21T07:10:36.193971  export SHELL=3D/bin/sh
    2023-02-21T07:10:36.194396  <3>[   18.043559] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:10:36.194635  #
    2023-02-21T07:10:36.295972  / # export SHELL=3D/bin/sh. /lava-3362563/e=
nvironment
    2023-02-21T07:10:36.296340  =

    2023-02-21T07:10:36.397718  / # . /lava-3362563/environment/lava-336256=
3/bin/lava-test-runner /lava-3362563/1
    2023-02-21T07:10:36.398367  =

    2023-02-21T07:10:36.410556  / # /lava-3362563/bin/lava-test-runner /lav=
a-3362563/1
    2023-02-21T07:10:36.442554  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4704d537b8118d38c866c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4704d537b8118d38c8675
        failing since 34 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-21T07:18:12.299283  / # #
    2023-02-21T07:18:12.400958  export SHELL=3D/bin/sh
    2023-02-21T07:18:12.401309  #
    2023-02-21T07:18:12.502629  / # export SHELL=3D/bin/sh. /lava-3362656/e=
nvironment
    2023-02-21T07:18:12.502983  =

    2023-02-21T07:18:12.604284  / # . /lava-3362656/environment/lava-336265=
6/bin/lava-test-runner /lava-3362656/1
    2023-02-21T07:18:12.604902  =

    2023-02-21T07:18:12.610689  / # /lava-3362656/bin/lava-test-runner /lav=
a-3362656/1
    2023-02-21T07:18:12.683551  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:18:12.684026  + cd /lava-3362656/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470d283ca4652cf8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f470d283ca4652cf8c8639
        failing since 34 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-21T07:20:14.407250  + set +x<8>[   18.394322] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3362698_1.5.2.4.1>
    2023-02-21T07:20:14.512572  / # #
    2023-02-21T07:20:14.614390  export SHELL=3D/bin/sh
    2023-02-21T07:20:14.614751  #
    2023-02-21T07:20:14.716093  / # export SHELL=3D/bin/sh. /lava-3362698/e=
nvironment
    2023-02-21T07:20:14.716451  =

    2023-02-21T07:20:14.817828  / # . /lava-3362698/environment/lava-336269=
8/bin/lava-test-runner /lava-3362698/1
    2023-02-21T07:20:14.818558  =

    2023-02-21T07:20:14.824086  / # /lava-3362698/bin/lava-test-runner /lav=
a-3362698/1
    2023-02-21T07:20:14.897019  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47458dbc46b4f6d8c8723

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47458dbc46b4f6d8c872c
        failing since 34 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-21T07:35:19.906425  / # #
    2023-02-21T07:35:20.008264  export SHELL=3D/bin/sh
    2023-02-21T07:35:20.008829  #
    2023-02-21T07:35:20.110222  / # export SHELL=3D/bin/sh. /lava-3362854/e=
nvironment
    2023-02-21T07:35:20.110867  =

    2023-02-21T07:35:20.212236  / # . /lava-3362854/environment/lava-336285=
4/bin/lava-test-runner /lava-3362854/1
    2023-02-21T07:35:20.213019  =

    2023-02-21T07:35:20.217468  / # /lava-3362854/bin/lava-test-runner /lav=
a-3362854/1
    2023-02-21T07:35:20.376426  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:35:20.377296  + cd /lava-3362854/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47591628e11b1228c8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47591628e11b1228c8641
        failing since 34 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-21T07:40:53.298913  <8>[   33.519260] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362892_1.5.2.4.1>
    2023-02-21T07:40:53.406415  / # #
    2023-02-21T07:40:53.508524  export SHELL=3D/bin/sh
    2023-02-21T07:40:53.508907  #<3>[   33.614053] brcmfmac: brcmf_sdio_htc=
lk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:40:53.509144  =

    2023-02-21T07:40:53.610438  / # export SHELL=3D/bin/sh. /lava-3362892/e=
nvironment
    2023-02-21T07:40:53.610803  =

    2023-02-21T07:40:53.712137  / # . /lava-3362892/environment/lava-336289=
2/bin/lava-test-runner /lava-3362892/1
    2023-02-21T07:40:53.712849  =

    2023-02-21T07:40:53.722948  / # /lava-3362892/bin/lava-test-runner /lav=
a-3362892/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46d9b9546420c998c8665

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46d9b9546420c998c866e
        new failure (last pass: next-20221129)

    2023-02-21T07:06:39.631267  <8>[   18.301577] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362506_1.5.2.4.1>
    2023-02-21T07:06:39.737713  / # #
    2023-02-21T07:06:39.839669  export SHELL=3D/bin/sh
    2023-02-21T07:06:39.840245  #
    2023-02-21T07:06:39.941799  / # export SHELL=3D/bin/sh. /lava-3362506/e=
nvironment
    2023-02-21T07:06:39.942150  =

    2023-02-21T07:06:40.043499  / # . /lava-3362506/environment/lava-336250=
6/bin/lava-test-runner /lava-3362506/1
    2023-02-21T07:06:40.044109  =

    2023-02-21T07:06:40.063542  / # /lava-3362506/bin/lava-test-runner /lav=
a-3362506/1
    2023-02-21T07:06:40.135371  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e8be6ece9ee258c8656

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46e8be6ece9ee258c865f
        failing since 3 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-21T07:10:48.138628  <8>[   18.309688] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362545_1.5.2.4.1>
    2023-02-21T07:10:48.243978  / # #
    2023-02-21T07:10:48.345764  export SHELL=3D/bin/sh
    2023-02-21T07:10:48.346207  #
    2023-02-21T07:10:48.447517  / # export SHELL=3D/bin/sh. /lava-3362545/e=
nvironment
    2023-02-21T07:10:48.447875  =

    2023-02-21T07:10:48.549236  / # . /lava-3362545/environment/lava-336254=
5/bin/lava-test-runner /lava-3362545/1
    2023-02-21T07:10:48.549863  =

    2023-02-21T07:10:48.555356  / # /lava-3362545/bin/lava-test-runner /lav=
a-3362545/1
    2023-02-21T07:10:48.603450  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4705cf97c331a218c866b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4705cf97c331a218c8674
        failing since 3 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-21T07:18:27.800639  / # #
    2023-02-21T07:18:27.902367  export SHELL=3D/bin/sh
    2023-02-21T07:18:27.902710  #
    2023-02-21T07:18:28.004006  / # export SHELL=3D/bin/sh. /lava-3362663/e=
nvironment
    2023-02-21T07:18:28.004351  =

    2023-02-21T07:18:28.105717  / # . /lava-3362663/environment/lava-336266=
3/bin/lava-test-runner /lava-3362663/1
    2023-02-21T07:18:28.106309  =

    2023-02-21T07:18:28.112086  / # /lava-3362663/bin/lava-test-runner /lav=
a-3362663/1
    2023-02-21T07:18:28.199950  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:18:28.200424  + cd /lava-3362663/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470e01ecaa764228c8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech=
-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech=
-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f470e01ecaa764228c865e
        failing since 3 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-21T07:20:42.321994  <8>[   18.233649] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362713_1.5.2.4.1>
    2023-02-21T07:20:42.427413  / # #
    2023-02-21T07:20:42.529929  export SHELL=3D/bin/sh
    2023-02-21T07:20:42.530707  #
    2023-02-21T07:20:42.632373  / # export SHELL=3D/bin/sh. /lava-3362713/e=
nvironment
    2023-02-21T07:20:42.632877  =

    2023-02-21T07:20:42.734232  / # . /lava-3362713/environment/lava-336271=
3/bin/lava-test-runner /lava-3362713/1
    2023-02-21T07:20:42.734856  =

    2023-02-21T07:20:42.754291  / # /lava-3362713/bin/lava-test-runner /lav=
a-3362713/1
    2023-02-21T07:20:42.828256  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47460dbc46b4f6d8c8789

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47460dbc46b4f6d8c8792
        failing since 3 days (last pass: next-20221129, first fail: next-20=
230217)

    2023-02-21T07:35:27.996481  / # #
    2023-02-21T07:35:28.098331  export SHELL=3D/bin/sh
    2023-02-21T07:35:28.098816  #
    2023-02-21T07:35:28.200220  / # export SHELL=3D/bin/sh. /lava-3362874/e=
nvironment
    2023-02-21T07:35:28.200750  =

    2023-02-21T07:35:28.302145  / # . /lava-3362874/environment/lava-336287=
4/bin/lava-test-runner /lava-3362874/1
    2023-02-21T07:35:28.302994  =

    2023-02-21T07:35:28.307791  / # /lava-3362874/bin/lava-test-runner /lav=
a-3362874/1
    2023-02-21T07:35:28.495760  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:35:28.496390  + cd /lava-3362874/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f475f7d8c8fa6a748c865a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f475f7d8c8fa6a748c8663
        new failure (last pass: next-20221130)

    2023-02-21T07:42:22.212556  / # #
    2023-02-21T07:42:22.314462  export SHELL=3D/bin/sh
    2023-02-21T07:42:22.315039  #
    2023-02-21T07:42:22.416493  / # export SHELL=3D/bin/sh. /lava-3362895/e=
nvironment
    2023-02-21T07:42:22.416995  =

    2023-02-21T07:42:22.518409  / # . /lava-3362895/environment/lava-336289=
5/bin/lava-test-runner /lava-3362895/1
    2023-02-21T07:42:22.519221  =

    2023-02-21T07:42:22.538612  / # /lava-3362895/bin/lava-test-runner /lav=
a-3362895/1
    2023-02-21T07:42:22.610411  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:42:22.610805  + cd /lava-3362895/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47683e4cab0cf178c867d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47683e4cab0cf178c8686
        failing since 3 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-21T07:44:45.670252  / # #
    2023-02-21T07:44:45.772152  export SHELL=3D/bin/sh
    2023-02-21T07:44:45.772690  #
    2023-02-21T07:44:45.874212  / # export SHELL=3D/bin/sh. /lava-3362931/e=
nvironment
    2023-02-21T07:44:45.874763  =

    2023-02-21T07:44:45.976147  / # . /lava-3362931/environment/lava-336293=
1/bin/lava-test-runner /lava-3362931/1
    2023-02-21T07:44:45.977029  =

    2023-02-21T07:44:45.994932  / # /lava-3362931/bin/lava-test-runner /lav=
a-3362931/1
    2023-02-21T07:44:46.066775  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:44:46.067536  + cd /lava-3362931/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46d77173b5a89348c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46d77173b5a89348c8653
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:06:17.417269  <8>[   17.881649] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362507_1.5.2.4.1>
    2023-02-21T07:06:17.521222  / # #
    2023-02-21T07:06:17.622907  export SHELL=3D/bin/sh
    2023-02-21T07:06:17.623345  #
    2023-02-21T07:06:17.724653  / # export SHELL=3D/bin/sh. /lava-3362507/e=
nvironment
    2023-02-21T07:06:17.725082  =

    2023-02-21T07:06:17.725310  / # <3>[   18.117190] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:06:17.826585  . /lava-3362507/environment/lava-3362507/bi=
n/lava-test-runner /lava-3362507/1
    2023-02-21T07:06:17.827157  =

    2023-02-21T07:06:17.839996  / # /lava-3362507/bin/lava-test-runner /lav=
a-3362507/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e67c5aa47df238c884c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f46e67c5aa47df238c8855
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:10:15.370635  <8>[   17.957893] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362556_1.5.2.4.1>
    2023-02-21T07:10:15.473477  / # #
    2023-02-21T07:10:15.575367  export SHELL=3D/bin/sh
    2023-02-21T07:10:15.576208  #
    2023-02-21T07:10:15.678000  / # export SHELL=3D/bin/sh. /lava-3362556/e=
nvironment
    2023-02-21T07:10:15.678386  =

    2023-02-21T07:10:15.678531  / # <3>[   18.205193] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:10:15.779654  . /lava-3362556/environment/lava-3362556/bi=
n/lava-test-runner /lava-3362556/1
    2023-02-21T07:10:15.780219  =

    2023-02-21T07:10:15.786366  / # /lava-3362556/bin/lava-test-runner /lav=
a-3362556/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4701f13cd44835a8c8726

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4701f13cd44835a8c872f
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:17:30.455403  / # #
    2023-02-21T07:17:30.557491  export SHELL=3D/bin/sh
    2023-02-21T07:17:30.557921  #
    2023-02-21T07:17:30.659262  / # export SHELL=3D/bin/sh. /lava-3362647/e=
nvironment
    2023-02-21T07:17:30.659700  =

    2023-02-21T07:17:30.659935  / # <3>[   18.124244] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:17:30.761247  . /lava-3362647/environment/lava-3362647/bi=
n/lava-test-runner /lava-3362647/1
    2023-02-21T07:17:30.761931  =

    2023-02-21T07:17:30.768393  / # /lava-3362647/bin/lava-test-runner /lav=
a-3362647/1
    2023-02-21T07:17:30.811245  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470972f6c1094118c8699

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f470972f6c1094118c86a2
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:19:29.056877  <8>[   17.945952] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3362708_1.5.2.4.1>
    2023-02-21T07:19:29.160794  / # #
    2023-02-21T07:19:29.262494  export SHELL=3D/bin/sh
    2023-02-21T07:19:29.262948  #
    2023-02-21T07:19:29.364348  / # export SHELL=3D/bin/sh. /lava-3362708/e=
nvironment
    2023-02-21T07:19:29.364835  =

    2023-02-21T07:19:29.365095  / # <3>[   18.187028] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:19:29.466411  . /lava-3362708/environment/lava-3362708/bi=
n/lava-test-runner /lava-3362708/1
    2023-02-21T07:19:29.467120  =

    2023-02-21T07:19:29.484487  / # /lava-3362708/bin/lava-test-runner /lav=
a-3362708/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47431aad8ff7c368c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47431aad8ff7c368c8638
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:34:50.907577  / # #
    2023-02-21T07:34:51.009425  export SHELL=3D/bin/sh
    2023-02-21T07:34:51.009884  #
    2023-02-21T07:34:51.010118  / # export SHELL=3D/bin/sh<3>[   18.140836]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:34:51.111425  . /lava-3362866/environment
    2023-02-21T07:34:51.111856  =

    2023-02-21T07:34:51.213158  / # . /lava-3362866/environment/lava-336286=
6/bin/lava-test-runner /lava-3362866/1
    2023-02-21T07:34:51.213806  =

    2023-02-21T07:34:51.232457  / # /lava-3362866/bin/lava-test-runner /lav=
a-3362866/1
    2023-02-21T07:34:51.352295  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f475c00c35aac7de8c86b5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f475c00c35aac7de8c86be
        failing since 34 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-21T07:41:36.483194  + set +x<8>[  101.233418] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3362887_1.5.2.4.1>
    2023-02-21T07:41:36.586626  / # #
    2023-02-21T07:41:36.688330  export SHELL=3D/bin/sh
    2023-02-21T07:41:36.688700  #
    2023-02-21T07:41:36.789953  / # export SHELL=3D/bin/sh. /lava-3362887/e=
nvironment
    2023-02-21T07:41:36.790403  =

    2023-02-21T07:41:36.790628  / # <3>[  101.476330] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-21T07:41:36.892052  . /lava-3362887/environment/lava-3362887/bi=
n/lava-test-runner /lava-3362887/1
    2023-02-21T07:41:36.893159  =

    2023-02-21T07:41:36.896911  / # /lava-3362887/bin/lava-test-runner /lav=
a-3362887/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f472d067e3fe310b8c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f472d067e3fe310b8c8=
651
        failing since 24 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f476fe5049a2af328c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f476fe5049a2af328c8=
63d
        failing since 27 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63f47300a43d53cf308c8635

  Results:     163 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-driver-present: https://kernelci.org/test/c=
ase/id/63f47300a43d53cf308c8652
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214)

    2023-02-21T07:29:40.667476  /lava-9259863/1/../bin/lava-test-case

    2023-02-21T07:29:40.677236  <8>[   30.294928] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f47300a43d53cf308c86e1
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214)

    2023-02-21T07:29:28.129752  + set +x

    2023-02-21T07:29:28.132805  <8>[   17.755254] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9259863_1.5.2.3.1>

    2023-02-21T07:29:28.245044  / # #

    2023-02-21T07:29:28.347710  export SHELL=3D/bin/sh

    2023-02-21T07:29:28.348445  #

    2023-02-21T07:29:28.450168  / # export SHELL=3D/bin/sh. /lava-9259863/e=
nvironment

    2023-02-21T07:29:28.450941  =


    2023-02-21T07:29:28.552669  / # . /lava-9259863/environment/lava-925986=
3/bin/lava-test-runner /lava-9259863/1

    2023-02-21T07:29:28.552942  =


    2023-02-21T07:29:28.557827  / # /lava-9259863/bin/lava-test-runner /lav=
a-9259863/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63f4704f537b8118d38c8677

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63f4704f537b8118d38c872d
        failing since 19 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-21T07:18:11.694444  /lava-9259449/1/../bin/lava-test-case

    2023-02-21T07:18:11.700766  <8>[   22.684780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63f4704f537b8118d38c872e
        failing since 19 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-21T07:18:10.674757  /lava-9259449/1/../bin/lava-test-case

    2023-02-21T07:18:10.681052  <8>[   21.665037] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63f4704f537b8118d38c872f
        failing since 19 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-21T07:18:08.645263    V:            0

    2023-02-21T07:18:08.645355    Res:          0x0

    2023-02-21T07:18:08.648526  TPM2_CC_TestParms:

    2023-02-21T07:18:08.648619    value: 0x18A

    2023-02-21T07:18:08.651634    commandIndex: 0x18a

    2023-02-21T07:18:08.651713    reserved1:    0x0

    2023-02-21T07:18:08.655043    nv:           0

    2023-02-21T07:18:08.655132    extensive:    0

    2023-02-21T07:18:08.658121    flushed:      0

    2023-02-21T07:18:08.658209    cHandles:     0x0
 =

    ... (51 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e3083abd2ef208c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e3083abd2ef208c8=
63e
        new failure (last pass: next-20230220) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46f1c7cc001cfcc8c88e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46f1c7cc001cfcc8c8=
8e2
        failing since 181 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-baylibre    | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4732476524810cc8c8644

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f4732476524810cc8c864c
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215)

    2023-02-21T07:29:42.038447  /lava-3362822/1/../bin/lava-test-case
    2023-02-21T07:29:42.154862  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47766ef335abac18c8664

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f47766ef335abac18c866c
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215)

    2023-02-21T07:48:36.377049  /lava-49162/1/../bin/lava-test-case
    2023-02-21T07:48:36.435944  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4722c0bab46c72b8c86a4

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f4722c0bab46c72b8c86ac
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215)

    2023-02-21T07:26:32.093516  /lava-9259659/1/../bin/lava-test-case
    2023-02-21T07:26:32.093644  =


    2023-02-21T07:26:32.129610  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>
    2023-02-21T07:26:32.129747  =

   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4734f878070df4d8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4734f878070df4d8c8=
63b
        new failure (last pass: next-20230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47261565cc2a1388c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47261565cc2a1388c8=
670
        new failure (last pass: next-20230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4733c70d7e5d5aa8c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4733c70d7e5d5aa8c8=
65f
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47624acf175e7c38c86c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47624acf175e7c38c8=
6ca
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f472895b0f09ee038c86e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f472895b0f09ee038c8=
6e4
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46fb652c38512df8c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46fb652c38512df8c8=
65b
        failing since 7 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4702decf3422e018c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4702decf3422e018c8=
641
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46fcf17f33d275b8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46fcf17f33d275b8c8=
630
        failing since 7 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470347505abeec48c8668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470347505abeec48c8=
669
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46f5a87aafce22f8c8686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46f5a87aafce22f8c8=
687
        failing since 7 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46ffb6540b6a24f8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46ffb6540b6a24f8c8=
641
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473fa7fef7af23f8c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473fa7fef7af23f8c8=
63c
        failing since 3 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4780587b78907af8c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4780587b78907af8c8=
65f
        failing since 3 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473949c5fdb2c008c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473949c5fdb2c008c8=
659
        failing since 3 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e283c93e5a8fc8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e283c93e5a8fc8c8=
637
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e9ebab6ed5f7b8c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e9ebab6ed5f7b8c8=
63d
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4702e8cadf777538c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4702e8cadf777538c8=
632
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470c980d11f378c8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470c980d11f378c8c8=
63f
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4714a0160a30d6e8c86c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4714a0160a30d6e8c8=
6c6
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4729953efc7ef3c8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4729953efc7ef3c8c8=
631
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4734ee659a8ec478c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4734ee659a8ec478c8=
65e
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473b563a71942a48c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473b563a71942a48c8=
635
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46defb4f52b6fd58c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46defb4f52b6fd58c8=
641
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e8fe6ece9ee258c8661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e8fe6ece9ee258c8=
662
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47047683d285d6a8c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47047683d285d6a8c8=
65e
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f471ed42e9873ec08c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f471ed42e9873ec08c8=
63a
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47341e659a8ec478c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47341e659a8ec478c8=
63b
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f474a8286a8e9d518c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f474a8286a8e9d518c8=
658
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47520853306da1a8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47520853306da1a8c8=
63b
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4771483ca1c3aca8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4771483ca1c3aca8c8=
63e
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46ddef5a78f6bf28c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46ddef5a78f6bf28c8=
635
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e77df57313a918c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e77df57313a918c8=
642
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4700f05afd2624f8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4700f05afd2624f8c8=
63f
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47087e340d8c8398c8668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47087e340d8c8398c8=
669
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470eb4e852aef9e8c8936

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470eb4e852aef9e8c8=
937
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f471dbbd05762c8d8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f471dbbd05762c8d8c8=
63e
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f472101536b38ef18c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f472101536b38ef18c8=
658
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f472d867e3fe310b8c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f472d867e3fe310b8c8=
659
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4706eb02fc482c58c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4706eb02fc482c58c8=
65f
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473e15da90873468c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473e15da90873468c8=
65b
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f477c82a1eff504c8c868f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f477c82a1eff504c8c8=
690
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470089f00eb06658c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470089f00eb06658c8=
632
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47331903beb94fa8c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47331903beb94fa8c8=
654
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473f7af381c38f58c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473f7af381c38f58c8=
651
        failing since 3 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f477f187b78907af8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f477f187b78907af8c8=
633
        failing since 3 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4737f9c5fdb2c008c8650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4737f9c5fdb2c008c8=
651
        failing since 3 days (last pass: next-20230213, first fail: next-20=
230217) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e2a74e5f53a8a8c8673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e2a74e5f53a8a8c8=
674
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46ea0bab6ed5f7b8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46ea0bab6ed5f7b8c8=
640
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47057f97c331a218c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47057f97c331a218c8=
65b
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470c780d11f378c8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470c780d11f378c8c8=
637
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47161b02c1e88918c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47161b02c1e88918c8=
65f
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4729ba2956024aa8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4729ba2956024aa8c8=
631
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f472ae782d1493758c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f472ae782d1493758c8=
636
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473b74a24c0f8ce8c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473b74a24c0f8ce8c8=
645
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e17b4f52b6fd58c8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e17b4f52b6fd58c8=
679
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e90e6ece9ee258c8664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e90e6ece9ee258c8=
665
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470358cadf777538c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470358cadf777538c8=
637
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f471ec933034efa98c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f471ec933034efa98c8=
630
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473401ecac8ad318c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473401ecac8ad318c8=
63d
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f474a956caafbf158c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f474a956caafbf158c8=
64b
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4750c853306da1a8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4750c853306da1a8c8=
636
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4772827e097c0fe8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4772827e097c0fe8c8=
630
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46ddf8868edec7e8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46ddf8868edec7e8c8=
646
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e7edf57313a918c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e7edf57313a918c8=
648
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4701c13cd44835a8c8720

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4701c13cd44835a8c8=
721
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470592c0baa4f778c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470592c0baa4f778c8=
633
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470af7260bb1d528c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470af7260bb1d528c8=
657
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f471f0933034efa98c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f471f0933034efa98c8=
635
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4721860c92db4088c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4721860c92db4088c8=
63d
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4730239a09ef3478c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4730239a09ef3478c8=
631
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47070cc5a3eb7338c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47070cc5a3eb7338c8=
667
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f473a2058aa195278c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f473a2058aa195278c8=
638
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4719bc95045c76f8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4719bc95045c76f8c8=
64a
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f477648b645051148c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f477648b645051148c8=
63e
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f470099f00eb06658c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f470099f00eb06658c8=
635
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4731b143f6c1fb98c86bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4731b143f6c1fb98c8=
6bc
        failing since 6 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46fd417f33d275b8c8667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46fd417f33d275b8c8=
668
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63f474c02066ebec408c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f474c02066ebec408c8=
63f
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46db9853b84429b8c8683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46db9853b84429b8c8=
684
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e80cf6c3223a58c8902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e80cf6c3223a58c8=
903
        failing since 7 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4702413cd44835a8c874c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4702413cd44835a8c8=
74d
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4709cc196aa2bc88c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4709cc196aa2bc88c8=
64b
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47115e53c3ce0858c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47115e53c3ce0858c8=
681
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4754cc1bf17c1158c8719

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4754cc1bf17c1158c8=
71a
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f475c4c1d31788748c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f475c4c1d31788748c8=
630
        failing since 8 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46ea7bab6ed5f7b8c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46ea7bab6ed5f7b8c8=
643
        failing since 90 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46db98a22614f988c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46db98a22614f988c8=
65a
        failing since 90 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63f472181536b38ef18c8673

  Results:     75 PASS, 13 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/63f472181536b38ef18c86ba
        failing since 0 day (last pass: next-20230217, first fail: next-202=
30220)

    2023-02-21T07:26:00.243343  /lava-9259581/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
3f472181536b38ef18c86bb
        failing since 0 day (last pass: next-20230217, first fail: next-202=
30220)

    2023-02-21T07:25:58.725803  <4>[   56.104231] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2

    2023-02-21T07:25:59.215739  /lava-9259581/1/../bin/lava-test-case

    2023-02-21T07:25:59.228648  <8>[   56.608770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f472857267d67ecb8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f472857267d67ecb8c8638
        failing since 47 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-02-21T07:27:45.778724  + set +x
    2023-02-21T07:27:45.807048  <8>[   67.422063][  T196] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 401938_1.5.2.4.1>
    2023-02-21T07:27:45.940101  #
    2023-02-21T07:27:46.045019  / # #export SHELL=3D/bin/sh
    2023-02-21T07:27:46.045682  =

    2023-02-21T07:27:46.147093  / # export SHELL=3D/bin/sh. /lava-401938/en=
vironment
    2023-02-21T07:27:46.147574  =

    2023-02-21T07:27:46.249092  / # . /lava-401938/environment/lava-401938/=
bin/lava-test-runner /lava-401938/1
    2023-02-21T07:27:46.250223  =

    2023-02-21T07:27:46.259164  / # /lava-401938/bin/lava-test-runner /lava=
-401938/1 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4721cabaf59b0d58c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f4721cabaf59b0d58c8=
64e
        failing since 124 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f471a1b74d19e86f8c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f471a1b74d19e86f8c8=
667
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f477f7ffbf8fa4408c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f477f7ffbf8fa4408c8=
63e
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47a3a11621078ab8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47a3a11621078ab8c8=
641
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f47332903beb94fa8c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f47332903beb94fa8c8=
657
        failing since 7 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4705ef97c331a218c8678

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4705ef97c331a218c8681
        failing since 27 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-02-21T07:18:27.050429  / # #
    2023-02-21T07:18:27.152291  export SHELL=3D/bin/sh
    2023-02-21T07:18:27.152830  #
    2023-02-21T07:18:27.254199  / # export SHELL=3D/bin/sh. /lava-3362671/e=
nvironment
    2023-02-21T07:18:27.254585  =

    2023-02-21T07:18:27.355925  / # . /lava-3362671/environment/lava-336267=
1/bin/lava-test-runner /lava-3362671/1
    2023-02-21T07:18:27.356626  =

    2023-02-21T07:18:27.361061  / # /lava-3362671/bin/lava-test-runner /lav=
a-3362671/1
    2023-02-21T07:18:27.512878  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-21T07:18:27.513147  + cd /lava-3362671/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f46e1c74e5f53a8a8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f46e1c74e5f53a8a8c8=
647
        failing since 89 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f4720e7a4f93bf198c865d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230221/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f4720e7a4f93bf198c8664
        failing since 47 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-02-21T07:25:38.950558  + set +x
    2023-02-21T07:25:38.957691  <8>[   43.387476][  T171] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 855523_1.5.2.4.1>
    2023-02-21T07:25:39.091105  #
    2023-02-21T07:25:39.193216  / # #export SHELL=3D/bin/sh
    2023-02-21T07:25:39.193672  =

    2023-02-21T07:25:39.295062  / # export SHELL=3D/bin/sh. /lava-855523/en=
vironment
    2023-02-21T07:25:39.295512  =

    2023-02-21T07:25:39.396894  / # . /lava-855523/environment/lava-855523/=
bin/lava-test-runner /lava-855523/1
    2023-02-21T07:25:39.397438  =

    2023-02-21T07:25:39.401637  / # /lava-855523/bin/lava-test-runner /lava=
-855523/1 =

    ... (18 line(s) more)  =

 =20
