Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6986A0551
	for <lists+linux-next@lfdr.de>; Thu, 23 Feb 2023 10:53:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234162AbjBWJxo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Feb 2023 04:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbjBWJxd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Feb 2023 04:53:33 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6776515F3
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 01:53:22 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id l1so1889002pjt.2
        for <linux-next@vger.kernel.org>; Thu, 23 Feb 2023 01:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OBL4d1shJ+yY9Ea7pery4XvJ2rH5fyQ+9bBYlqwn9NU=;
        b=WRqz5xjiCBLYkv4MNWC2rpC4m5pnvJ8g8NEIRbKPY9q6g9MrP80DpizOyo4T4cVRJU
         kv3ve/Xz+TxdNP0adizoNF/JkoQtOJJlBYgvCAsbAzgpcZQcTo/Pyg5TykdidNhprkTa
         50UqBY4Zzpg1r0xjxYHC7nHahK5rciFV0oHm4pfzxiiYKm9yyRqDAmw4bJojL48lvvdh
         NqBlvxWihJINZkn283ZC707MpaQJouwCAUrEXUBrkmCEiEufASi6h6CsZH3MNRhyTmNx
         FxZ8NiQTPg29hQCpJVYs8Ep4iGXhJC7/15ZU6nsYTpdB6InTD01yu4i0kUoDtQ5VbwtX
         590Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBL4d1shJ+yY9Ea7pery4XvJ2rH5fyQ+9bBYlqwn9NU=;
        b=f7Vz8gSDCk62zqAu/YYQt8eyWnq2D5WaqSnKC+j+oEArPIZKEV1rc0MSA6rFmoy9rE
         B1BEDXSNC+m0bCTK03SCIHSxCIJBoh+eQSDRSCTrKsj77tsiAjgVx2rdgKZsEUn0oisR
         pQ8QmfWdZn/0baQV/iBWAreWMgWKalNkp8k9tz2sbXX3OS1/aID1no1nVE+oTHAD0uuE
         NxeBQxV6nTJQHQ0gN+k/WotyTIadMh/LOYf7y3mFvD7e6NIPoy5ODI+z4OsrfSHJfYLI
         wSLchwSOf82p7iJOgyetLJ11iHKIwTfufTh9UfxNATJTjmEXajFunSnVuMzQaGw81vHI
         Hlrw==
X-Gm-Message-State: AO0yUKV1B9aoQWCe7UXR+D3l5cJEIyEvh/2Hjk2cbUWw391pPMj3PV0e
        okcItj7Jo3CYGXl/5h5AUO6b2z7QOr00FZDk6iU+PQ==
X-Google-Smtp-Source: AK7set/PAC0qcL8lGk+3sn5jwr+f5poDhC6hwCGZgjph3IkqlKIzgwh0VP7Jmj8sP/84zb6BX23ilQ==
X-Received: by 2002:a17:902:ec86:b0:199:2b9f:f369 with SMTP id x6-20020a170902ec8600b001992b9ff369mr12621897plg.32.1677145999987;
        Thu, 23 Feb 2023 01:53:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id iw5-20020a170903044500b0019a733a75a2sm1128077plb.60.2023.02.23.01.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 01:53:19 -0800 (PST)
Message-ID: <63f7378f.170a0220.1ea03.1d37@mx.google.com>
Date:   Thu, 23 Feb 2023 01:53:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230223
X-Kernelci-Report-Type: test
Subject: next/master baseline: 724 runs, 153 regressions (next-20230223)
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

next/master baseline: 724 runs, 153 regressions (next-20230223)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ok+kselftest | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10     | bcm2=
835_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 2          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

qemu_arm-vexpress-a9         | arm    | lab-baylibre    | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

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

qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

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

r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 2          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230223/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230223
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0222aa9800b25ff171d6dcabcabcd5c42c6ffc3f =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7243878ae65b9478c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7243878ae65b9478c8=
63f
        failing since 159 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7268b9b9c3a091c8c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7268b9b9c3a091c8c8=
63a
        failing since 162 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f706da3a94dc94cb8c8731

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63f706da3a94dc9=
4cb8c8734
        new failure (last pass: next-20230221)
        3 lines

    2023-02-23T06:25:04.508754  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-02-23T06:25:04.514985  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-02-23T06:25:04.528444  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector<8>[   15.237801] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>

    2023-02-23T06:25:04.528533  =

   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10     | bcm2=
835_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6fee3ec5d6d60ba8c8634

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f6fee3ec5d6d60ba8c863d
        failing since 1 day (last pass: next-20230220, first fail: next-202=
30221)

    2023-02-23T05:51:08.553547  + set +x
    2023-02-23T05:51:08.557346  <8>[   18.135362] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 60001_1.5.2.4.1>
    2023-02-23T05:51:08.689675  / # #
    2023-02-23T05:51:08.791534  export SHELL=3D/bin/sh
    2023-02-23T05:51:08.792013  #
    2023-02-23T05:51:08.893479  / # export SHELL=3D/bin/sh. /lava-60001/env=
ironment
    2023-02-23T05:51:08.893977  =

    2023-02-23T05:51:08.995462  / # . /lava-60001/environment/lava-60001/bi=
n/lava-test-runner /lava-60001/1
    2023-02-23T05:51:08.995898  =

    2023-02-23T05:51:09.002983  / # /lava-60001/bin/lava-test-runner /lava-=
60001/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f703e8871bea06cb8c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f703e8871bea06cb8c8=
64f
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6ffb4bd5eaeca3a8c864c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f6ffb4bd5eaeca3a8c8655
        failing since 23 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-23T05:54:41.997190  + set +x
    2023-02-23T05:54:41.997350  [   12.048712] <LAVA_SIGNAL_ENDRUN 0_dmesg =
911546_1.5.2.3.1>
    2023-02-23T05:54:42.104014  / # #
    2023-02-23T05:54:42.205336  export SHELL=3D/bin/sh
    2023-02-23T05:54:42.205784  #
    2023-02-23T05:54:42.307209  / # export SHELL=3D/bin/sh. /lava-911546/en=
vironment
    2023-02-23T05:54:42.307606  =

    2023-02-23T05:54:42.408843  / # . /lava-911546/environment/lava-911546/=
bin/lava-test-runner /lava-911546/1
    2023-02-23T05:54:42.409481  =

    2023-02-23T05:54:42.413487  / # /lava-911546/bin/lava-test-runner /lava=
-911546/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7015b07ca6174cd8c8637

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7015b07ca6174cd8c8640
        failing since 23 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-23T06:01:45.094388  + set +x
    2023-02-23T06:01:45.094726  [   13.099638] <LAVA_SIGNAL_ENDRUN 0_dmesg =
911553_1.5.2.3.1>
    2023-02-23T06:01:45.202741  / # #
    2023-02-23T06:01:45.304319  export SHELL=3D/bin/sh
    2023-02-23T06:01:45.304855  #
    2023-02-23T06:01:45.406176  / # export SHELL=3D/bin/sh. /lava-911553/en=
vironment
    2023-02-23T06:01:45.406704  =

    2023-02-23T06:01:45.507921  / # . /lava-911553/environment/lava-911553/=
bin/lava-test-runner /lava-911553/1
    2023-02-23T06:01:45.508664  =

    2023-02-23T06:01:45.512324  / # /lava-911553/bin/lava-test-runner /lava=
-911553/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f702af675cf0b7b78c8657

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f702af675cf0b7b78c8660
        failing since 23 days (last pass: next-20221205, first fail: next-2=
0230130)

    2023-02-23T06:07:23.134913  + set +x
    2023-02-23T06:07:23.135104  [   12.883442] <LAVA_SIGNAL_ENDRUN 0_dmesg =
911560_1.5.2.3.1>
    2023-02-23T06:07:23.244861  / # #
    2023-02-23T06:07:23.346303  export SHELL=3D/bin/sh
    2023-02-23T06:07:23.346657  #
    2023-02-23T06:07:23.447842  / # export SHELL=3D/bin/sh. /lava-911560/en=
vironment
    2023-02-23T06:07:23.448262  =

    2023-02-23T06:07:23.549454  / # . /lava-911560/environment/lava-911560/=
bin/lava-test-runner /lava-911560/1
    2023-02-23T06:07:23.550145  =

    2023-02-23T06:07:23.553269  / # /lava-911560/bin/lava-test-runner /lava=
-911560/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708dac3547dfee68c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708dac3547dfee68c8=
640
        failing since 197 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70080d5e211c3888c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70080d5e211c3888c8=
643
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70f6617ffcafd568c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70f6617ffcafd568c8=
640
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70fb7830a58a6ff8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70fb7830a58a6ff8c8=
630
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d925e8ac0fa08c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d925e8ac0fa08c8=
63d
        failing since 184 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/63f70338457dbebcf48c8664

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63f70338457dbeb=
cf48c8667
        new failure (last pass: next-20230221)
        4 lines =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63f70338457dbeb=
cf48c8668
        new failure (last pass: next-20230221)
        24 lines

    2023-02-23T06:09:22.701679  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[  134.801808] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D24>
    2023-02-23T06:09:22.702681  0001
    2023-02-23T06:09:22.703578  kern  :alert : Mem abort info:
    2023-02-23T06:09:22.704469  kern  :alert :   ESR =3D 0x0000000096000004
    2023-02-23T06:09:22.705557  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-02-23T06:09:22.706483  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-02-23T06:09:22.707374  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63f6ff298c517ddf288c8631

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f6ff298c517ddf288c8638
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T05:52:12.670176  / # #
    2023-02-23T05:52:12.772029  export SHELL=3D/bin/sh
    2023-02-23T05:52:12.772450  #
    2023-02-23T05:52:12.873798  / # export SHELL=3D/bin/sh. /lava-283182/en=
vironment
    2023-02-23T05:52:12.874222  =

    2023-02-23T05:52:12.975714  / # . /lava-283182/environment/lava-283182/=
bin/lava-test-runner /lava-283182/1
    2023-02-23T05:52:12.976486  =

    2023-02-23T05:52:12.983033  / # /lava-283182/bin/lava-test-runner /lava=
-283182/1
    2023-02-23T05:52:13.048856  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T05:52:13.049154  + <8>[   22.345866] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 283182_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f6ff298c517ddf288c863c
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T05:52:15.144119  /lava-283182/1/../bin/lava-test-case
    2023-02-23T05:52:15.144503  <8>[   24.452176] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-23T05:52:15.144744  /lava-283182/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f6ff298c517ddf288c863e
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T05:52:16.199735  /lava-283182/1/../bin/lava-test-case
    2023-02-23T05:52:16.200106  <8>[   25.489878] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-23T05:52:16.200361  /lava-283182/1/../bin/lava-test-case
    2023-02-23T05:52:16.200591  <8>[   25.506745] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f6ff298c517ddf288c8643
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T05:52:17.274268  /lava-283182/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f6ff298c517ddf288c8644
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T05:52:17.277462  <8>[   26.600111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-23T05:52:18.336071  /lava-283182/1/../bin/lava-test-case
    2023-02-23T05:52:18.336485  <8>[   27.621189] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-23T05:52:18.336721  /lava-283182/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63f701aead6aff68268c8677

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f701aead6aff68268c867e
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:03:05.185036  / # #
    2023-02-23T06:03:05.287007  export SHELL=3D/bin/sh
    2023-02-23T06:03:05.287594  #
    2023-02-23T06:03:05.389004  / # export SHELL=3D/bin/sh. /lava-283197/en=
vironment
    2023-02-23T06:03:05.389480  =

    2023-02-23T06:03:05.492978  / # . /lava-283197/environment/lava-283197/=
bin/lava-test-runner /lava-283197/1
    2023-02-23T06:03:05.494011  =

    2023-02-23T06:03:05.511076  / # /lava-283197/bin/lava-test-runner /lava=
-283197/1
    2023-02-23T06:03:05.565735  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T06:03:05.566367  + <8>[   44.226514] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 283197_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f701aead6aff68268c8682
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:03:07.657022  /lava-283197/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f701aead6aff68268c8684
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:03:08.715536  /lava-283197/1/../bin/lava-test-case
    2023-02-23T06:03:08.715949  <8>[   47.366848] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f701aead6aff68268c8689
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:03:09.789272  /lava-283197/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f701aead6aff68268c868a
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:03:09.792519  <8>[   48.477774] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-23T06:03:10.848841  /lava-283197/1/../bin/lava-test-case
    2023-02-23T06:03:10.849214  <8>[   49.498618] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-23T06:03:10.849460  /lava-283197/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63f7074a69119d41758c8630

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7074a69119d41758c8637
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:27:09.534262  / # #
    2023-02-23T06:27:09.636122  export SHELL=3D/bin/sh
    2023-02-23T06:27:09.636761  #
    2023-02-23T06:27:09.738651  / # export SHELL=3D/bin/sh. /lava-283232/en=
vironment
    2023-02-23T06:27:09.739291  =

    2023-02-23T06:27:09.840998  / # . /lava-283232/environment/lava-283232/=
bin/lava-test-runner /lava-283232/1
    2023-02-23T06:27:09.841848  =

    2023-02-23T06:27:09.846903  / # /lava-283232/bin/lava-test-runner /lava=
-283232/1
    2023-02-23T06:27:09.913990  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T06:27:09.914282  + <8>[   22.446634] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 283232_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63f7074a69119d41758c863b
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:27:12.008153  /lava-283232/1/../bin/lava-test-case
    2023-02-23T06:27:12.008452  <8>[   24.552458] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-23T06:27:12.008602  /lava-283232/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
f7074a69119d41758c863d
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:27:13.066606  /lava-283232/1/../bin/lava-test-case
    2023-02-23T06:27:13.066902  <8>[   25.589861] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-23T06:27:13.067052  /lava-283232/1/../bin/lava-test-case
    2023-02-23T06:27:13.067190  <8>[   25.606799] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-23T06:27:13.067329  /lava-283232/1/../bin/lava-test-case
    2023-02-23T06:27:13.067463  <8>[   25.626340] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-23T06:27:13.067597  /lava-283232/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63f7074a69119d41758c8642
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:27:14.142272  /lava-283232/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63f7074a69119d41758c8643
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230207)

    2023-02-23T06:27:14.145355  <8>[   26.704087] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-23T06:27:15.201144  /lava-283232/1/../bin/lava-test-case
    2023-02-23T06:27:15.201434  <8>[   27.725154] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-23T06:27:15.201585  /lava-283232/1/../bin/lava-test-case
    2023-02-23T06:27:15.201738  <8>[   27.741454] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-23T06:27:15.201879  /lava-283232/1/../bin/lava-test-case
    2023-02-23T06:27:15.202013  <8>[   27.760243] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-02-23T06:27:15.202150  /lava-283232/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-17   | defc=
onfig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63f705bae8748b18028c8635

  Results:     48 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230221072235+18ba=
eb89b566-1~exp1~20230221072348.571))
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-17/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f705bae8748b18028c863c
        new failure (last pass: next-20230222)

    2023-02-23T06:20:25.109573  / # #
    2023-02-23T06:20:25.211442  export SHELL=3D/bin/sh
    2023-02-23T06:20:25.212069  #
    2023-02-23T06:20:25.313325  / # export SHELL=3D/bin/sh. /lava-283211/en=
vironment
    2023-02-23T06:20:25.313930  =

    2023-02-23T06:20:25.415204  / # . /lava-283211/environment/lava-283211/=
bin/lava-test-runner /lava-283211/1
    2023-02-23T06:20:25.416026  =

    2023-02-23T06:20:25.421971  / # /lava-283211/bin/lava-test-runner /lava=
-283211/1
    2023-02-23T06:20:25.492989  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T06:20:25.493267  + cd /lava-283211/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63f=
705bae8748b18028c864b
        new failure (last pass: next-20230222)

    2023-02-23T06:20:30.840032  /lava-283211/1/../bin/lava-test-case
    2023-02-23T06:20:30.840337  <8>[   20.318783] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-02-23T06:20:30.840487  /lava-283211/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63f6ff150ee44bbfa38c866a

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63f6ff150ee44bbfa38c867b
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-23T05:52:07.435434  /lava-283177/1/../bin/lava-test-case
    2023-02-23T05:52:07.438581  <8>[   17.506226] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63f=
6ff150ee44bbfa38c867d
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-23T05:52:09.447687  /lava-283177/1/../bin/lava-test-case
    2023-02-23T05:52:09.448060  <8>[   19.579943] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-23T05:52:09.448303  /lava-283177/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/63f70222d8feec5f388c865a

  Results:     46 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f70222d8feec5f388c8661
        new failure (last pass: next-20230221)

    2023-02-23T06:04:54.698506  kern  :emerg : Internal error: Oops: 000000=
0096000006 [#1] PREEMPT SMP
    2023-02-23T06:04:54.701657  kern  :emerg : Code: d2800018 a9046bf9 1280=
0039 d503201f (b9402260) =

    2023-02-23T06:04:54.701881  + set +x
    2023-02-23T06:04:54.804598  / # #
    2023-02-23T06:04:54.906817  export SHELL=3D/bin/sh
    2023-02-23T06:04:54.907471  #
    2023-02-23T06:04:55.008828  / # export SHELL=3D/bin/sh. /lava-283198/en=
vironment
    2023-02-23T06:04:55.009537  =

    2023-02-23T06:04:55.110978  / # . /lava-283198/environment/lava-283198/=
bin/lava-test-runner /lava-283198/1
    2023-02-23T06:04:55.111870   =

    ... (13 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/63f=
70222d8feec5f388c8670
        new failure (last pass: next-20230221)

    2023-02-23T06:05:02.119819  /lava-283198/1/../bin/lava-test-case
    2023-02-23T06:05:02.120114  <8>[  159.895697] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63f706aa3481a7b19a8c863c

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63f706aa3481a7b19a8c864d
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-23T06:24:24.952190  /lava-283234/1/../bin/lava-test-case
    2023-02-23T06:24:24.955288  <8>[   17.603919] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63f=
706aa3481a7b19a8c864f
        failing since 34 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-23T06:24:26.964317  /lava-283234/1/../bin/lava-test-case
    2023-02-23T06:24:26.964947  <8>[   19.677649] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-23T06:24:26.965197  /lava-283234/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6fef92f07b7110f8c865c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f6fef92f07b7110f8c8665
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-23T05:51:33.129231  / # #
    2023-02-23T05:51:33.231120  export SHELL=3D/bin/sh
    2023-02-23T05:51:33.231932  #
    2023-02-23T05:51:33.333772  / # export SHELL=3D/bin/sh. /lava-3367791/e=
nvironment
    2023-02-23T05:51:33.334221  =

    2023-02-23T05:51:33.334483  / # <3>[   18.175451] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T05:51:33.435861  . /lava-3367791/environment/lava-3367791/bi=
n/lava-test-runner /lava-3367791/1
    2023-02-23T05:51:33.436371  =

    2023-02-23T05:51:33.447714  / # /lava-3367791/bin/lava-test-runner /lav=
a-3367791/1
    2023-02-23T05:51:33.504610  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701ca2b534c715a8c8654

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f701ca2b534c715a8c865d
        failing since 36 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-23T06:03:36.914324  / # #
    2023-02-23T06:03:37.016080  export SHELL=3D/bin/sh
    2023-02-23T06:03:37.016796  #
    2023-02-23T06:03:37.118049  / # export SHELL=3D/bin/sh. /lava-3367924/e=
nvironment
    2023-02-23T06:03:37.118575  <3>[  103.013464] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T06:03:37.118823  =

    2023-02-23T06:03:37.220104  / # . /lava-3367924/environment/lava-336792=
4/bin/lava-test-runner /lava-3367924/1
    2023-02-23T06:03:37.220810  =

    2023-02-23T06:03:37.238030  / # /lava-3367924/bin/lava-test-runner /lav=
a-3367924/1
    2023-02-23T06:03:37.292973  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f705b1dcbb0a5ab88c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f705b1dcbb0a5ab88c863b
        failing since 36 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-23T06:20:29.360479  / # #
    2023-02-23T06:20:29.462342  export SHELL=3D/bin/sh
    2023-02-23T06:20:29.462831  #
    2023-02-23T06:20:29.564494  / # export SHELL=3D/bin/sh. /lava-3368090/e=
nvironment
    2023-02-23T06:20:29.565143  <3>[   18.223091] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T06:20:29.565529  =

    2023-02-23T06:20:29.666934  / # . /lava-3368090/environment/lava-336809=
0/bin/lava-test-runner /lava-3368090/1
    2023-02-23T06:20:29.667591  =

    2023-02-23T06:20:29.673603  / # /lava-3368090/bin/lava-test-runner /lav=
a-3368090/1
    2023-02-23T06:20:29.737461  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6ff251c02e16f118c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f6ff251c02e16f118c8639
        failing since 35 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-23T05:51:55.018802  / # #
    2023-02-23T05:51:55.120983  export SHELL=3D/bin/sh
    2023-02-23T05:51:55.121484  <3>[   18.031310] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T05:51:55.121830  #
    2023-02-23T05:51:55.223364  / # export SHELL=3D/bin/sh. /lava-3367809/e=
nvironment
    2023-02-23T05:51:55.223901  =

    2023-02-23T05:51:55.325494  / # . /lava-3367809/environment/lava-336780=
9/bin/lava-test-runner /lava-3367809/1
    2023-02-23T05:51:55.326268  =

    2023-02-23T05:51:55.337132  / # /lava-3367809/bin/lava-test-runner /lav=
a-3367809/1
    2023-02-23T05:51:55.402054  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7019877c81147268c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7019877c81147268c8638
        failing since 36 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-23T06:02:54.612782  / # <3>[   34.627068] brcmfmac: brcmf_sdio_=
htclk: HT Ava#
    2023-02-23T06:02:54.715040  export SHELL=3D/bin/sh
    2023-02-23T06:02:54.715524  il timeout (1000000): clkctl 0x50
    2023-02-23T06:02:54.715859  #
    2023-02-23T06:02:54.817381  / # export SHELL=3D/bin/sh. /lava-3367925/e=
nvironment
    2023-02-23T06:02:54.817856  =

    2023-02-23T06:02:54.919403  / # . /lava-3367925/environment/lava-336792=
5/bin/lava-test-runner /lava-3367925/1
    2023-02-23T06:02:54.920236  =

    2023-02-23T06:02:54.937834  / # /lava-3367925/bin/lava-test-runner /lav=
a-3367925/1
    2023-02-23T06:02:54.994658  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f706339624e3be548c8785

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f706339624e3be548c878e
        failing since 36 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-23T06:22:35.439124  + set +x<8>[   18.419857] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3368078_1.5.2.4.1>
    2023-02-23T06:22:35.544557  / # #
    2023-02-23T06:22:35.646511  export SHELL=3D/bin/sh
    2023-02-23T06:22:35.647078  #
    2023-02-23T06:22:35.748321  / # export SHELL=3D/bin/sh. /lava-3368078/e=
nvironment
    2023-02-23T06:22:35.749049  =

    2023-02-23T06:22:35.850561  / # . /lava-3368078/environment/lava-336807=
8/bin/lava-test-runner /lava-3368078/1
    2023-02-23T06:22:35.851675  =

    2023-02-23T06:22:35.855803  / # /lava-3368078/bin/lava-test-runner /lav=
a-3368078/1
    2023-02-23T06:22:35.927680  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6ff1fe12aedd89a8c867c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f6ff1fe12aedd89a8c8685
        failing since 1 day (last pass: next-20221129, first fail: next-202=
30221)

    2023-02-23T05:52:06.173354  / # #
    2023-02-23T05:52:06.275150  export SHELL=3D/bin/sh
    2023-02-23T05:52:06.275654  #
    2023-02-23T05:52:06.377006  / # export SHELL=3D/bin/sh. /lava-3367795/e=
nvironment
    2023-02-23T05:52:06.377509  =

    2023-02-23T05:52:06.478889  / # . /lava-3367795/environment/lava-336779=
5/bin/lava-test-runner /lava-3367795/1
    2023-02-23T05:52:06.479634  =

    2023-02-23T05:52:06.484578  / # /lava-3367795/bin/lava-test-runner /lav=
a-3367795/1
    2023-02-23T05:52:06.563591  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T05:52:06.564178  + cd /lava-3367795/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70204fce41145ce8c8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech-a=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f70204fce41145ce8c8641
        failing since 1 day (last pass: next-20221130, first fail: next-202=
30221)

    2023-02-23T06:04:19.472434  / # #
    2023-02-23T06:04:19.574553  export SHELL=3D/bin/sh
    2023-02-23T06:04:19.575047  #
    2023-02-23T06:04:19.676574  / # export SHELL=3D/bin/sh. /lava-3367910/e=
nvironment
    2023-02-23T06:04:19.677066  =

    2023-02-23T06:04:19.778608  / # . /lava-3367910/environment/lava-336791=
0/bin/lava-test-runner /lava-3367910/1
    2023-02-23T06:04:19.779474  =

    2023-02-23T06:04:19.796961  / # /lava-3367910/bin/lava-test-runner /lav=
a-3367910/1
    2023-02-23T06:04:19.862902  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T06:04:19.863517  + cd /lava-3367910/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f705452b1345a4ed8c869a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f705452b1345a4ed8c86a3
        failing since 5 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-23T06:18:29.228599  / # #
    2023-02-23T06:18:29.330477  export SHELL=3D/bin/sh
    2023-02-23T06:18:29.330973  #
    2023-02-23T06:18:29.432490  / # export SHELL=3D/bin/sh. /lava-3368015/e=
nvironment
    2023-02-23T06:18:29.432870  =

    2023-02-23T06:18:29.534288  / # . /lava-3368015/environment/lava-336801=
5/bin/lava-test-runner /lava-3368015/1
    2023-02-23T06:18:29.535138  =

    2023-02-23T06:18:29.553850  / # /lava-3368015/bin/lava-test-runner /lav=
a-3368015/1
    2023-02-23T06:18:29.618725  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T06:18:29.619329  + cd /lava-3368015/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7065ddb518f2f778c86f4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech=
-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-libretech=
-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7065ddb518f2f778c86fd
        failing since 5 days (last pass: next-20221130, first fail: next-20=
230217)

    2023-02-23T06:23:05.799406  <8>[   18.249349] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3368081_1.5.2.4.1>
    2023-02-23T06:23:05.904804  / # #
    2023-02-23T06:23:06.006708  export SHELL=3D/bin/sh
    2023-02-23T06:23:06.007221  #
    2023-02-23T06:23:06.108796  / # export SHELL=3D/bin/sh. /lava-3368081/e=
nvironment
    2023-02-23T06:23:06.109307  =

    2023-02-23T06:23:06.210742  / # . /lava-3368081/environment/lava-336808=
1/bin/lava-test-runner /lava-3368081/1
    2023-02-23T06:23:06.211524  =

    2023-02-23T06:23:06.216926  / # /lava-3368081/bin/lava-test-runner /lav=
a-3368081/1
    2023-02-23T06:23:06.295800  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6fefaec5d6d60ba8c866f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f6fefaec5d6d60ba8c8678
        failing since 35 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-23T05:51:34.712578  / # #
    2023-02-23T05:51:34.814040  export SHELL=3D/bin/sh
    2023-02-23T05:51:34.814370  #
    2023-02-23T05:51:34.915518  / # export SHELL=3D/bin/sh. /lava-3367798/e=
nvironment
    2023-02-23T05:51:34.916039  =

    2023-02-23T05:51:34.916306  / # <3>[   18.104713] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T05:51:35.017697  . /lava-3367798/environment/lava-3367798/bi=
n/lava-test-runner /lava-3367798/1
    2023-02-23T05:51:35.018208  =

    2023-02-23T05:51:35.031026  / # /lava-3367798/bin/lava-test-runner /lav=
a-3367798/1
    2023-02-23T05:51:35.088089  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701c92fefd12dd48c8659

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f701c92fefd12dd48c8662
        failing since 36 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-23T06:03:35.376441  / # #
    2023-02-23T06:03:35.477862  export SHELL=3D/bin/sh
    2023-02-23T06:03:35.478241  #
    2023-02-23T06:03:35.579359  / # export SHELL=3D/bin/sh. /lava-3367902/e=
nvironment
    2023-02-23T06:03:35.579692  =

    2023-02-23T06:03:35.579845  / # <3>[  103.196777] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T06:03:35.680962  . /lava-3367902/environment/lava-3367902/bi=
n/lava-test-runner /lava-3367902/1
    2023-02-23T06:03:35.681464  =

    2023-02-23T06:03:35.698898  / # /lava-3367902/bin/lava-test-runner /lav=
a-3367902/1
    2023-02-23T06:03:35.739110  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7030a6b944caa0a8c8673

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f7030a6b944caa0a8c867c
        failing since 36 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-23T06:09:09.269399  <8>[   17.815369] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3367973_1.5.2.4.1>
    2023-02-23T06:09:09.373380  / # #
    2023-02-23T06:09:09.475221  export SHELL=3D/bin/sh
    2023-02-23T06:09:09.475768  #
    2023-02-23T06:09:09.577454  / # export SHELL=3D/bin/sh. /lava-3367973/e=
nvironment
    2023-02-23T06:09:09.577844  =

    2023-02-23T06:09:09.578362  / # <3>[   18.088523] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T06:09:09.680314  . /lava-3367973/environment/lava-3367973/bi=
n/lava-test-runner /lava-3367973/1
    2023-02-23T06:09:09.681619  =

    2023-02-23T06:09:09.700047  / # /lava-3367973/bin/lava-test-runner /lav=
a-3367973/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f705c5e8748b18028c8699

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f705c6e8748b18028c86a2
        failing since 36 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-23T06:20:31.049648  / # #
    2023-02-23T06:20:31.151058  export SHELL=3D/bin/sh
    2023-02-23T06:20:31.151498  #
    2023-02-23T06:20:31.252830  / # export SHELL=3D/bin/sh. /lava-3368091/e=
nvironment
    2023-02-23T06:20:31.253280  =

    2023-02-23T06:20:31.253512  / # <3>[   18.157366] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-23T06:20:31.354806  . /lava-3368091/environment/lava-3368091/bi=
n/lava-test-runner /lava-3368091/1
    2023-02-23T06:20:31.355512  =

    2023-02-23T06:20:31.368436  / # /lava-3368091/bin/lava-test-runner /lav=
a-3368091/1
    2023-02-23T06:20:31.424371  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7090c2f9ddb0e1c8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7090c2f9ddb0e1c8c8=
632
        failing since 29 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f706b7ecbd03cd0d8c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f706b7ecbd03cd0d8c8=
64b
        failing since 26 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7051306e17686118c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7051306e17686118c8=
64f
        failing since 29 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63f70723721c3347908c863a

  Results:     163 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-driver-present: https://kernelci.org/test/c=
ase/id/63f70723721c3347908c8657
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214)

    2023-02-23T06:26:20.298212  /lava-9292616/1/../bin/lava-test-case

    2023-02-23T06:26:20.304976  <8>[   30.445527] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f70724721c3347908c86e6
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214)

    2023-02-23T06:26:07.730614  + set +x

    2023-02-23T06:26:07.736803  <8>[   17.876868] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9292616_1.5.2.3.1>

    2023-02-23T06:26:07.841814  / # #

    2023-02-23T06:26:07.942759  export SHELL=3D/bin/sh

    2023-02-23T06:26:07.942980  #

    2023-02-23T06:26:08.043946  / # export SHELL=3D/bin/sh. /lava-9292616/e=
nvironment

    2023-02-23T06:26:08.044178  =


    2023-02-23T06:26:08.145160  / # . /lava-9292616/environment/lava-929261=
6/bin/lava-test-runner /lava-9292616/1

    2023-02-23T06:26:08.145483  =


    2023-02-23T06:26:08.150515  / # /lava-9292616/bin/lava-test-runner /lav=
a-9292616/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d5a8af77e4bc8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d5a8af77e4bc8c8=
630
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7060563a22b4ded8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7060563a22b4ded8c8=
630
        failing since 0 day (last pass: next-20230221, first fail: next-202=
30222) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63f706bd3a94dc94cb8c862f

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63f706be3a94dc94cb8c86d4
        failing since 21 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-23T06:24:22.402042  /lava-9292467/1/../bin/lava-test-case

    2023-02-23T06:24:22.409064  <8>[   22.572245] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63f706be3a94dc94cb8c86d5
        failing since 21 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-23T06:24:21.382770  /lava-9292467/1/../bin/lava-test-case

    2023-02-23T06:24:21.389218  <8>[   21.552319] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63f706be3a94dc94cb8c86d6
        failing since 21 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-23T06:24:19.353566    V:            0

    2023-02-23T06:24:19.353652    Res:          0x0

    2023-02-23T06:24:19.357239  TPM2_CC_TestParms:

    2023-02-23T06:24:19.357332    value: 0x18A

    2023-02-23T06:24:19.360327    commandIndex: 0x18a

    2023-02-23T06:24:19.360419    reserved1:    0x0

    2023-02-23T06:24:19.363369    nv:           0

    2023-02-23T06:24:19.363456    extensive:    0

    2023-02-23T06:24:19.366789    flushed:      0

    2023-02-23T06:24:19.366869    cHandles:     0x0
 =

    ... (51 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d95ed4e5bc998c8a29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d95ed4e5bc998c8=
a2a
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701a2ad6aff68268c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701a2ad6aff68268c8=
648
        failing since 183 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f71fc351c178a8128c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f71fc351c178a8128c8=
642
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-baylibre    | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7007fd5e211c3888c8637

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f7007fd5e211c3888c863f
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215)

    2023-02-23T05:58:06.111059  /lava-3367860/1/../bin/lava-test-case
    2023-02-23T05:58:06.199388  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701df70fab992d48c8656

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f701df70fab992d48c865e
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215)

    2023-02-23T06:04:04.712693  /lava-60117/1/../bin/lava-test-case
    2023-02-23T06:04:04.775723  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7003c4fe47f44998c8649

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.all-cpus-are-online: https://kernelci.org/test/case/id/=
63f7003d4fe47f44998c8651
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215)

    2023-02-23T05:57:11.834208  /lava-9291772/1/../bin/lava-test-case
    2023-02-23T05:57:11.834375  =


    2023-02-23T05:57:11.858771  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dall=
-cpus-are-online RESULT=3Dfail>
    2023-02-23T05:57:11.858907  =

   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708df7dede6dd198c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708df7dede6dd198c8=
631
        failing since 162 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70a2836ec31e5e78c8a95

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70a2836ec31e5e78c8=
a96
        failing since 162 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708e969056aea6b8c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708e969056aea6b8c8=
64e
        failing since 162 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708f07dede6dd198c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708f07dede6dd198c8=
64d
        failing since 160 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70a03063a30f0228c86e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70a03063a30f0228c8=
6e1
        failing since 160 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d525e8ac0fa08c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d525e8ac0fa08c8=
631
        failing since 160 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708f2dbb1ed3a2a8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708f2dbb1ed3a2a8c8=
632
        failing since 160 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70a7831470ad1b38c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70a7831470ad1b38c8=
634
        failing since 160 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d625e8ac0fa08c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d625e8ac0fa08c8=
636
        failing since 160 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708f151622bb5d08c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708f151622bb5d08c8=
632
        failing since 162 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70a3d6cc7dd575a8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70a3d6cc7dd575a8c8=
630
        failing since 162 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f700be80dbba96288c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f700be80dbba96288c8=
631
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7034fbb43a235d48c86ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7034fbb43a235d48c8=
6ae
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70153f90faac2698c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70153f90faac2698c8=
64e
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f706400a0e8350be8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f706400a0e8350be8c8=
630
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f704d2677f3ac4308c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f704d2677f3ac4308c8=
632
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f707bcb13049fb178c899c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f707bcb13049fb178c8=
99d
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f700354fe47f44998c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f700354fe47f44998c8=
633
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f700384fe47f44998c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f700384fe47f44998c8=
636
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7014a79844fc8918c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7014a79844fc8918c8=
649
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70175a0e98608a68c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70175a0e98608a68c8=
644
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701bf2b534c715a8c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701bf2b534c715a8c8=
642
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701fec13d5540878c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701fec13d5540878c8=
630
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f702af4634a83ba58c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f702af4634a83ba58c8=
652
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70350bb43a235d48c86b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70350bb43a235d48c8=
6b1
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f700139276ddcba88c8699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f700139276ddcba88c8=
69a
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7003b4fe47f44998c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7003b4fe47f44998c8=
647
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7021ba89f9f9bb38c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7021ba89f9f9bb38c8=
632
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7021ea89f9f9bb38c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7021ea89f9f9bb38c8=
63f
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f703838dfad599998c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f703838dfad599998c8=
637
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f703ab35129e32e38c86ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f703ab35129e32e38c8=
6bb
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70500e77f46f88d8c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70500e77f46f88d8c8=
661
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70654d90ba8a87c8c8668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70654d90ba8a87c8c8=
669
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f700009276ddcba88c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f700009276ddcba88c8=
65c
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701531f390b8cab8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701531f390b8cab8c8=
630
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7019081c568721e8c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7019081c568721e8c8=
63d
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7038d35129e32e38c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7038d35129e32e38c8=
63e
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7083d08f7d766298c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7083d08f7d766298c8=
638
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7067c5bf13858858c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7067c5bf13858858c8=
64b
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70a01063a30f0228c86dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70a01063a30f0228c8=
6de
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70333e42839a4d88c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70333e42839a4d88c8=
640
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f704e3677f3ac4308c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f704e3677f3ac4308c8=
646
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f707f92d7ed48b388c8718

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f707f92d7ed48b388c8=
719
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7000b9276ddcba88c868b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7000b9276ddcba88c8=
68c
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f700333a25ada8c68c865f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f700333a25ada8c68c8=
660
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701731f390b8cab8c8689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701731f390b8cab8c8=
68a
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7017607ca6174cd8c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7017607ca6174cd8c8=
650
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701c170fab992d48c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701c170fab992d48c8=
630
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701ff063af1d26c8c865f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701ff063af1d26c8c8=
660
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f702c389f025a3f08c86d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f702c389f025a3f08c8=
6d6
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f703634c379d09498c86b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f703634c379d09498c8=
6ba
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6ffeb802d8eac718c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f6ffeb802d8eac718c8=
643
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f700277c8d647d6c8c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f700277c8d647d6c8c8=
657
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7021ceb843110f68c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7021ceb843110f68c8=
632
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7022fd8feec5f388c86b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7022fd8feec5f388c8=
6b7
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63f703858dfad599998c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f703858dfad599998c8=
63d
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f704d7df02d3f0298c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f704d7df02d3f0298c8=
630
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7051406e17686118c8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7051406e17686118c8=
656
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7066879fef3772b8c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7066879fef3772b8c8=
657
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6ffd720922cbb788c86e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f6ffd720922cbb788c8=
6e6
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230215) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f703780c60fd866d8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f703780c60fd866d8c8=
658
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7083b9595a3f8a98c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7083b9595a3f8a98c8=
648
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f706b83481a7b19a8c8884

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f706b83481a7b19a8c8=
885
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70a00063a30f0228c86da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70a00063a30f0228c8=
6db
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6fe3cc775a1ef378c8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f6fe3cc775a1ef378c8=
671
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70739f4483379268c8673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70739f4483379268c8=
674
        failing since 10 days (last pass: next-20230210, first fail: next-2=
0230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63f6ff6e079052dbf68c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f6ff6e079052dbf68c8=
63d
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701ad77c81147268c867a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f701ad77c81147268c8=
67b
        failing since 9 days (last pass: next-20230210, first fail: next-20=
230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7063ad90ba8a87c8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7063ad90ba8a87c8c8=
630
        failing since 10 days (last pass: next-20230210, first fail: next-2=
0230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63f706c1ecbd03cd0d8c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f706c1ecbd03cd0d8c8=
670
        failing since 10 days (last pass: next-20230210, first fail: next-2=
0230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f707f390c5763f068c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f707f390c5763f068c8=
63e
        failing since 10 days (last pass: next-20230210, first fail: next-2=
0230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7021ca89f9f9bb38c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7021ca89f9f9bb38c8=
638
        failing since 92 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7011a794f12cd328c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7011a794f12cd328c8=
632
        failing since 92 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63f703fb855f82b6818c8633

  Results:     75 PASS, 13 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/63f703fc855f82b6818c866e
        failing since 2 days (last pass: next-20230217, first fail: next-20=
230220)

    2023-02-23T06:12:47.989278  /lava-9292161/1/../bin/lava-test-case
   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
3f703fc855f82b6818c8671
        failing since 2 days (last pass: next-20230217, first fail: next-20=
230220)

    2023-02-23T06:12:45.938935  <8>[   65.873010] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-driver-present RESULT=3Dpass>

    2023-02-23T06:12:46.959266  /lava-9292161/1/../bin/lava-test-case

    2023-02-23T06:12:46.971912  <8>[   66.907241] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d65ed4e5bc998c8a23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d65ed4e5bc998c8=
a24
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d6a8af77e4bc8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d6a8af77e4bc8c8=
637
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63f708d6a8af77e4bc8c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f708d6a8af77e4bc8c8=
634
        failing since 15 days (last pass: next-20230206, first fail: next-2=
0230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63f7045034ad40c2908c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f7045034ad40c2908c8=
64b
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63f705e08bfd751cba8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f705e08bfd751cba8c8=
63b
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70965fda71d5e758c86c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f70965fda71d5e758c8=
6c4
        failing since 8 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f707d460ce1ef2fd8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f707d460ce1ef2fd8c8=
631
        failing since 9 days (last pass: next-20230213, first fail: next-20=
230214) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f70aa5d77baef8d08c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plus-orangepi-zero.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f70aa5d77baef8d08c8638
        failing since 1 day (last pass: next-20230220, first fail: next-202=
30221)

    2023-02-23T06:40:44.779528  / # #
    2023-02-23T06:40:44.885531  export SHELL=3D/bin/sh
    2023-02-23T06:40:44.887185  #
    2023-02-23T06:40:44.990879  / # export SHELL=3D/bin/sh. /lava-3367930/e=
nvironment
    2023-02-23T06:40:44.992486  =

    2023-02-23T06:40:45.096207  / # . /lava-3367930/environment/lava-336793=
0/bin/lava-test-runner /lava-3367930/1
    2023-02-23T06:40:45.099141  =

    2023-02-23T06:40:45.102908  / # /lava-3367930/bin/lava-test-runner /lav=
a-3367930/1
    2023-02-23T06:40:45.246879  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-23T06:40:45.248021  + cd /lava-3367930/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63f701d22fefd12dd48c867a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63f701d22fefd12dd48c8683
        failing since 29 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-02-23T06:03:43.266396  + set +x
    2023-02-23T06:03:43.268571  <8>[   10.483987] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3367932_1.5.2.4.1>
    2023-02-23T06:03:43.373679  / # #
    2023-02-23T06:03:43.475867  export SHELL=3D/bin/sh
    2023-02-23T06:03:43.476407  #
    2023-02-23T06:03:43.577964  / # export SHELL=3D/bin/sh. /lava-3367932/e=
nvironment
    2023-02-23T06:03:43.578466  =

    2023-02-23T06:03:43.680038  / # . /lava-3367932/environment/lava-336793=
2/bin/lava-test-runner /lava-3367932/1
    2023-02-23T06:03:43.680971  =

    2023-02-23T06:03:43.699367  / # /lava-3367932/bin/lava-test-runner /lav=
a-3367932/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63f702a8675cf0b7b78c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230223/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230217.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63f702a8675cf0b7b78c8=
630
        failing since 91 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =20
