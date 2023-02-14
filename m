Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716CB695F72
	for <lists+linux-next@lfdr.de>; Tue, 14 Feb 2023 10:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjBNJlQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Feb 2023 04:41:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjBNJlO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2023 04:41:14 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF8A3C27
        for <linux-next@vger.kernel.org>; Tue, 14 Feb 2023 01:41:10 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so14914911pjw.2
        for <linux-next@vger.kernel.org>; Tue, 14 Feb 2023 01:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jJLQ2MuhCBOaS969Oow5mvaEMgMRVfckrK7zXbThQfU=;
        b=HsFwVGZOSp9jAWo5w6wcJn60r82yzVQQdFvug53tf8DQzCUOgkfLXxUlhZWSGIIph5
         EqZIYKGQHJUxqXq2qHBDqXV4FJx+kPbfSRr66+ENooyyplM/339Yt7vTamKyIn7sPdFn
         fiFk+h0Vv8ZtGAs/WkgkQT6JIWoUf1nUyvikotdPY1GTJ1Uts8Q8dR0SEEu1Atq6n0Ag
         0knOxWZjem4nqxJxudpoc/UGHj85yDL9PhkubIZIEc6fX3kSS2YTEPvO0AeEGt9cek5g
         sXhwkbR8HoY0yBIJA9giZHpaZOOt2YnjJrhYVVlx5TtsMQSkeIn9htEDvc7riiPsJHqs
         ngVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJLQ2MuhCBOaS969Oow5mvaEMgMRVfckrK7zXbThQfU=;
        b=vC1S26ar2BL+rDZAMfcbmZ+LnVW9QLk3kCEhoAibUD7AZsExvdUwww4NxB2YAf7JTi
         /Tqy5o9zxXdPmePsUT00p9eU98U0d22vzx7q+emoGRIs3Q+I2ft0dbGQHIGJWxY+tIOP
         6VF/LAQktx2SCHsz6vVKfoIYV3Uwv4+BGhXKGZBDax5ILIUAQ3czMypdFGUvrmDNktTN
         UU+S3OVi5U2xrusBKGBs8lb5yJbI8YBao4AFeKgAKRcHfxCWoTd+BBDU6vHBod+SggEq
         pAniIIiE9Sw847JqF1WvQkQmq8U8PPqP8Dxe2hiouF3li0RGC121vABKCiRtt4aY2b58
         cj/Q==
X-Gm-Message-State: AO0yUKUFn8eO5RlvZ5HsnTy9J76vY0fyIvtVAXbODhs7XcKjBRot7HIY
        AJStmO160W5Y95GSSod1PH9H6G/1ZinbTi+E3aI=
X-Google-Smtp-Source: AK7set9PWzjOjc0n4JT7tTOsR6Am0FpwZxqhiQpk4/kKPeHyRJWp3XU9vMVzYCdAP2aXLVwgvfLGVA==
X-Received: by 2002:a17:902:e40d:b0:19a:75b8:f50c with SMTP id m13-20020a170902e40d00b0019a75b8f50cmr1448784ple.31.1676367667896;
        Tue, 14 Feb 2023 01:41:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902c58e00b00198e6257921sm5078154plx.269.2023.02.14.01.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 01:41:07 -0800 (PST)
Message-ID: <63eb5733.170a0220.41979.8b47@mx.google.com>
Date:   Tue, 14 Feb 2023 01:41:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230214
X-Kernelci-Report-Type: test
Subject: next/master baseline: 919 runs, 198 regressions (next-20230214)
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

next/master baseline: 919 runs, 198 regressions (next-20230214)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10     | omap=
2plus_defconfig          | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10     | davi=
nci_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10     | defc=
onfig+debug              | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10     | defc=
onfig+kselftest          | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+ima                | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =

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

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 2          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+kselftest          | 1          =

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

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

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

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

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

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+kselftest          | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+debug              | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230214/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230214
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3ebb0ac55efaf1d0fb1b106f852c114e5021f7eb =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2280e8ed7406708c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2280e8ed7406708c8=
631
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb21e27957eb85c78c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb21e27957eb85c78c8=
655
        failing since 23 days (last pass: next-20230119, first fail: next-2=
0230120) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10     | omap=
2plus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb23599e35ff96c98c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb23599e35ff96c98c8=
644
        failing since 20 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10     | davi=
nci_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1e056d6e38d2368c8673

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63eb1e056d6e38d=
2368c8676
        failing since 0 day (last pass: next-20230208, first fail: next-202=
30213)
        30 lines

    2023-02-14T05:36:44.192266  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-02-14T05:36:44.192524  kern  :emerg : Process udevd (pid: 64, stac=
k limit =3D 0xa93ad8ca)
    2023-02-14T05:36:44.192705  kern  :emerg : Stack: (0xc88f9cf8 to 0xc88f=
a000)
    2023-02-14T05:36:44.192889  kern  :emerg : 9ce0:                       =
                                c4ba7200 c076b860
    2023-02-14T05:36:44.193081  kern  :emerg : 9d00: 00000000 c03abe08 0000=
0000 c0edfe0d 0000005d c0edfe0d c076b860 bf2e2220
    2023-02-14T05:36:44.195228  kern  :emerg : 9d20: 00000000 00000000 0000=
0000 00000001 c076b85c bf32c424 bf2e2220 00000000
    2023-02-14T05:36:44.235886  kern  :emerg : 9d40: 00000000 00000000 0000=
0000 bf2e63c8 00000080 bf2e4270 c4b6a2b8 c0820034
    2023-02-14T05:36:44.236168  kern  :emerg : 9d60: c4df9b00 00000001 c4d5=
e7b4 00000000 c4b31210 c0180490 c4b31210 c0820034
    2023-02-14T05:36:44.236362  kern  :emerg : 9d80: c4b31210 c018061c c4d5=
e7b4 00000000 00020000 c018010c c4b31210 c4b31160
    2023-02-14T05:36:44.236534  kern  :emerg : 9da0: c08b3580 c06a1990 0000=
0001 c0edfe0d 00000000 00000000 c076b500 bf2e2024 =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1f73370e9eb55b8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1f73370e9eb55b8c8=
658
        failing since 21 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb25fdef999ac4748c863b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb25fdef999ac4748c8642
        failing since 4 days (last pass: next-20230209, first fail: next-20=
230210)

    2023-02-14T06:10:57.721565  + set +x
    2023-02-14T06:10:57.723412  [   22.202240] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1157835_1.5.2.4.1>
    2023-02-14T06:10:57.838715  #
    2023-02-14T06:10:57.940851  / # #export SHELL=3D/bin/sh
    2023-02-14T06:10:57.941355  =

    2023-02-14T06:10:58.042762  / # export SHELL=3D/bin/sh. /lava-1157835/e=
nvironment
    2023-02-14T06:10:58.043281  =

    2023-02-14T06:10:58.144721  / # . /lava-1157835/environment/lava-115783=
5/bin/lava-test-runner /lava-1157835/1
    2023-02-14T06:10:58.145511  =

    2023-02-14T06:10:58.148349  / # /lava-1157835/bin/lava-test-runner /lav=
a-1157835/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2030cb068aa1de8c8642

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb2030cb068aa1de8c864b
        failing since 14 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-14T05:46:03.108495  + set +x
    2023-02-14T05:46:03.108696  [   13.055120] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905417_1.5.2.3.1>
    2023-02-14T05:46:03.217014  / # #
    2023-02-14T05:46:03.318651  export SHELL=3D/bin/sh
    2023-02-14T05:46:03.319193  #
    2023-02-14T05:46:03.420772  / # export SHELL=3D/bin/sh. /lava-905417/en=
vironment
    2023-02-14T05:46:03.421516  =

    2023-02-14T05:46:03.522927  / # . /lava-905417/environment/lava-905417/=
bin/lava-test-runner /lava-905417/1
    2023-02-14T05:46:03.523633  =

    2023-02-14T05:46:03.526894  / # /lava-905417/bin/lava-test-runner /lava=
-905417/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb224c3aa586a1d28c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb224c3aa586a1d28c8653
        failing since 14 days (last pass: next-20221205, first fail: next-2=
0230130)

    2023-02-14T05:55:03.238757  + set +x
    2023-02-14T05:55:03.239056  [   12.795067] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905437_1.5.2.3.1>
    2023-02-14T05:55:03.346378  / # #
    2023-02-14T05:55:03.448315  export SHELL=3D/bin/sh
    2023-02-14T05:55:03.448722  #
    2023-02-14T05:55:03.549925  / # export SHELL=3D/bin/sh. /lava-905437/en=
vironment
    2023-02-14T05:55:03.550340  =

    2023-02-14T05:55:03.651523  / # . /lava-905437/environment/lava-905437/=
bin/lava-test-runner /lava-905437/1
    2023-02-14T05:55:03.652043  =

    2023-02-14T05:55:03.656129  / # /lava-905437/bin/lava-test-runner /lava=
-905437/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb229c13b69b44698c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb229c13b69b44698c8643
        failing since 14 days (last pass: next-20221206, first fail: next-2=
0230130)

    2023-02-14T05:56:21.814668  [   12.077067] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-02-14T05:56:21.821124  + set +x
    2023-02-14T05:56:21.821327  [   12.087330] <LAVA_SIGNAL_ENDRUN 0_dmesg =
905444_1.5.2.3.1>
    2023-02-14T05:56:21.929630  / # #
    2023-02-14T05:56:22.031348  export SHELL=3D/bin/sh
    2023-02-14T05:56:22.031953  #
    2023-02-14T05:56:22.133210  / # export SHELL=3D/bin/sh. /lava-905444/en=
vironment
    2023-02-14T05:56:22.133811  =

    2023-02-14T05:56:22.235047  / # . /lava-905444/environment/lava-905444/=
bin/lava-test-runner /lava-905444/1
    2023-02-14T05:56:22.235640   =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb247247dcb485c28c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb247247dcb485c28c8=
631
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb250a805cc4e75e8c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb250a805cc4e75e8c8=
64d
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb252fb4bab8ed768c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb252fb4bab8ed768c8=
640
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb399d27831bcb728c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb399d27831bcb728c8=
641
        failing since 1 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1e6e40dfb6baa18c8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1e6e40dfb6baa18c8=
671
        failing since 39 days (last pass: next-20221125, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20212e1caa3bdd8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20212e1caa3bdd8c8=
63f
        failing since 40 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb25bd4d4d8b3e3f8c8674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb25bd4d4d8b3e3f8c8=
675
        failing since 40 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2edb36eb5374b88c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2edb36eb5374b88c8=
633
        failing since 40 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb3069a8603ba1688c86e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb3069a8603ba1688c8=
6e9
        failing since 40 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb3212fb431546478c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb3212fb431546478c8=
63b
        failing since 40 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1ee54f0e13da388c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1ee54f0e13da388c8=
630
        failing since 308 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb21e87957eb85c78c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb21e87957eb85c78c8=
658
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63eb1db34f1e3a80198c8640

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1db34f1e3a80198c8647
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:35:26.719138  / # #
    2023-02-14T05:35:26.820992  export SHELL=3D/bin/sh
    2023-02-14T05:35:26.821410  #
    2023-02-14T05:35:26.923309  / # export SHELL=3D/bin/sh. /lava-274810/en=
vironment
    2023-02-14T05:35:26.923711  =

    2023-02-14T05:35:27.025053  / # . /lava-274810/environment/lava-274810/=
bin/lava-test-runner /lava-274810/1
    2023-02-14T05:35:27.025874  =

    2023-02-14T05:35:27.031934  / # /lava-274810/bin/lava-test-runner /lava=
-274810/1
    2023-02-14T05:35:27.100828  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T05:35:27.101230  + <8>[   22.367457] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 274810_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63eb1db34f1e3a80198c864b
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:35:29.197900  /lava-274810/1/../bin/lava-test-case
    2023-02-14T05:35:29.198552  <8>[   24.475343] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-14T05:35:29.198829  /lava-274810/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
eb1db34f1e3a80198c864d
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:35:30.257516  /lava-274810/1/../bin/lava-test-case
    2023-02-14T05:35:30.258027  <8>[   25.513034] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-14T05:35:30.258325  /lava-274810/1/../bin/lava-test-case
    2023-02-14T05:35:30.258604  <8>[   25.530820] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-14T05:35:30.258902  /lava-274810/1/../bin/lava-test-case
    2023-02-14T05:35:30.259154  <8>[   25.550388] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-14T05:35:30.259507  /lava-274810/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63eb1db34f1e3a80198c8652
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:35:31.333026  /lava-274810/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63eb1db34f1e3a80198c8653
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:35:31.336238  <8>[   26.628266] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-14T05:35:32.391499  /lava-274810/1/../bin/lava-test-case
    2023-02-14T05:35:32.392026  <8>[   27.648531] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-14T05:35:32.392320  /lava-274810/1/../bin/lava-test-case
    2023-02-14T05:35:32.392641  <8>[   27.666764] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-14T05:35:32.392915  /lava-274810/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63eb1e2bb0e0a648fd8c8649

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1e2bb0e0a648fd8c8650
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:37:32.223580  / # #
    2023-02-14T05:37:32.325871  export SHELL=3D/bin/sh
    2023-02-14T05:37:32.326362  #
    2023-02-14T05:37:32.427583  / # export SHELL=3D/bin/sh. /lava-274816/en=
vironment
    2023-02-14T05:37:32.428080  =

    2023-02-14T05:37:32.529321  / # . /lava-274816/environment/lava-274816/=
bin/lava-test-runner /lava-274816/1
    2023-02-14T05:37:32.529995  =

    2023-02-14T05:37:32.536851  / # /lava-274816/bin/lava-test-runner /lava=
-274816/1
    2023-02-14T05:37:32.604934  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T05:37:32.605207  + <8>[   22.544802] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 274816_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63eb1e2bb0e0a648fd8c8654
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:37:34.699337  /lava-274816/1/../bin/lava-test-case
    2023-02-14T05:37:34.699736  <8>[   24.651660] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-14T05:37:34.699979  /lava-274816/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
eb1e2bb0e0a648fd8c8656
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:37:35.759396  /lava-274816/1/../bin/lava-test-case
    2023-02-14T05:37:35.759763  <8>[   25.688453] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63eb1e2bb0e0a648fd8c865b
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:37:36.835460  /lava-274816/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63eb1e2bb0e0a648fd8c865c
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:37:36.838701  <8>[   26.803965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-14T05:37:37.892113  /lava-274816/1/../bin/lava-test-case
    2023-02-14T05:37:37.892472  <8>[   27.824185] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-14T05:37:37.892710  /lava-274816/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/63eb214b9fe44855598c8679

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb214b9fe44855598c8680
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:50:17.461094  + set +x
    2023-02-14T05:50:17.464214  <8>[   45.757229][  T186] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 274844_1.5.2.4.1>
    2023-02-14T05:50:17.583527  #
    2023-02-14T05:50:17.685561  / # #export SHELL=3D/bin/sh
    2023-02-14T05:50:17.686078  =

    2023-02-14T05:50:17.787487  / # export SHELL=3D/bin/sh. /lava-274844/en=
vironment
    2023-02-14T05:50:17.788040  =

    2023-02-14T05:50:17.889576  / # . /lava-274844/environment/lava-274844/=
bin/lava-test-runner /lava-274844/1
    2023-02-14T05:50:17.890383  =

    2023-02-14T05:50:17.895986  / # /lava-274844/bin/lava-test-runner /lava=
-274844/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63eb214b9fe44855598c8684
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:50:22.268474  /lava-274844/1/../bin/lava-test-case
    2023-02-14T05:50:22.374459  <8>[   50.666038][  T255] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
eb214b9fe44855598c8686
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:50:23.872768  /lava-274844/1/../bin/lava-test-case
    2023-02-14T05:50:23.976808  <8>[   52.268346][  T265] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63eb214b9fe44855598c868b
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:50:26.675780  /lava-274844/1/../bin/lava-test-case
    2023-02-14T05:50:26.770721  <8>[   55.062713][  T296] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63eb214b9fe44855598c868c
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:50:28.018192  /lava-274844/1/../bin/lava-test-case
    2023-02-14T05:50:28.124292  <8>[   56.415969][  T302] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63eb2228a6542886cd8c86c4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb2228a6542886cd8c86cb
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:54:32.676576  / # #
    2023-02-14T05:54:32.779477  export SHELL=3D/bin/sh
    2023-02-14T05:54:32.780303  #
    2023-02-14T05:54:32.881840  / # export SHELL=3D/bin/sh. /lava-274857/en=
vironment
    2023-02-14T05:54:32.882389  =

    2023-02-14T05:54:32.984006  / # . /lava-274857/environment/lava-274857/=
bin/lava-test-runner /lava-274857/1
    2023-02-14T05:54:32.984850  =

    2023-02-14T05:54:33.004714  / # /lava-274857/bin/lava-test-runner /lava=
-274857/1
    2023-02-14T05:54:33.060654  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T05:54:33.061047  + <8>[   22.400825] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 274857_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63eb2228a6542886cd8c86cf
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:54:35.157728  /lava-274857/1/../bin/lava-test-case
    2023-02-14T05:54:35.158022  <8>[   24.506049] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-14T05:54:35.158175  /lava-274857/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
eb2228a6542886cd8c86d1
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:54:36.213717  /lava-274857/1/../bin/lava-test-case
    2023-02-14T05:54:36.214050  <8>[   25.543711] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-14T05:54:36.214477  /lava-274857/1/../bin/lava-test-case
    2023-02-14T05:54:36.214631  <8>[   25.560679] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-14T05:54:36.214785  /lava-274857/1/../bin/lava-test-case
    2023-02-14T05:54:36.214930  <8>[   25.579309] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-14T05:54:36.215065  /lava-274857/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63eb2228a6542886cd8c86d6
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:54:37.284872  /lava-274857/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63eb2228a6542886cd8c86d7
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T05:54:37.287961  <8>[   26.653228] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-14T05:54:38.341485  /lava-274857/1/../bin/lava-test-case
    2023-02-14T05:54:38.341784  <8>[   27.673382] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-14T05:54:38.341942  /lava-274857/1/../bin/lava-test-case
    2023-02-14T05:54:38.342086  <8>[   27.690870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-14T05:54:38.342231  /lava-274857/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb286adac966af2c8c8835

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb286adac966af2c8c8=
836
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63eb28cfdd301697d08c864c

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb28cfdd301697d08c8653
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:22:50.267074  / # #
    2023-02-14T06:22:50.369037  export SHELL=3D/bin/sh
    2023-02-14T06:22:50.369541  #
    2023-02-14T06:22:50.470967  / # export SHELL=3D/bin/sh. /lava-274915/en=
vironment
    2023-02-14T06:22:50.471445  =

    2023-02-14T06:22:50.572961  / # . /lava-274915/environment/lava-274915/=
bin/lava-test-runner /lava-274915/1
    2023-02-14T06:22:50.573854  =

    2023-02-14T06:22:50.579228  / # /lava-274915/bin/lava-test-runner /lava=
-274915/1
    2023-02-14T06:22:50.700200  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T06:22:50.700533  + <8>[   22.558674] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 274915_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63eb28cfdd301697d08c8657
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:22:52.794321  /lava-274915/1/../bin/lava-test-case
    2023-02-14T06:22:52.794708  <8>[   24.664725] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-14T06:22:52.794954  /lava-274915/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
eb28cfdd301697d08c8659
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:22:53.849030  /lava-274915/1/../bin/lava-test-case
    2023-02-14T06:22:53.849411  <8>[   25.701321] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-14T06:22:53.849681  /lava-274915/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63eb28cfdd301697d08c865e
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:22:54.925504  /lava-274915/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63eb28cfdd301697d08c865f
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:22:54.928712  <8>[   26.811593] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-14T06:22:55.985409  /lava-274915/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63eb29bd098deac1bd8c8659

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb29bd098deac1bd8c8660
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:26:39.051739  / # #
    2023-02-14T06:26:39.157014  export SHELL=3D/bin/sh
    2023-02-14T06:26:39.157505  #
    2023-02-14T06:26:39.258936  / # export SHELL=3D/bin/sh. /lava-274921/en=
vironment
    2023-02-14T06:26:39.259659  =

    2023-02-14T06:26:39.361204  / # . /lava-274921/environment/lava-274921/=
bin/lava-test-runner /lava-274921/1
    2023-02-14T06:26:39.361873  =

    2023-02-14T06:26:39.379036  / # /lava-274921/bin/lava-test-runner /lava=
-274921/1
    2023-02-14T06:26:39.436931  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T06:26:39.437299  + <8>[  105.685339] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 274921_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63eb29bd098deac1bd8c8664
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:26:41.531064  /lava-274921/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
eb29bd098deac1bd8c8666
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:26:42.587481  /lava-274921/1/../bin/lava-test-case
    2023-02-14T06:26:42.587874  <8>[  108.828800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63eb29bd098deac1bd8c866b
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:26:43.663232  /lava-274921/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63eb29bd098deac1bd8c866c
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:26:43.666459  <8>[  109.939594] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-14T06:26:44.723215  /lava-274921/1/../bin/lava-test-case
    2023-02-14T06:26:44.723610  <8>[  110.960813] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-14T06:26:44.723864  /lava-274921/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/63eb2a4b9860ea13698c8642

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb2a4b9860ea13698c8649
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:28:58.765525  / # #
    2023-02-14T06:28:58.867563  export SHELL=3D/bin/sh
    2023-02-14T06:28:58.868227  #
    2023-02-14T06:28:58.969642  / # export SHELL=3D/bin/sh. /lava-274931/en=
vironment
    2023-02-14T06:28:58.970129  =

    2023-02-14T06:28:59.071708  / # . /lava-274931/environment/lava-274931/=
bin/lava-test-runner /lava-274931/1
    2023-02-14T06:28:59.072566  =

    2023-02-14T06:28:59.077676  / # /lava-274931/bin/lava-test-runner /lava=
-274931/1
    2023-02-14T06:28:59.147674  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T06:28:59.147989  + <8>[   22.508720] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 274931_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63eb2a4b9860ea13698c864d
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:29:01.240809  /lava-274931/1/../bin/lava-test-case
    2023-02-14T06:29:01.241189  <8>[   24.613395] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-14T06:29:01.241441  /lava-274931/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
eb2a4b9860ea13698c864f
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:29:02.298618  /lava-274931/1/../bin/lava-test-case
    2023-02-14T06:29:02.298958  <8>[   25.652272] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-14T06:29:02.299141  /lava-274931/1/../bin/lava-test-case
    2023-02-14T06:29:02.299326  <8>[   25.669267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63eb2a4b9860ea13698c8654
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:29:03.372994  /lava-274931/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63eb2a4b9860ea13698c8655
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207)

    2023-02-14T06:29:03.376183  <8>[   26.761748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-14T06:29:04.428670  /lava-274931/1/../bin/lava-test-case
    2023-02-14T06:29:04.429034  <8>[   27.782965] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-14T06:29:04.429287  /lava-274931/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63eb1e3f795e2235838c862f

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63eb1e3f795e2235838c8640
        failing since 25 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-14T05:37:46.653647  /lava-274807/1/../bin/lava-test-case
    2023-02-14T05:37:46.656122  <8>[   17.733459] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
b1e3f795e2235838c8642
        failing since 25 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-14T05:37:48.689180  /lava-274807/1/../bin/lava-test-case
    2023-02-14T05:37:48.689502  <8>[   19.807168] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63eb1ea39e771099ce8c862f

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63eb1ea39e771099ce8c8640
        failing since 25 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-14T05:39:38.377510  /lava-274817/1/../bin/lava-test-case
    2023-02-14T05:39:38.380707  <8>[   17.586273] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
b1ea39e771099ce8c8642
        failing since 25 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-14T05:39:40.382766  /lava-274817/1/../bin/lava-test-case
    2023-02-14T05:39:40.383150  <8>[   19.660263] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-14T05:39:40.383393  /lava-274817/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63eb2214def9fe0e778c8662

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63eb2214def9fe0e778c8673
        failing since 25 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-14T05:54:09.417044  /lava-274855/1/../bin/lava-test-case
    2023-02-14T05:54:09.419975  <8>[   17.692281] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
b2214def9fe0e778c8675
        failing since 25 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-14T05:54:11.422247  /lava-274855/1/../bin/lava-test-case
    2023-02-14T05:54:11.422645  <8>[   19.766430] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2958dd0bdedf0b8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2958dd0bdedf0b8c8=
630
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1cb1418b24c12b8c8634

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1cb1418b24c12b8c863d
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T05:31:20.641840  / # #
    2023-02-14T05:31:20.743423  export SHELL=3D/bin/sh
    2023-02-14T05:31:20.743797  #
    2023-02-14T05:31:20.845059  / # export SHELL=3D/bin/sh. /lava-3336422/e=
nvironment
    2023-02-14T05:31:20.845404  <3>[   18.301632] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:31:20.845557  =

    2023-02-14T05:31:20.946724  / # . /lava-3336422/environment/lava-333642=
2/bin/lava-test-runner /lava-3336422/1
    2023-02-14T05:31:20.947362  =

    2023-02-14T05:31:20.954837  / # /lava-3336422/bin/lava-test-runner /lav=
a-3336422/1
    2023-02-14T05:31:20.986830  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d036e1275a24b8c8640

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1d036e1275a24b8c8649
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T05:32:38.592721  =

    2023-02-14T05:32:38.694198  / # #export SHELL=3D/bin/sh
    2023-02-14T05:32:38.694621  =

    2023-02-14T05:32:38.795992  / # export SHELL=3D/bin/sh. /lava-3336491/e=
nvironment
    2023-02-14T05:32:38.796443  =

    2023-02-14T05:32:38.796682  / # <3>[   18.459789] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:32:38.898048  . /lava-3336491/environment/lava-3336491/bi=
n/lava-test-runner /lava-3336491/1
    2023-02-14T05:32:38.898935  =

    2023-02-14T05:32:38.916085  / # /lava-3336491/bin/lava-test-runner /lav=
a-3336491/1
    2023-02-14T05:32:38.974021  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1fe6f7f8d043048c865b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1fe6f7f8d043048c8664
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T05:45:00.157159  / # #
    2023-02-14T05:45:00.259302  export SHELL=3D/bin/sh
    2023-02-14T05:45:00.259761  #
    2023-02-14T05:45:00.361351  / # export SHELL=3D/bin/sh. /lava-3336731/e=
nvironment
    2023-02-14T05:45:00.361794  =

    2023-02-14T05:45:00.362048  / # <3>[   18.363275] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:45:00.463482  . /lava-3336731/environment/lava-3336731/bi=
n/lava-test-runner /lava-3336731/1
    2023-02-14T05:45:00.464260  =

    2023-02-14T05:45:00.478828  / # /lava-3336731/bin/lava-test-runner /lav=
a-3336731/1
    2023-02-14T05:45:00.538791  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb236ad9ff89ac088c8648

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb236ad9ff89ac088c8651
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T06:00:05.261065  / # #
    2023-02-14T06:00:05.362822  export SHELL=3D/bin/sh
    2023-02-14T06:00:05.363341  #
    2023-02-14T06:00:05.363581  / # <3>[   17.989405] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T06:00:05.464889  export SHELL=3D/bin/sh. /lava-3337123/envir=
onment
    2023-02-14T06:00:05.465365  =

    2023-02-14T06:00:05.566697  / # . /lava-3337123/environment/lava-333712=
3/bin/lava-test-runner /lava-3337123/1
    2023-02-14T06:00:05.567458  =

    2023-02-14T06:00:05.580412  / # /lava-3337123/bin/lava-test-runner /lav=
a-3337123/1
    2023-02-14T06:00:05.718331  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb247001e813ed1d8c865b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb247001e813ed1d8c8664
        failing since 27 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T06:04:12.468757  / ##
    2023-02-14T06:04:12.570539  export SHELL=3D/bin/sh
    2023-02-14T06:04:12.570990   #
    2023-02-14T06:04:12.672310  / # export SHELL=3D/bin/sh. /lava-3337145/e=
nvironment
    2023-02-14T06:04:12.672762  =

    2023-02-14T06:04:12.672992  / # <3>[  102.938167] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T06:04:12.774300  . /lava-3337145/environment/lava-3337145/bi=
n/lava-test-runner /lava-3337145/1
    2023-02-14T06:04:12.775050  =

    2023-02-14T06:04:12.786708  / # /lava-3337145/bin/lava-test-runner /lav=
a-3337145/1
    2023-02-14T06:04:12.852457  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24bf5d3833e4788c867e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb24bf5d3833e4788c8687
        failing since 27 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T06:05:39.788956  / # #
    2023-02-14T06:05:39.890857  export SHELL=3D/bin/sh
    2023-02-14T06:05:39.891380  #
    2023-02-14T06:05:39.992775  / # export SHELL=3D/bin/sh. /lava-3337171/e=
nvironment
    2023-02-14T06:05:39.993232  <3>[   18.403448] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T06:05:39.993495  =

    2023-02-14T06:05:40.094881  / # . /lava-3337171/environment/lava-333717=
1/bin/lava-test-runner /lava-3337171/1
    2023-02-14T06:05:40.095700  =

    2023-02-14T06:05:40.102102  / # /lava-3337171/bin/lava-test-runner /lav=
a-3337171/1
    2023-02-14T06:05:40.173135  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb268a6cafef72aa8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb268a6cafef72aa8c8=
646
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb277a80c6fbde2d8c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb277a80c6fbde2d8c8=
63d
        failing since 20 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24f3fa231cba118c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb24f3fa231cba118c8=
681
        failing since 20 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1cd5e6fb249d9e8c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1cd5e6fb249d9e8c8646
        failing since 26 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-14T05:31:55.326833  / # #
    2023-02-14T05:31:55.428963  export SHELL=3D/bin/sh
    2023-02-14T05:31:55.429487  #
    2023-02-14T05:31:55.530976  / # export SHELL=3D/bin/sh. /lava-3336405/e=
nvironment
    2023-02-14T05:31:55.531451  =

    2023-02-14T05:31:55.632983  / # . /lava-3336405/environment/lava-333640=
5/bin/lava-test-runner /lava-3336405/1
    2023-02-14T05:31:55.633817  =

    2023-02-14T05:31:55.652059  / # /lava-3336405/bin/lava-test-runner /lav=
a-3336405/1
    2023-02-14T05:31:55.715891  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T05:31:55.716493  + cd /lava-3336405/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d567555bd0f148c86af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1d567555bd0f148c86b8
        failing since 26 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-14T05:33:42.175432  + set +x<8>[   18.037609] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3336485_1.5.2.4.1>
    2023-02-14T05:33:42.280556  / # #
    2023-02-14T05:33:42.382538  export SHELL=3D/bin/sh
    2023-02-14T05:33:42.383096  <3>[   18.116080] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:33:42.383336  #
    2023-02-14T05:33:42.484528  / # export SHELL=3D/bin/sh. /lava-3336485/e=
nvironment
    2023-02-14T05:33:42.485055  =

    2023-02-14T05:33:42.586462  / # . /lava-3336485/environment/lava-333648=
5/bin/lava-test-runner /lava-3336485/1
    2023-02-14T05:33:42.587546  =

    2023-02-14T05:33:42.599934  / # /lava-3336485/bin/lava-test-runner /lav=
a-3336485/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb207cdb3c3e999e8c86aa

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb207cdb3c3e999e8c86b3
        failing since 26 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-14T05:47:19.603572  / # #
    2023-02-14T05:47:19.705587  export SHELL=3D/bin/sh
    2023-02-14T05:47:19.706185  #
    2023-02-14T05:47:19.807571  / # export SHELL=3D/bin/sh. /lava-3336718/e=
nvironment
    2023-02-14T05:47:19.808171  =

    2023-02-14T05:47:19.909596  / # . /lava-3336718/environment/lava-333671=
8/bin/lava-test-runner /lava-3336718/1
    2023-02-14T05:47:19.910384  =

    2023-02-14T05:47:19.914735  / # /lava-3336718/bin/lava-test-runner /lav=
a-3336718/1
    2023-02-14T05:47:19.990694  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T05:47:19.991241  + cd /lava-3336718/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24eafa231cba118c8664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb24eafa231cba118c8=
665
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb25588cfe9592e68c865a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb25588cfe9592e68c8663
        failing since 26 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-14T06:08:11.888429  / # #
    2023-02-14T06:08:11.990814  export SHELL=3D/bin/sh
    2023-02-14T06:08:11.991506  #
    2023-02-14T06:08:12.092890  / # export SHELL=3D/bin/sh. /lava-3337105/e=
nvironment
    2023-02-14T06:08:12.093411  =

    2023-02-14T06:08:12.194802  / # . /lava-3337105/environment/lava-333710=
5/bin/lava-test-runner /lava-3337105/1
    2023-02-14T06:08:12.195501  =

    2023-02-14T06:08:12.213394  / # /lava-3337105/bin/lava-test-runner /lav=
a-3337105/1
    2023-02-14T06:08:12.325520  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T06:08:12.360289  + cd /lava-3337105/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb25e2fb077bf01d8c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb25e2fb077bf01d8c863b
        failing since 27 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-14T06:10:26.722336  + set +x<8>[   34.733807] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3337132_1.5.2.4.1>
    2023-02-14T06:10:26.722598  =

    2023-02-14T06:10:26.827944  / # #
    2023-02-14T06:10:26.929879  export SHELL=3D/bin/sh
    2023-02-14T06:10:26.930398  <3>[   34.810035] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T06:10:26.930643  #
    2023-02-14T06:10:27.032006  / # export SHELL=3D/bin/sh. /lava-3337132/e=
nvironment
    2023-02-14T06:10:27.032559  =

    2023-02-14T06:10:27.133988  / # . /lava-3337132/environment/lava-333713=
2/bin/lava-test-runner /lava-3337132/1
    2023-02-14T06:10:27.134784   =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb265d0521e1dfa48c864b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb265d0521e1dfa48c8654
        failing since 27 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-14T06:12:35.071894  / # #
    2023-02-14T06:12:35.173773  export SHELL=3D/bin/sh
    2023-02-14T06:12:35.174285  #
    2023-02-14T06:12:35.275648  / # export SHELL=3D/bin/sh. /lava-3337194/e=
nvironment
    2023-02-14T06:12:35.276135  =

    2023-02-14T06:12:35.377596  / # . /lava-3337194/environment/lava-333719=
4/bin/lava-test-runner /lava-3337194/1
    2023-02-14T06:12:35.378306  =

    2023-02-14T06:12:35.383244  / # /lava-3337194/bin/lava-test-runner /lav=
a-3337194/1
    2023-02-14T06:12:35.458138  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T06:12:35.458666  + cd /lava-3337194/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb215563e7bc7aab8c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb215563e7bc7aab8c8=
643
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb235e89e84817938c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb235e89e84817938c8=
661
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb285580b59b3b408c86ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb285580b59b3b408c8=
6ac
        failing since 6 days (last pass: next-20230203, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb251e35589bb2838c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb251e35589bb2838c8=
64a
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2d84f089a9b79f8c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2d84f089a9b79f8c8=
646
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb23b23472b4f15d8c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb23b23472b4f15d8c8=
63c
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2bfba81fcc37338c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2bfba81fcc37338c8=
639
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24227a02079fe98c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb24227a02079fe98c8=
633
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb3a012252749b238c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb3a012252749b238c8=
64c
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1cb32a72d924448c8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1cb32a72d924448c865b
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T05:31:22.611948  <8>[   17.835061] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3336444_1.5.2.4.1>
    2023-02-14T05:31:22.715836  / # #
    2023-02-14T05:31:22.818203  export SHELL=3D/bin/sh
    2023-02-14T05:31:22.818660  #
    2023-02-14T05:31:22.919966  / # export SHELL=3D/bin/sh. /lava-3336444/e=
nvironment
    2023-02-14T05:31:22.920421  =

    2023-02-14T05:31:22.920646  / # <3>[   18.077079] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:31:23.021973  . /lava-3336444/environment/lava-3336444/bi=
n/lava-test-runner /lava-3336444/1
    2023-02-14T05:31:23.022707  =

    2023-02-14T05:31:23.040553  / # /lava-3336444/bin/lava-test-runner /lav=
a-3336444/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d016e1275a24b8c8635

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1d016e1275a24b8c863e
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T05:32:39.883948  / # #
    2023-02-14T05:32:39.985728  export SHELL=3D/bin/sh
    2023-02-14T05:32:39.986149  #
    2023-02-14T05:32:40.087499  / # export SHELL=3D/bin/sh. /lava-3336468/e=
nvironment
    2023-02-14T05:32:40.087818  =

    2023-02-14T05:32:40.087963  / # <3>[   18.133293] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:32:40.189064  . /lava-3336468/environment/lava-3336468/bi=
n/lava-test-runner /lava-3336468/1
    2023-02-14T05:32:40.189542  =

    2023-02-14T05:32:40.193553  / # /lava-3336468/bin/lava-test-runner /lav=
a-3336468/1
    2023-02-14T05:32:40.265533  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1ffad85b6ad8118c867e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1ffad85b6ad8118c8687
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T05:45:11.178291  =

    2023-02-14T05:45:11.280907  / # #
    2023-02-14T05:45:11.382746  export SHELL=3D/bin/sh
    2023-02-14T05:45:11.383534  #
    2023-02-14T05:45:11.485332  / # export SHELL=3D/bin/sh. /lava-3336724/e=
nvironment
    2023-02-14T05:45:11.485762  =

    2023-02-14T05:45:11.485989  / # <3>[   18.263497] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:45:11.587327  . /lava-3336724/environment/lava-3336724/bi=
n/lava-test-runner /lava-3336724/1
    2023-02-14T05:45:11.588027  =

    2023-02-14T05:45:11.594004  / # /lava-3336724/bin/lava-test-runner /lav=
a-3336724/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb213a476ba0b0608c865b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb213a476ba0b0608c8663
        failing since 27 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T05:50:40.669034  / # #
    2023-02-14T05:50:40.770926  export SHELL=3D/bin/sh
    2023-02-14T05:50:40.771428  #
    2023-02-14T05:50:40.872766  / # export SHELL=3D/bin/sh. /lava-3336894/e=
nvironment
    2023-02-14T05:50:40.873286  =

    2023-02-14T05:50:40.873597  / # . /lava-3336894/environment<3>[   18.06=
5258] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T05:50:40.974975  /lava-3336894/bin/lava-test-runner /lava-33=
36894/1
    2023-02-14T05:50:40.975831  =

    2023-02-14T05:50:40.980335  / # /lava-3336894/bin/lava-test-runner /lav=
a-3336894/1
    2023-02-14T05:50:41.054246  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb237e01b94baeb68c8658

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb237e01b94baeb68c8661
        failing since 26 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T06:00:06.882847  / # #
    2023-02-14T06:00:06.984321  export SHELL=3D/bin/sh
    2023-02-14T06:00:06.984668  #
    2023-02-14T06:00:06.984824  / # export SHELL=3D/bin/sh<3>[   17.936779]=
 brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T06:00:07.085947  . /lava-3337119/environment
    2023-02-14T06:00:07.086346  =

    2023-02-14T06:00:07.187726  / # . /lava-3337119/environment/lava-333711=
9/bin/lava-test-runner /lava-3337119/1
    2023-02-14T06:00:07.188420  =

    2023-02-14T06:00:07.200590  / # /lava-3337119/bin/lava-test-runner /lav=
a-3337119/1
    2023-02-14T06:00:07.319452  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb246e2f9ce71a308c864c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb246e2f9ce71a308c8655
        failing since 27 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T06:04:13.060931  / # #
    2023-02-14T06:04:13.162416  export SHELL=3D/bin/sh
    2023-02-14T06:04:13.162791  #
    2023-02-14T06:04:13.264001  / # export SHELL=3D/bin/sh. /lava-3337138/e=
nvironment
    2023-02-14T06:04:13.264359  =

    2023-02-14T06:04:13.264540  / # <3>[  102.032490] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T06:04:13.365677  . /lava-3337138/environment/lava-3337138/bi=
n/lava-test-runner /lava-3337138/1
    2023-02-14T06:04:13.366374  =

    2023-02-14T06:04:13.381423  / # /lava-3337138/bin/lava-test-runner /lav=
a-3337138/1
    2023-02-14T06:04:13.441451  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24be6773b51afa8c8652

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb24be6773b51afa8c865b
        failing since 27 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-14T06:05:41.315966  / # #
    2023-02-14T06:05:41.417346  export SHELL=3D/bin/sh
    2023-02-14T06:05:41.417686  #
    2023-02-14T06:05:41.518824  / # export SHELL=3D/bin/sh. /lava-3337164/e=
nvironment
    2023-02-14T06:05:41.519241  =

    2023-02-14T06:05:41.519445  / # <3>[   18.253006] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-14T06:05:41.620677  . /lava-3337164/environment/lava-3337164/bi=
n/lava-test-runner /lava-3337164/1
    2023-02-14T06:05:41.621561  =

    2023-02-14T06:05:41.629063  / # /lava-3337164/bin/lava-test-runner /lav=
a-3337164/1
    2023-02-14T06:05:41.671194  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e5fc0ad03ad88c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e5fc0ad03ad88c8=
657
        failing since 20 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb29fd4f9eb6fdd88c8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb29fd4f9eb6fdd88c8=
671
        failing since 17 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb26132220ea030a8c867e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb26132220ea030a8c8=
67f
        failing since 20 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63eb27f1e7863baa848c8639

  Results:     163 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-driver-present: https://kernelci.org/test/c=
ase/id/63eb27f1e7863baa848c8656
        new failure (last pass: next-20230213)

    2023-02-14T06:19:11.967408  /lava-9157048/1/../bin/lava-test-case

    2023-02-14T06:19:11.978038  <8>[   30.359082] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb27f1e7863baa848c86e5
        new failure (last pass: next-20230213)

    2023-02-14T06:18:59.395384  + set +x

    2023-02-14T06:18:59.402081  <8>[   17.783569] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9157048_1.5.2.3.1>

    2023-02-14T06:18:59.507792  / # #

    2023-02-14T06:18:59.608820  export SHELL=3D/bin/sh

    2023-02-14T06:18:59.609013  #

    2023-02-14T06:18:59.709925  / # export SHELL=3D/bin/sh. /lava-9157048/e=
nvironment

    2023-02-14T06:18:59.710124  =


    2023-02-14T06:18:59.811084  / # . /lava-9157048/environment/lava-915704=
8/bin/lava-test-runner /lava-9157048/1

    2023-02-14T06:18:59.811386  =


    2023-02-14T06:18:59.816542  / # /lava-9157048/bin/lava-test-runner /lav=
a-9157048/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e48619ca59e28c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e48619ca59e28c8=
63b
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/63eb224f3aa586a1d28c8658

  Results:     163 PASS, 8 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mtk-thermal-driver-present: https://kernelci.org/test/c=
ase/id/63eb224f3aa586a1d28c8675
        new failure (last pass: next-20230213)

    2023-02-14T05:55:04.120307  /lava-9156649/1/../bin/lava-test-case

    2023-02-14T05:55:04.130086  <8>[   30.290577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmtk-thermal-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb22503aa586a1d28c8704
        new failure (last pass: next-20230213)

    2023-02-14T05:54:51.595078  + set +x

    2023-02-14T05:54:51.601640  <8>[   17.763692] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 9156649_1.5.2.3.1>

    2023-02-14T05:54:51.705985  / # #

    2023-02-14T05:54:51.807041  export SHELL=3D/bin/sh

    2023-02-14T05:54:51.807269  #

    2023-02-14T05:54:51.907932  / # export SHELL=3D/bin/sh. /lava-9156649/e=
nvironment

    2023-02-14T05:54:51.908156  =


    2023-02-14T05:54:52.009055  / # . /lava-9156649/environment/lava-915664=
9/bin/lava-test-runner /lava-9156649/1

    2023-02-14T05:54:52.009367  =


    2023-02-14T05:54:52.014386  / # /lava-9156649/bin/lava-test-runner /lav=
a-9156649/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e8fc0ad03ad88c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e8fc0ad03ad88c8=
65d
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63eb2267acd8f1d7918c863b

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63eb2267acd8f1d7918c86f1
        failing since 12 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-14T05:55:29.628707  /lava-9156592/1/../bin/lava-test-case

    2023-02-14T05:55:29.635511  <8>[   21.988501] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63eb2267acd8f1d7918c86f2
        failing since 12 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-14T05:55:28.609133  /lava-9156592/1/../bin/lava-test-case

    2023-02-14T05:55:28.616174  <8>[   20.968748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63eb2267acd8f1d7918c86f3
        failing since 12 days (last pass: next-20230130, first fail: next-2=
0230202)

    2023-02-14T05:55:26.579482  andles:     0x0

    2023-02-14T05:55:26.579571    rHandle:      0

    2023-02-14T05:55:26.583044    V:            0

    2023-02-14T05:55:26.583131    Res:          0x0

    2023-02-14T05:55:26.586557  TPM2_CC_GetTestResult:

    2023-02-14T05:55:26.586646    value: 0x17C

    2023-02-14T05:55:26.589446    commandIndex: 0x17c

    2023-02-14T05:55:26.593028    reserved1:    0x0

    2023-02-14T05:55:26.593136    nv:           0

    2023-02-14T05:55:26.595865    extensive:    0
 =

    ... (108 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10     | oxna=
s_v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1e6b40dfb6baa18c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1e6b40dfb6baa18c8=
65e
        failing since 174 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2ea027311b4d498c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2ea027311b4d498c8=
652
        failing since 5 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb37bf252929a51a8c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb37bf252929a51a8c8=
63a
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2127a555d946288c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2127a555d946288c8=
631
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb21298414ffadeb8c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb21298414ffadeb8c8=
634
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb28d26932845d7d8c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb28d26932845d7d8c8=
655
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb28fab4e98c369d8c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb28fab4e98c369d8c8=
644
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2070b2e958794e8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2070b2e958794e8c8=
636
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb23fcf9fb558b578c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb23fcf9fb558b578c8=
655
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2c9373237b50508c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2c9373237b50508c8=
648
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1acb71ebebf31a8c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1acb71ebebf31a8c8=
63b
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d645da3bda9dc8c8689

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1d645da3bda9dc8c8=
68a
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1e6fc2376a4e9a8c867c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1e6fc2376a4e9a8c8=
67d
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1ecedf93a9f5ba8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1ecedf93a9f5ba8c8=
636
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e2fc0ad03ad88c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e2fc0ad03ad88c8=
649
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb21c5ffeeaa70be8c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb21c5ffeeaa70be8c8=
635
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb235e89e84817938c8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb235e89e84817938c8=
664
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1c8c4d61a1ff288c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1c8c4d61a1ff288c8=
65e
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20b1b672575dd48c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20b1b672575dd48c8=
638
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2291f26844d0958c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2291f26844d0958c8=
65d
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2309f91016466a8c8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2309f91016466a8c8=
679
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb240d83f6a0c00f8c8691

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb240d83f6a0c00f8c8=
692
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb27576b60fff6538c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb27576b60fff6538c8=
64d
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2a27cc4b161b0d8c86b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2a27cc4b161b0d8c8=
6b8
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2b16c4e5788c3f8c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2b16c4e5788c3f8c8=
644
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1aa8a39d3e07ab8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1aa8a39d3e07ab8c8=
631
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e88619ca59e28c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e88619ca59e28c8=
641
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb22780e9cabf53d8c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb22780e9cabf53d8c8=
65a
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1df3fc512ac4ef8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1df3fc512ac4ef8c8=
630
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e807af74cffd8c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e807af74cffd8c8=
63c
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb222d371b67d9638c8681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb222d371b67d9638c8=
682
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb28bfdd301697d08c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb28bfdd301697d08c8=
642
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb23fd83f6a0c00f8c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb23fd83f6a0c00f8c8=
681
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2ca776db8e2a1f8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2ca776db8e2a1f8c8=
630
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1aa5e3ee7641f58c86c0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1aa5e3ee7641f58c8=
6c1
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d773dba9912858c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1d773dba9912858c8=
647
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1e7dde6b6f51fd8c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1e7dde6b6f51fd8c8=
64d
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1ef68e08e5554a8c8696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1ef68e08e5554a8c8=
697
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e0295c9c196d8c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e0295c9c196d8c8=
649
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb21d77957eb85c78c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb21d77957eb85c78c8=
64f
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb235d81a7c667f98c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb235d81a7c667f98c8=
645
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1c64a541b3c33e8c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1c64a541b3c33e8c8=
649
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20c5fc0ad03ad88c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20c5fc0ad03ad88c8=
630
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb22a5dbdd16f3548c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb22a5dbdd16f3548c8=
631
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb22ba51fc8ff77c8c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb22ba51fc8ff77c8c8=
635
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb240eedb964d1408c866e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb240eedb964d1408c8=
66f
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb27566b60fff6538c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb27566b60fff6538c8=
647
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2a28c6d3337e118c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2a28c6d3337e118c8=
630
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2b024a217fb4858c86bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2b024a217fb4858c8=
6bc
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1aa7e3ee7641f58c86cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1aa7e3ee7641f58c8=
6cc
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d7745865064998c8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1d7745865064998c8=
664
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1f1dea78d40d4a8c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1f1dea78d40d4a8c8=
66a
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20fc1f5143a5fe8c867e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20fc1f5143a5fe8c8=
67f
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1df56d6e38d2368c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1df56d6e38d2368c8=
64e
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e7fc0ad03ad88c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-baylibre/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e7fc0ad03ad88c8=
65a
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2241371b67d9638c86b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2241371b67d9638c8=
6b2
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb28beb4ae4d518a8c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb28beb4ae4d518a8c8=
64f
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d63b678cb85c88c869f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.7)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1d63b678cb85c88c8=
6a0
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1db3638bbfbefb8c8673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1db3638bbfbefb8c8=
674
        failing since 0 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2803f796a85cfe8c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2803f796a85cfe8c8=
654
        failing since 1 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1c86f47654ae7e8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1c86f47654ae7e8c8=
640
        failing since 0 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1d4f288c9680978c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1d4f288c9680978c8=
630
        failing since 0 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2033cb068aa1de8c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2033cb068aa1de8c8=
64f
        failing since 0 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20d34d98e735a18c8645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20d34d98e735a18c8=
646
        failing since 0 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb235389e84817938c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb235389e84817938c8=
636
        failing since 0 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2407f9fb558b578c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2407f9fb558b578c8=
65a
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24bbc0d220c29d8c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb24bbc0d220c29d8c8=
63e
        failing since 0 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb256ef52fa7cb808c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb256ef52fa7cb808c8=
634
        failing since 1 day (last pass: next-20230210, first fail: next-202=
30213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb25e7ef999ac4748c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb25e7ef999ac4748c8=
630
        new failure (last pass: next-20230210) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20b12166dca8d08c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20b12166dca8d08c8=
661
        failing since 83 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1e09fc512ac4ef8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1e09fc512ac4ef8c8=
647
        failing since 83 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/63eb255d26b964b0588c865d

  Results:     73 PASS, 14 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensorhub-driver-present: https://kernelci.org/=
test/case/id/63eb255d26b964b0588c86a3
        new failure (last pass: next-20230213)

    2023-02-14T06:07:55.207114  /lava-9156935/1/../bin/lava-test-case

    2023-02-14T06:07:55.220506  <8>[   70.963368] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dblocked>

    2023-02-14T06:07:56.235817  /lava-9156935/1/../bin/lava-test-case

    2023-02-14T06:07:56.248882  <8>[   71.990605] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dblocked>

    2023-02-14T06:07:57.266769  /lava-9156935/1/../bin/lava-test-case

    2023-02-14T06:07:57.279886  <8>[   73.022915] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dblocked>

    2023-02-14T06:07:58.295346  /lava-9156935/1/../bin/lava-test-case

    2023-02-14T06:07:58.308206  <8>[   74.049742] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensorhub-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/63eb255d26b964b0588c86a4
        new failure (last pass: next-20230213)

    2023-02-14T06:07:53.138050  <8>[   68.882016] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>

    2023-02-14T06:07:54.155817  /lava-9156935/1/../bin/lava-test-case

    2023-02-14T06:07:54.169227  <8>[   69.911776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
3eb255d26b964b0588c86a5
        new failure (last pass: next-20230213)

    2023-02-14T06:07:52.105913  <8>[   67.848890] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-driver-present RESULT=3Dpass>

    2023-02-14T06:07:53.125695  /lava-9156935/1/../bin/lava-test-case
   =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20e9e2e859bb6b8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20e9e2e859bb6b8c8=
630
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1f578db88ddea08c8659

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1f578db88ddea08c8662
        failing since 39 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-02-14T05:42:17.872258  + set +x
    2023-02-14T05:42:17.873833  <8>[   68.271065][  T196] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 398208_1.5.2.4.1>
    2023-02-14T05:42:18.007081  #
    2023-02-14T05:42:18.109549  / # #export SHELL=3D/bin/sh
    2023-02-14T05:42:18.110406  =

    2023-02-14T05:42:18.213110  / # export SHELL=3D/bin/sh. /lava-398208/en=
vironment
    2023-02-14T05:42:18.213588  =

    2023-02-14T05:42:18.316432  / # . /lava-398208/environment/lava-398208/=
bin/lava-test-runner /lava-398208/1
    2023-02-14T05:42:18.317348  =

    2023-02-14T05:42:18.326514  / # /lava-398208/bin/lava-test-runner /lava=
-398208/1 =

    ... (43 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24a565934f8ac28c8740

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb24a565934f8ac28c8=
741
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb23c8f9fb558b578c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb23c8f9fb558b578c8=
631
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20ea07af74cffd8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20ea07af74cffd8c8=
64a
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10     | defc=
onfig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb20fce2e859bb6b8c8654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb20fce2e859bb6b8c8=
655
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230208) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb24a719e046312f8c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb24a719e046312f8c8=
652
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb246101e813ed1d8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb246101e813ed1d8c8=
637
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb2408f9fb558b578c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb2408f9fb558b578c8=
65d
        failing since 6 days (last pass: next-20230206, first fail: next-20=
230207) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb309f6f34544cc98c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb309f6f34544cc98c8=
65e
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb325954c5937efb8c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb325954c5937efb8c8=
650
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb344c0074c010768c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb344c0074c010768c8=
630
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb228dfe2a8029f18c8672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb228dfe2a8029f18c8=
673
        new failure (last pass: next-20230213) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1a02c78dea830a8c8656

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1a02c78dea830a8c865f
        failing since 20 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-02-14T05:19:43.911329  / # #
    2023-02-14T05:19:44.013188  export SHELL=3D/bin/sh
    2023-02-14T05:19:44.013655  #
    2023-02-14T05:19:44.114846  / # export SHELL=3D/bin/sh. /lava-3336285/e=
nvironment
    2023-02-14T05:19:44.115462  =

    2023-02-14T05:19:44.217047  / # . /lava-3336285/environment/lava-333628=
5/bin/lava-test-runner /lava-3336285/1
    2023-02-14T05:19:44.217966  =

    2023-02-14T05:19:44.222444  / # /lava-3336285/bin/lava-test-runner /lav=
a-3336285/1
    2023-02-14T05:19:44.394380  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-14T05:19:44.395042  + cd /lava-3336285/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1faf4e8668b4328c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63eb1faf4e8668b4328c8=
63d
        failing since 82 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63eb1e5a795e2235838c8678

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230211.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63eb1e5a795e2235838c867f
        failing since 39 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-02-14T05:38:11.234286  + set +x
    2023-02-14T05:38:11.256418  <8>[   43.236581][  T170] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 850146_1.5.2.4.1>
    2023-02-14T05:38:11.388958  #
    2023-02-14T05:38:11.491114  / # #export SHELL=3D/bin/sh
    2023-02-14T05:38:11.491585  =

    2023-02-14T05:38:11.593006  / # export SHELL=3D/bin/sh. /lava-850146/en=
vironment
    2023-02-14T05:38:11.593454  =

    2023-02-14T05:38:11.694906  / # . /lava-850146/environment/lava-850146/=
bin/lava-test-runner /lava-850146/1
    2023-02-14T05:38:11.695712  =

    2023-02-14T05:38:11.700291  / # /lava-850146/bin/lava-test-runner /lava=
-850146/1 =

    ... (18 line(s) more)  =

 =20
