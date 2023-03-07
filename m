Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E906AF70F
	for <lists+linux-next@lfdr.de>; Tue,  7 Mar 2023 21:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjCGU7i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Mar 2023 15:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjCGU7h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Mar 2023 15:59:37 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1AF9BE1B
        for <linux-next@vger.kernel.org>; Tue,  7 Mar 2023 12:59:31 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso13071561pjs.3
        for <linux-next@vger.kernel.org>; Tue, 07 Mar 2023 12:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678222771;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PECs8M9UJpgRmfjocfGF1EpnY4dSvGWxVzqUQ1wSlBs=;
        b=eoC2HwZkQpGnLXmmlYYjlfGE3f1Nz54orAJ4wDJ77E4NWn+3cajoYloT+rHR/Zuvan
         jdAlqRCxf95uA/W2ZE7++dk8H4fQN47IggUSDY0yQsCaa9X0PqB8z0CIAy/BMZa/fPCm
         GHl8W/ZCTP1d1MNaevqEaaAYncM6DjimcWD1AgqYysSDl7wFc7LrlmRL7/+Cg3CGjOx7
         n5XjvakJ34HssGt4sbwpKmWp9WTqkSxfCOojAiRuQ3BSVF5CVcvACBbKjPBZh1BnoX5/
         CDRwhAeqTeQWg2+lnoZsapOHda81+o83Zg+Cy17NwWHmhFcbgEcK3oHt1kzZqcJ+Wi13
         Ylug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222771;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PECs8M9UJpgRmfjocfGF1EpnY4dSvGWxVzqUQ1wSlBs=;
        b=biGZECyCZvnsUWZKE65hvgSx6xMWQwt6aDbV4HyNemYNyLeYJssBznUz9TAEUDk3XO
         FtwGTQJU9icZRtpZ2N35FWvmVoMftEgJdHCPWOwUPov9R358AlOYwcUO6jpMudD95Jy3
         fRgv7YU4bdO/037CNlI2Uhb0gs2gRIISmvwsFs48EbUtX8G/wRxG8PaU3e2SKznhDRkZ
         jEnjuzbwjnTApxIJ5bJDvpF8Jl7XcAKDOoLf9H+knkGidthKEKmDUmslhYhFaC51romk
         OTqDTX7BN9hsyfjujAiWFpTeyHNTtp/Rz0IpsNCAw8x+6qh7OyRy7C/ShZ0vSJoxJsuf
         YGtQ==
X-Gm-Message-State: AO0yUKUZmi9gi55pZiHYu+1VJss08q8s/GIjrpPhOMKfIV6rwxUH01BN
        bGsAKSyjRBeFvtZl7EItYMcond8EYjmx7CDKEOXgYnqa
X-Google-Smtp-Source: AK7set86B2MQUzuFRkqcxvq/fLDr9i1/+J/UNgSq8UGpDMJOMfu9d1DU0gwCvz2vwPJ2184ZxkeL0A==
X-Received: by 2002:a17:90b:1d0e:b0:234:d42:163e with SMTP id on14-20020a17090b1d0e00b002340d42163emr16164788pjb.28.1678222769505;
        Tue, 07 Mar 2023 12:59:29 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090a2a8e00b0023739b104f8sm7705514pjd.50.2023.03.07.12.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:59:28 -0800 (PST)
Message-ID: <6407a5b0.170a0220.6b794.e0f7@mx.google.com>
Date:   Tue, 07 Mar 2023 12:59:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc1-156-g1bb628591feb
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 720 runs,
 168 regressions (v6.3-rc1-156-g1bb628591feb)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 720 runs, 168 regressions (v6.3-rc1-156-g1bb62=
8591feb)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =

fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc1-156-g1bb628591feb/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc1-156-g1bb628591feb
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1bb628591feba5ffb5ed6dd161bc0458080eae78 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64077edc9643fd6e688c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077edc9643fd6e688c8=
634
        failing since 148 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64078140295bfb10bd8c8682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64078140295bfb10bd8c8=
683
        failing since 146 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e75088d811e2a8c8661

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64076e75088d811=
e2a8c8664
        new failure (last pass: v6.2-13684-gf93c476d9769)
        3 lines

    2023-03-07T17:03:33.826443  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-07T17:03:33.833194  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-07T17:03:33.839734  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-07T17:03:33.846757  <8>[   14.835111] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/640769479e6dc316f18c8659

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640769479e6dc316f18c8662
        failing since 4 days (last pass: v6.2-12625-g13efc3a9f23b, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-03-07T16:41:19.550331  + set +x
    2023-03-07T16:41:19.555102  <8>[   18.615522] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 117108_1.5.2.4.1>
    2023-03-07T16:41:19.688668  / # #
    2023-03-07T16:41:19.790656  export SHELL=3D/bin/sh
    2023-03-07T16:41:19.791118  #
    2023-03-07T16:41:19.892759  / # export SHELL=3D/bin/sh. /lava-117108/en=
vironment
    2023-03-07T16:41:19.893203  =

    2023-03-07T16:41:19.994685  / # . /lava-117108/environment/lava-117108/=
bin/lava-test-runner /lava-117108/1
    2023-03-07T16:41:19.995342  =

    2023-03-07T16:41:20.002949  / # /lava-117108/bin/lava-test-runner /lava=
-117108/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64076b552ed0bfe0c08c867b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076b552ed0bfe0c08c8684
        failing since 55 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-07T16:50:24.858265  / # #

    2023-03-07T16:50:24.960018  export SHELL=3D/bin/sh

    2023-03-07T16:50:24.960598  #

    2023-03-07T16:50:25.062202  / # export SHELL=3D/bin/sh. /lava-9474050/e=
nvironment

    2023-03-07T16:50:25.062738  =


    2023-03-07T16:50:25.164167  / # . /lava-9474050/environment/lava-947405=
0/bin/lava-test-runner /lava-9474050/1

    2023-03-07T16:50:25.165092  =


    2023-03-07T16:50:25.167702  / # /lava-9474050/bin/lava-test-runner /lav=
a-9474050/1

    2023-03-07T16:50:25.291939  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-07T16:50:25.292340  + cd /lava-9474050/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64076dea03d83573b78c8680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076dea03d83573b78c8=
681
        failing since 8 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64076c2c8e539809ad8c86d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076c2c8e539809ad8c8=
6d4
        failing since 44 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64076d820f0f01020c8c8668

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076d820f0f01020c8c8=
669
        new failure (last pass: v6.2-13684-gf93c476d9769) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64076c15262499d7828c872e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076c15262499d7828c8737
        failing since 49 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-07T16:53:19.046393  <8>[   15.175632] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392295_1.5.2.4.1>
    2023-03-07T16:53:19.156474  / # #
    2023-03-07T16:53:19.259966  export SHELL=3D/bin/sh
    2023-03-07T16:53:19.261038  #
    2023-03-07T16:53:19.363223  / # export SHELL=3D/bin/sh. /lava-3392295/e=
nvironment
    2023-03-07T16:53:19.364091  =

    2023-03-07T16:53:19.466105  / # . /lava-3392295/environment/lava-339229=
5/bin/lava-test-runner /lava-3392295/1
    2023-03-07T16:53:19.467531  =

    2023-03-07T16:53:19.467954  / # /lava-3<3>[   15.561144] Bluetooth: hci=
0: command 0x0c03 tx timeout
    2023-03-07T16:53:19.473387  392295/bin/lava-test-runner /lava-3392295/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64076c94749ad976528c868b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076c94749ad976528c8694
        failing since 49 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-07T16:55:30.371765  + set +x<8>[   14.794394] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3392333_1.5.2.4.1>
    2023-03-07T16:55:30.372067  =

    2023-03-07T16:55:30.479013  / # #
    2023-03-07T16:55:30.580546  export SHELL=3D/bin/sh
    2023-03-07T16:55:30.581060  #
    2023-03-07T16:55:30.682357  / # export SHELL=3D/bin/sh. /lava-3392333/e=
nvironment
    2023-03-07T16:55:30.682710  =

    2023-03-07T16:55:30.783877  / # . /lava-3392333/environment/lava-339233=
3/bin/lava-test-runner /lava-3392333/1
    2023-03-07T16:55:30.784391  =

    2023-03-07T16:55:30.784522  / # <3>[   15.166621] Bluetooth: hci0: comm=
and 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64076faff324a0d2258c867f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076faff324a0d2258c8688
        failing since 49 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-07T17:08:40.317560  <8>[   16.660015] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392374_1.5.2.4.1>
    2023-03-07T17:08:40.424041  / # #
    2023-03-07T17:08:40.525561  export SHELL=3D/bin/sh
    2023-03-07T17:08:40.525965  #
    2023-03-07T17:08:40.627169  / # export SHELL=3D/bin/sh. /lava-3392374/e=
nvironment
    2023-03-07T17:08:40.627517  =

    2023-03-07T17:08:40.728744  / # . /lava-3392374/environment/lava-339237=
4/bin/lava-test-runner /lava-3392374/1
    2023-03-07T17:08:40.729378  =

    2023-03-07T17:08:40.734382  / # /lava-3392374/bin/lava-test-runner /lav=
a-3392374/1
    2023-03-07T17:08:40.814157  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6407702892e053da078c86a4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407702892e053da078c86ad
        failing since 49 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-07T17:10:55.666073  <8>[   14.997607] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392381_1.5.2.4.1>
    2023-03-07T17:10:55.773679  / # #
    2023-03-07T17:10:55.875432  export SHELL=3D/bin/sh
    2023-03-07T17:10:55.875830  #
    2023-03-07T17:10:55.976966  / # export SHELL=3D/bin/sh. /lava-3392381/e=
nvironment
    2023-03-07T17:10:55.977320  =

    2023-03-07T17:10:56.078466  / # . /lava-3392381/environment/lava-339238=
1/bin/lava-test-runner /lava-3392381/1
    2023-03-07T17:10:56.079015  =

    2023-03-07T17:10:56.084354  / # /lava-3392381/bin/lava-test-runner /lav=
a-3392381/1
    2023-03-07T17:10:56.179588  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6407763ba6767c14288c884c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407763ba6767c14288c8855
        failing since 49 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-07T17:36:40.631594  <8>[   24.478007] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392617_1.5.2.4.1>
    2023-03-07T17:36:40.763853  / # #
    2023-03-07T17:36:40.867079  export SHELL=3D/bin/sh
    2023-03-07T17:36:40.867972  #
    2023-03-07T17:36:40.970229  / # export SHELL=3D/bin/sh. /lava-3392617/e=
nvironment
    2023-03-07T17:36:40.971750  =

    2023-03-07T17:36:41.075036  / # . /lava-3392617/environment/lava-339261=
7/bin/lava-test-runner /lava-3392617/1
    2023-03-07T17:36:41.076370  =

    2023-03-07T17:36:41.081261  / # /lava-3392617/bin/lava-test-runner /lav=
a-3392617/1
    2023-03-07T17:36:41.167163  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/64076e4649ea2f3fb18c863d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64076e4649ea2f3=
fb18c8640
        failing since 4 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-07T17:02:49.200536  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-07T17:02:49.244396  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-07T17:02:49.245221  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b4d200 pointer offset 4 size 512
    2023-03-07T17:02:49.245935  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-07T17:02:49.246564  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-07T17:02:49.247099  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e6000 allocated at load_module+0x898/0=
x1b10
    2023-03-07T17:02:49.248626  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-07T17:02:49.335729  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-07T17:02:49.336308  kern  :emerg : Process udevd (pid: 63, stac=
k limit =3D 0x9ee0ee53)
    2023-03-07T17:02:49.336716  kern  :emerg : Stack: (0xc88d9cf8 to 0xc88d=
a000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64076e4649ea2f3=
fb18c8641
        failing since 407 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-07T17:02:49.153111  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-07T17:02:49.153889  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-07T17:02:49.154395  kern  :alert : 8<--- cut here ---
    2023-03-07T17:02:49.155152  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-07T17:02:49.155557  kern  :alert : [00000060] *pgd=3Dc09ed831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-07T17:02:49.155989  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-07T17:02:49.196501  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc88d8000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-07T17:02:49.197123  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-07T17:02:49.197522  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-07T17:02:49.197939  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6407776cea66f63c348c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407776cea66f63c348c8=
63f
        new failure (last pass: v6.1-rc5-501-gd09591611a38) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640778fd678e6e10af8c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/ba=
seline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/ba=
seline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640778fd678e6e10af8c8=
645
        new failure (last pass: v6.1-rc5-501-gd09591611a38) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64077cc485f97b919f8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1043=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-nxp/baseline-fsl-ls1043=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077cc485f97b919f8c8=
64a
        new failure (last pass: v6.1-rc5-501-gd09591611a38) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64077f2d3f347211328c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-nxp/baseline-fsl-ls1043a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077f2d3f347211328c8=
65d
        new failure (last pass: v6.1-rc5-501-gd09591611a38) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640774cf21a02ae43f8c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774cf21a02ae43f8c8=
648
        failing since 71 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64076d870f0f01020c8c866b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076d870f0f01020c8c8674
        failing since 36 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-07T16:59:27.253242  + set +x
    2023-03-07T16:59:27.253447  [   12.806526] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917669_1.5.2.3.1>
    2023-03-07T16:59:27.361000  / # #
    2023-03-07T16:59:27.462720  export SHELL=3D/bin/sh
    2023-03-07T16:59:27.463429  #
    2023-03-07T16:59:27.564862  / # export SHELL=3D/bin/sh. /lava-917669/en=
vironment
    2023-03-07T16:59:27.565543  =

    2023-03-07T16:59:27.666972  / # . /lava-917669/environment/lava-917669/=
bin/lava-test-runner /lava-917669/1
    2023-03-07T16:59:27.667711  =

    2023-03-07T16:59:27.671037  / # /lava-917669/bin/lava-test-runner /lava=
-917669/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e3b49ea2f3fb18c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+ima/gcc-10/lab-pengutronix/baseline-=
imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076e3b49ea2f3fb18c8638
        failing since 36 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-07T17:02:29.236271  + set +x
    2023-03-07T17:02:29.236441  [   13.049926] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917679_1.5.2.3.1>
    2023-03-07T17:02:29.344050  / # #
    2023-03-07T17:02:29.445437  export SHELL=3D/bin/sh
    2023-03-07T17:02:29.445778  #
    2023-03-07T17:02:29.546923  / # export SHELL=3D/bin/sh. /lava-917679/en=
vironment
    2023-03-07T17:02:29.547339  =

    2023-03-07T17:02:29.648683  / # . /lava-917679/environment/lava-917679/=
bin/lava-test-runner /lava-917679/1
    2023-03-07T17:02:29.649256  =

    2023-03-07T17:02:29.652329  / # /lava-917679/bin/lava-test-runner /lava=
-917679/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64076fa3dc509eab368c8664

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076fa3dc509eab368c866d
        failing since 36 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-07T17:08:28.904045  + set +x
    2023-03-07T17:08:28.904225  [   12.150760] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917692_1.5.2.3.1>
    2023-03-07T17:08:29.010491  / # #
    2023-03-07T17:08:29.112104  export SHELL=3D/bin/sh
    2023-03-07T17:08:29.112525  #
    2023-03-07T17:08:29.213743  / # export SHELL=3D/bin/sh. /lava-917692/en=
vironment
    2023-03-07T17:08:29.214127  =

    2023-03-07T17:08:29.315339  / # . /lava-917692/environment/lava-917692/=
bin/lava-test-runner /lava-917692/1
    2023-03-07T17:08:29.315877  =

    2023-03-07T17:08:29.319107  / # /lava-917692/bin/lava-test-runner /lava=
-917692/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/640770094938aabf438c8642

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx5=
3-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640770094938aabf438c864b
        failing since 36 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-07T17:10:09.360829  + set +x
    2023-03-07T17:10:09.360999  [   13.007786] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917699_1.5.2.3.1>
    2023-03-07T17:10:09.468363  / # #
    2023-03-07T17:10:09.570002  export SHELL=3D/bin/sh
    2023-03-07T17:10:09.570429  #
    2023-03-07T17:10:09.671686  / # export SHELL=3D/bin/sh. /lava-917699/en=
vironment
    2023-03-07T17:10:09.672072  =

    2023-03-07T17:10:09.773339  / # . /lava-917699/environment/lava-917699/=
bin/lava-test-runner /lava-917699/1
    2023-03-07T17:10:09.773838  =

    2023-03-07T17:10:09.776974  / # /lava-917699/bin/lava-test-runner /lava=
-917699/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/640775bbcb510073f28c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640775bbcb510073f28c8645
        failing since 36 days (last pass: v6.1-rc8-128-gc530a9add07c, first=
 fail: v6.2-rc6-199-g0a49732f057b)

    2023-03-07T17:34:31.877536  + set +x
    2023-03-07T17:34:31.877731  [   16.308844] <LAVA_SIGNAL_ENDRUN 0_dmesg =
917721_1.5.2.3.1>
    2023-03-07T17:34:31.984776  / # #
    2023-03-07T17:34:32.086305  export SHELL=3D/bin/sh
    2023-03-07T17:34:32.086768  #
    2023-03-07T17:34:32.188050  / # export SHELL=3D/bin/sh. /lava-917721/en=
vironment
    2023-03-07T17:34:32.188598  =

    2023-03-07T17:34:32.289808  / # . /lava-917721/environment/lava-917721/=
bin/lava-test-runner /lava-917721/1
    2023-03-07T17:34:32.290335  =

    2023-03-07T17:34:32.293500  / # /lava-917721/bin/lava-test-runner /lava=
-917721/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6407759366d4338d058c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407759366d4338d058c8=
666
        failing since 120 days (last pass: v6.0-rc5-224-g269f27f24a11, firs=
t fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/640775e384237490af8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640775e384237490af8c8638
        new failure (last pass: v6.2-13684-gf93c476d9769)

    2023-03-07T17:35:21.161933  + set[   27.281261] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 917724_1.5.2.3.1>
    2023-03-07T17:35:21.162099   +x
    2023-03-07T17:35:21.274032  / # #
    2023-03-07T17:35:21.375729  export SHELL=3D/bin/sh
    2023-03-07T17:35:21.376299  #
    2023-03-07T17:35:21.479795  / # export SHELL=3D/bin/sh. /lava-917724/en=
vironment
    2023-03-07T17:35:21.480456  =

    2023-03-07T17:35:21.581980  / # . /lava-917724/environment/lava-917724/=
bin/lava-test-runner /lava-917724/1
    2023-03-07T17:35:21.582730  =

    2023-03-07T17:35:21.585494  / # /lava-917724/bin/lava-test-runner /lava=
-917724/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640775436d19ff066d8c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640775436d19ff066d8c8=
64e
        failing since 173 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/640774265d8cef5fba8c86ca

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640774265d8cef5fba8c86d1
        failing since 61 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-07T17:27:39.699050  / # #
    2023-03-07T17:27:40.859078  export SHELL=3D/bin/sh
    2023-03-07T17:27:40.864746  #
    2023-03-07T17:27:42.411911  / # export SHELL=3D/bin/sh. /lava-1166560/e=
nvironment
    2023-03-07T17:27:42.417369  =

    2023-03-07T17:27:45.237785  / # . /lava-1166560/environment/lava-116656=
0/bin/lava-test-runner /lava-1166560/1
    2023-03-07T17:27:45.243851  =

    2023-03-07T17:27:45.252844  / # /lava-1166560/bin/lava-test-runner /lav=
a-1166560/1
    2023-03-07T17:27:45.335709  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:27:45.335968  + cd /lava-1166560/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64077b26d22edf0e1f8c8637

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64077b26d22edf0e1f8c863e
        failing since 61 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-07T17:57:31.229100  + set +x<8>[   67.118501] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 1166562_1.5.2.4.1>
    2023-03-07T17:57:31.229409  =

    2023-03-07T17:57:31.337808  / # #
    2023-03-07T17:57:32.498136  export SHELL=3D/bin/sh
    2023-03-07T17:57:32.503826  #
    2023-03-07T17:57:32.504119  / # export SHELL=3D/bin/sh
    2023-03-07T17:57:34.051960  / # . /lava-1166562/environment
    2023-03-07T17:57:36.879817  /lava-1166562/bin/lava-test-runner /lava-11=
66562/1
    2023-03-07T17:57:36.886064  . /lava-1166562/environment
    2023-03-07T17:57:36.886450  / # /lava-1166562/bin/lava-test-runner /lav=
a-1166562/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407716d582b3dd0ab8c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407716d582b3dd0ab8c8=
64c
        failing since 311 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bc11e1e1752aa8c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-=
visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-=
visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bc11e1e1752aa8c8=
658
        failing since 8 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407716e2553eb9e7d8c867e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407716e2553eb9e7d8c8=
67f
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/64077209439f2f79578c8652

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64077209439f2f79578c8659
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:18:46.712371  / # #
    2023-03-07T17:18:46.814372  export SHELL=3D/bin/sh
    2023-03-07T17:18:46.815037  #
    2023-03-07T17:18:46.916379  / # export SHELL=3D/bin/sh. /lava-288126/en=
vironment
    2023-03-07T17:18:46.916988  =

    2023-03-07T17:18:47.018301  / # . /lava-288126/environment/lava-288126/=
bin/lava-test-runner /lava-288126/1
    2023-03-07T17:18:47.019091  =

    2023-03-07T17:18:47.025630  / # /lava-288126/bin/lava-test-runner /lava=
-288126/1
    2023-03-07T17:18:47.091764  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:18:47.092077  + <8>[   44.195272] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 288126_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64077209439f2f79578c865d
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:18:49.187892  /lava-288126/1/../bin/lava-test-case
    2023-03-07T17:18:49.188281  <8>[   46.303498] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-07T17:18:49.188521  /lava-288126/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
077209439f2f79578c865f
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:18:50.248121  /lava-288126/1/../bin/lava-test-case
    2023-03-07T17:18:50.248497  <8>[   47.340384] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-07T17:18:50.248736  /lava-288126/1/../bin/lava-test-case
    2023-03-07T17:18:50.248959  <8>[   47.358994] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-03-07T17:18:50.249182  /lava-288126/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64077209439f2f79578c8664
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:18:51.324014  /lava-288126/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64077209439f2f79578c8665
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:18:51.327198  <8>[   48.455536] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-07T17:18:52.381739  /lava-288126/1/../bin/lava-test-case
    2023-03-07T17:18:52.382134  <8>[   49.476973] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-07T17:18:52.382377  /lava-288126/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/6407726ae6519746528c8633

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407726ae6519746528c863a
        failing since 13 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-07T17:20:22.943046  <8>[   22.046360] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 288135_1.5.2.4.1>
    2023-03-07T17:20:23.048087  / # #
    2023-03-07T17:20:23.150422  export SHELL=3D/bin/sh
    2023-03-07T17:20:23.150957  #
    2023-03-07T17:20:23.252453  / # export SHELL=3D/bin/sh. /lava-288135/en=
vironment
    2023-03-07T17:20:23.253031  =

    2023-03-07T17:20:23.354403  / # . /lava-288135/environment/lava-288135/=
bin/lava-test-runner /lava-288135/1
    2023-03-07T17:20:23.355247  =

    2023-03-07T17:20:23.374832  / # /lava-288135/bin/lava-test-runner /lava=
-288135/1
    2023-03-07T17:20:23.428804  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6407726ae6519746528c863e
        failing since 13 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-07T17:20:25.524093  /lava-288135/1/../bin/lava-test-case
    2023-03-07T17:20:25.524514  <8>[   24.612347] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-07T17:20:25.524963  /lava-288135/1/../bin/lava-test-case
    2023-03-07T17:20:25.525581  <8>[   24.629838] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
07726ae6519746528c8640
        failing since 13 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-07T17:20:26.576892  /lava-288135/1/../bin/lava-test-case
    2023-03-07T17:20:26.577210  <8>[   25.650381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6407726ae6519746528c8645
        failing since 13 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-07T17:20:27.651898  /lava-288135/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6407726ae6519746528c8646
        failing since 13 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-07T17:20:27.654149  <8>[   26.759624] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-07T17:20:28.707715  /lava-288135/1/../bin/lava-test-case
    2023-03-07T17:20:28.708016  <8>[   27.780734] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-07T17:20:28.708167  /lava-288135/1/../bin/lava-test-case
    2023-03-07T17:20:28.708307  <8>[   27.797951] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-03-07T17:20:28.708447  /lava-288135/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/6407731e50ce47a5c08c8684

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407731e50ce47a5c08c868b
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:22:58.436223  + set +x
    2023-03-07T17:22:58.439376  <8>[   46.217066][  T228] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 288151_1.5.2.4.1>
    2023-03-07T17:22:58.557967  / # #
    2023-03-07T17:22:58.659935  export SHELL=3D/bin/sh
    2023-03-07T17:22:58.660560  #
    2023-03-07T17:22:58.762042  / # export SHELL=3D/bin/sh. /lava-288151/en=
vironment
    2023-03-07T17:22:58.762615  =

    2023-03-07T17:22:58.863875  / # . /lava-288151/environment/lava-288151/=
bin/lava-test-runner /lava-288151/1
    2023-03-07T17:22:58.864440  =

    2023-03-07T17:22:58.871109  / # /lava-288151/bin/lava-test-runner /lava=
-288151/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6407731e50ce47a5c08c868f
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:23:03.174564  /lava-288151/1/../bin/lava-test-case
    2023-03-07T17:23:03.275618  <8>[   51.050695][  T297] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
07731e50ce47a5c08c8691
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:23:04.783554  /lava-288151/1/../bin/lava-test-case
    2023-03-07T17:23:04.888802  <8>[   52.665435][  T307] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6407731e50ce47a5c08c8696
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:23:07.586866  /lava-288151/1/../bin/lava-test-case
    2023-03-07T17:23:07.710532  <8>[   55.487730][  T338] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6407731e50ce47a5c08c8697
        failing since 12 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-6789-g74c3b2e0a611)

    2023-03-07T17:23:08.958283  /lava-288151/1/../bin/lava-test-case
    2023-03-07T17:23:09.074847  <8>[   56.851592][  T344] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640775ee84237490af8c8660

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontr=
on-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640775ee84237490af8c8=
661
        failing since 13 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-3304-g34939120e353) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/640776674bca6648ec8c86eb

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640776674bca6648ec8c86f2
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:37:30.916008  / #
    2023-03-07T17:37:31.018158  # #export SHELL=3D/bin/sh
    2023-03-07T17:37:31.018685  =

    2023-03-07T17:37:31.120032  / # export SHELL=3D/bin/sh. /lava-288172/en=
vironment
    2023-03-07T17:37:31.121107  =

    2023-03-07T17:37:31.222380  / # . /lava-288172/environment/lava-288172/=
bin/lava-test-runner /lava-288172/1
    2023-03-07T17:37:31.223300  =

    2023-03-07T17:37:31.228501  / # /lava-288172/bin/lava-test-runner /lava=
-288172/1
    2023-03-07T17:37:31.295420  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:37:31.295799  + <8>[   22.566252] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 288172_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/640776674bca6648ec8c86f6
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:37:32.358128  <8>[   23.653974] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2023-03-07T17:37:33.392689  /lava-288172/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
0776674bca6648ec8c86f8
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:37:34.452487  /lava-288172/1/../bin/lava-test-case
    2023-03-07T17:37:34.452888  <8>[   25.712632] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-07T17:37:34.453133  /lava-288172/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/640776674bca6648ec8c86fd
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:37:35.527723  /lava-288172/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/640776674bca6648ec8c86fe
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:37:35.530975  <8>[   26.827059] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-07T17:37:36.584246  /lava-288172/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/6407784aa12c04bc318c864b

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407784aa12c04bc318c8652
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:45:30.432395  / # #
    2023-03-07T17:45:30.534238  export SHELL=3D/bin/sh
    2023-03-07T17:45:30.534679  #
    2023-03-07T17:45:30.636028  / # export SHELL=3D/bin/sh. /lava-288196/en=
vironment
    2023-03-07T17:45:30.636500  =

    2023-03-07T17:45:30.737977  / # . /lava-288196/environment/lava-288196/=
bin/lava-test-runner /lava-288196/1
    2023-03-07T17:45:30.738673  =

    2023-03-07T17:45:30.743858  / # /lava-288196/bin/lava-test-runner /lava=
-288196/1
    2023-03-07T17:45:30.810889  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:45:30.811202  + <8>[   22.572048] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 288196_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6407784aa12c04bc318c8656
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:45:32.909067  /lava-288196/1/../bin/lava-test-case
    2023-03-07T17:45:32.909464  <8>[   24.678780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-07T17:45:32.909709  /lava-288196/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
07784aa12c04bc318c8658
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:45:33.965525  /lava-288196/1/../bin/lava-test-case
    2023-03-07T17:45:33.965917  <8>[   25.720115] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-07T17:45:33.966174  /lava-288196/1/../bin/lava-test-case
    2023-03-07T17:45:33.966405  <8>[   25.736555] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-03-07T17:45:33.966633  /lava-288196/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6407784aa12c04bc318c865d
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:45:35.041009  /lava-288196/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6407784aa12c04bc318c865e
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:45:35.044123  <8>[   26.830463] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-07T17:45:36.101645  /lava-288196/1/../bin/lava-test-case
    2023-03-07T17:45:36.102040  <8>[   27.851789] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-07T17:45:36.102280  /lava-288196/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/640771333842317e0b8c8638

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640771333842317e0b8c8641
        failing since 8 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:15:11.469414  / # #
    2023-03-07T17:15:11.570775  export SHELL=3D/bin/sh
    2023-03-07T17:15:11.571106  #
    2023-03-07T17:15:11.672240  / # export SHELL=3D/bin/sh. /lava-3392464/e=
nvironment
    2023-03-07T17:15:11.672563  =

    2023-03-07T17:15:11.672711  / # <3>[  100.127755] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:15:11.773806  . /lava-3392464/environment/lava-3392464/bi=
n/lava-test-runner /lava-3392464/1
    2023-03-07T17:15:11.774312  =

    2023-03-07T17:15:11.786914  / # /lava-3392464/bin/lava-test-runner /lav=
a-3392464/1
    2023-03-07T17:15:11.843655  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407719987a9cc54dc8c8784

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407719987a9cc54dc8c878d
        failing since 11 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:17:05.787011  / ##
    2023-03-07T17:17:05.888860  export SHELL=3D/bin/sh
    2023-03-07T17:17:05.889305   #
    2023-03-07T17:17:05.990718  / # export SHELL=3D/bin/sh. /lava-3392502/e=
nvironment
    2023-03-07T17:17:05.991214  =

    2023-03-07T17:17:05.991465  / # <3>[   18.049808] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:17:06.092824  . /lava-3392502/environment/lava-3392502/bi=
n/lava-test-runner /lava-3392502/1
    2023-03-07T17:17:06.093566  =

    2023-03-07T17:17:06.108858  / # /lava-3392502/bin/lava-test-runner /lav=
a-3392502/1
    2023-03-07T17:17:06.163748  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407747d06d04501b78c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407747d06d04501b78c8=
635
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/640774cd87d81790578c8689

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640774cd87d81790578c8692
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:30:43.132777  <8>[   17.807822] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392634_1.5.2.4.1>
    2023-03-07T17:30:43.236598  / # #
    2023-03-07T17:30:43.338282  export SHELL=3D/bin/sh
    2023-03-07T17:30:43.338655  #
    2023-03-07T17:30:43.440012  / # export SHELL=3D/bin/sh. /lava-3392634/e=
nvironment
    2023-03-07T17:30:43.440742  =

    2023-03-07T17:30:43.441200  / # <3>[   18.049635] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:30:43.542992  . /lava-3392634/environment/lava-3392634/bi=
n/lava-test-runner /lava-3392634/1
    2023-03-07T17:30:43.543880  =

    2023-03-07T17:30:43.587197  / # /lava-3392634/bin/lava-test-runner /lav=
a-3392634/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6407751d49b0a8c3b58c8643

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei=
510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei=
510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407751d49b0a8c3b58c864c
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:32:02.902153  / # #
    2023-03-07T17:32:03.003902  export SHELL=3D/bin/sh
    2023-03-07T17:32:03.004334  #
    2023-03-07T17:32:03.105680  / # export SHELL=3D/bin/sh. /lava-3392668/e=
nvironment
    2023-03-07T17:32:03.106111  =

    2023-03-07T17:32:03.106355  / # <3>[   18.094015] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:32:03.207685  . /lava-3392668/environment/lava-3392668/bi=
n/lava-test-runner /lava-3392668/1
    2023-03-07T17:32:03.208339  =

    2023-03-07T17:32:03.215038  / # /lava-3392668/bin/lava-test-runner /lav=
a-3392668/1
    2023-03-07T17:32:03.278922  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640774ed21a02ae43f8c867a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774ed21a02ae43f8c8=
67b
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64077539cab7ce0b888c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077539cab7ce0b888c8=
633
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407755f72ceaf82738c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407755f72ceaf82738c8=
630
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640775164e79869a188c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-mes=
on-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640775164e79869a188c8=
637
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640774b87c064573a78c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774b87c064573a78c8=
630
        failing since 15 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64077048d80c0afea48c8640

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64077048d80c0afea48c8649
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:11:21.068451  / # #
    2023-03-07T17:11:21.170551  export SHELL=3D/bin/sh
    2023-03-07T17:11:21.171045  #
    2023-03-07T17:11:21.171392  / # export SHELL=3D/bin/sh<3>[   19.143372]=
 mmc0: error -84 whilst initialising SD card
    2023-03-07T17:11:21.272966  . /lava-3392412/environment
    2023-03-07T17:11:21.273441  =

    2023-03-07T17:11:21.374837  / # . /lava-3392412/environment/lava-339241=
2/bin/lava-test-runner /lava-3392412/1
    2023-03-07T17:11:21.375686  =

    2023-03-07T17:11:21.383413  / # /lava-3392412/bin/lava-test-runner /lav=
a-3392412/1
    2023-03-07T17:11:21.450347  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64077111f5be64cf4f8c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64077111f5be64cf4f8c8646
        failing since 8 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:14:30.109180  <8>[   34.930500] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392477_1.5.2.4.1>
    2023-03-07T17:14:30.216511  / # #
    2023-03-07T17:14:30.318684  export SHELL=3D/bin/sh
    2023-03-07T17:14:30.319233  #
    2023-03-07T17:14:30.420808  / # export SHELL=3D/bin/sh. /lava-3392477/e=
nvironment
    2023-03-07T17:14:30.421406  =

    2023-03-07T17:14:30.522856  / # . /lava-3392477/environment/lava-339247=
7/bin/lava-test-runner /lava-3392477/1
    2023-03-07T17:14:30.523737  =

    2023-03-07T17:14:30.541079  / # /lava-3392477/bin/lava-test-runner /lav=
a-3392477/1
    2023-03-07T17:14:30.598965  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640771d1bec02b20c98c8669

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640771d1bec02b20c98c8672
        failing since 11 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:17:27.687103  + set +x<8>[   17.856785] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3392520_1.5.2.4.1>
    2023-03-07T17:17:27.792532  / # #
    2023-03-07T17:17:27.894440  export SHELL=3D/bin/sh
    2023-03-07T17:17:27.895040  <3>[   17.934923] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:17:27.895317  #
    2023-03-07T17:17:27.996552  / # export SHELL=3D/bin/sh. /lava-3392520/e=
nvironment
    2023-03-07T17:17:27.997080  =

    2023-03-07T17:17:28.098481  / # . /lava-3392520/environment/lava-339252=
0/bin/lava-test-runner /lava-3392520/1
    2023-03-07T17:17:28.099292  =

    2023-03-07T17:17:28.110742  / # /lava-3392520/bin/lava-test-runner /lav=
a-3392520/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407748431732509018c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407748431732509018c8=
637
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/640774e787d81790578c86a7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640774e787d81790578c86b0
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:31:04.463468  =

    2023-03-07T17:31:04.566971  / # #
    2023-03-07T17:31:04.668700  export SHELL=3D/bin/sh
    2023-03-07T17:31:04.669072  #
    2023-03-07T17:31:04.770452  / # export SHELL=3D/bin/sh. /lava-3392642/e=
nvironment
    2023-03-07T17:31:04.770837  =

    2023-03-07T17:31:04.872234  / # . /lava-3392642/environment/lava-339264=
2/bin/lava-test-runner /lava-3392642/1
    2023-03-07T17:31:04.872868  =

    2023-03-07T17:31:04.877393  / # /lava-3392642/bin/lava-test-runner /lav=
a-3392642/1
    2023-03-07T17:31:04.949074  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6407754b8408ffc8298c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nan=
opi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nan=
opi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407754b8408ffc8298c864a
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:32:43.188361  + set +x<8>[   18.265876] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3392676_1.5.2.4.1>
    2023-03-07T17:32:43.188611  =

    2023-03-07T17:32:43.293890  / # #
    2023-03-07T17:32:43.395574  export SHELL=3D/bin/sh
    2023-03-07T17:32:43.395929  #
    2023-03-07T17:32:43.497301  / # export SHELL=3D/bin/sh. /lava-3392676/e=
nvironment
    2023-03-07T17:32:43.497656  =

    2023-03-07T17:32:43.599025  / # . /lava-3392676/environment/lava-339267=
6/bin/lava-test-runner /lava-3392676/1
    2023-03-07T17:32:43.599620  =

    2023-03-07T17:32:43.605166  / # /lava-3392676/bin/lava-test-runner /lav=
a-3392676/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407705a9a2f8bce798c8649

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407705a9a2f8bce798c8652
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:11:33.490669  / # #
    2023-03-07T17:11:33.593266  export SHELL=3D/bin/sh
    2023-03-07T17:11:33.593776  #
    2023-03-07T17:11:33.695472  / # export SHELL=3D/bin/sh. /lava-3392419/e=
nvironment
    2023-03-07T17:11:33.696003  =

    2023-03-07T17:11:33.797732  / # . /lava-3392419/environment/lava-339241=
9/bin/lava-test-runner /lava-3392419/1
    2023-03-07T17:11:33.798630  =

    2023-03-07T17:11:33.812966  / # /lava-3392419/bin/lava-test-runner /lav=
a-3392419/1
    2023-03-07T17:11:33.844754  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:11:33.884714  + cd /lava-3392419/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/640771692553eb9e7d8c864e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640771692553eb9e7d8c8657
        failing since 8 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:16:01.412792  / # #
    2023-03-07T17:16:01.514859  export SHELL=3D/bin/sh
    2023-03-07T17:16:01.515541  #
    2023-03-07T17:16:01.617208  / # export SHELL=3D/bin/sh. /lava-3392474/e=
nvironment
    2023-03-07T17:16:01.617890  =

    2023-03-07T17:16:01.719527  / # . /lava-3392474/environment/lava-339247=
4/bin/lava-test-runner /lava-3392474/1
    2023-03-07T17:16:01.720615  =

    2023-03-07T17:16:01.739395  / # /lava-3392474/bin/lava-test-runner /lav=
a-3392474/1
    2023-03-07T17:16:01.803243  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:16:01.803999  + cd /lava-3392474/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640771dc2f4711f1fd8c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640771dc2f4711f1fd8c8638
        failing since 11 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:17:54.625163  / # #
    2023-03-07T17:17:54.726909  export SHELL=3D/bin/sh
    2023-03-07T17:17:54.727256  #
    2023-03-07T17:17:54.828635  / # export SHELL=3D/bin/sh. /lava-3392505/e=
nvironment
    2023-03-07T17:17:54.828983  =

    2023-03-07T17:17:54.930305  / # . /lava-3392505/environment/lava-339250=
5/bin/lava-test-runner /lava-3392505/1
    2023-03-07T17:17:54.930925  =

    2023-03-07T17:17:54.936302  / # /lava-3392505/bin/lava-test-runner /lav=
a-3392505/1
    2023-03-07T17:17:55.017229  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:17:55.017719  + cd /lava-3392505/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64077510c5c1db09df8c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64077510c5c1db09df8c863b
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:31:46.659600  / # #
    2023-03-07T17:31:46.761280  export SHELL=3D/bin/sh
    2023-03-07T17:31:46.761622  #
    2023-03-07T17:31:46.862922  / # export SHELL=3D/bin/sh. /lava-3392646/e=
nvironment
    2023-03-07T17:31:46.863269  =

    2023-03-07T17:31:46.964588  / # . /lava-3392646/environment/lava-339264=
6/bin/lava-test-runner /lava-3392646/1
    2023-03-07T17:31:46.965180  =

    2023-03-07T17:31:46.970984  / # /lava-3392646/bin/lava-test-runner /lav=
a-3392646/1
    2023-03-07T17:31:47.047852  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-07T17:31:47.048329  + cd /lava-3392646/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64077574849a3f59f78c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805=
x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805=
x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64077574849a3f59f78c8639
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:33:31.578901  <8>[   18.182689] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392671_1.5.2.4.1>
    2023-03-07T17:33:31.684291  / # #
    2023-03-07T17:33:31.786052  export SHELL=3D/bin/sh
    2023-03-07T17:33:31.786408  #
    2023-03-07T17:33:31.887772  / # export SHELL=3D/bin/sh. /lava-3392671/e=
nvironment
    2023-03-07T17:33:31.888256  =

    2023-03-07T17:33:31.989637  / # . /lava-3392671/environment/lava-339267=
1/bin/lava-test-runner /lava-3392671/1
    2023-03-07T17:33:31.990388  =

    2023-03-07T17:33:31.995558  / # /lava-3392671/bin/lava-test-runner /lav=
a-3392671/1
    2023-03-07T17:33:32.073440  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407748a06d04501b78c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407748a06d04501b78c8=
63e
        failing since 28 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407748606d04501b78c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407748606d04501b78c8=
63a
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407757b2f49cf92e48c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407757b2f49cf92e48c8=
641
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640774c6132b3231328c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson=
-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774c6132b3231328c8=
63f
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407753274e2639f018c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407753274e2639f018c8=
633
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64077485000577c3b68c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077485000577c3b68c8=
64b
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640775d39ed976d0a68c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640775d39ed976d0a68c8=
65d
        new failure (last pass: v6.2-13684-gf93c476d9769) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64077b885228c7d20b8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077b885228c7d20b8c8=
637
        failing since 36 days (last pass: v6.2-rc5-286-g436294605dc5, first=
 fail: v6.2-rc6-199-g0a49732f057b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64077135cbaf0cfd5e8c8692

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64077135cbaf0cfd5e8c869b
        failing since 8 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:15:13.289626  / # #
    2023-03-07T17:15:13.391100  export SHELL=3D/bin/sh
    2023-03-07T17:15:13.391439  #
    2023-03-07T17:15:13.492559  / # export SHELL=3D/bin/sh. /lava-3392479/e=
nvironment
    2023-03-07T17:15:13.492894  =

    2023-03-07T17:15:13.493049  / # <3>[  100.752344] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:15:13.594142  . /lava-3392479/environment/lava-3392479/bi=
n/lava-test-runner /lava-3392479/1
    2023-03-07T17:15:13.594623  =

    2023-03-07T17:15:13.602797  / # /lava-3392479/bin/lava-test-runner /lav=
a-3392479/1
    2023-03-07T17:15:13.665752  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640771ac4e7c2e7bde8c8667

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640771ac4e7c2e7bde8c8670
        failing since 11 days (last pass: v6.2-6789-g74c3b2e0a611, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:17:07.296902  <8>[   17.789178] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392522_1.5.2.4.1>
    2023-03-07T17:17:07.400393  / # #
    2023-03-07T17:17:07.501813  export SHELL=3D/bin/sh
    2023-03-07T17:17:07.502167  #
    2023-03-07T17:17:07.603383  / # export SHELL=3D/bin/sh. /lava-3392522/e=
nvironment
    2023-03-07T17:17:07.604194  =

    2023-03-07T17:17:07.604634  / # <3>[   18.030189] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:17:07.706048  . /lava-3392522/environment/lava-3392522/bi=
n/lava-test-runner /lava-3392522/1
    2023-03-07T17:17:07.706723  =

    2023-03-07T17:17:07.710716  / # /lava-3392522/bin/lava-test-runner /lav=
a-3392522/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407747e03549eb0af8c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407747e03549eb0af8c8=
641
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/640774cc132b3231328c864e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson=
-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640774cc132b3231328c8657
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:30:45.355340  / # #
    2023-03-07T17:30:45.457001  export SHELL=3D/bin/sh
    2023-03-07T17:30:45.457375  #
    2023-03-07T17:30:45.558668  / # export SHELL=3D/bin/sh. /lava-3392625/e=
nvironment
    2023-03-07T17:30:45.559074  =

    2023-03-07T17:30:45.559301  / # <3>[   18.199736] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:30:45.660620  . /lava-3392625/environment/lava-3392625/bi=
n/lava-test-runner /lava-3392625/1
    2023-03-07T17:30:45.661315  =

    2023-03-07T17:30:45.677327  / # /lava-3392625/bin/lava-test-runner /lav=
a-3392625/1
    2023-03-07T17:30:45.732514  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6407751cc5c1db09df8c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei6=
10.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei6=
10.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6407751cc5c1db09df8c8647
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:32:04.219998  / # #
    2023-03-07T17:32:04.321695  export SHELL=3D/bin/sh
    2023-03-07T17:32:04.322185  #
    2023-03-07T17:32:04.423510  / # export SHELL=3D/bin/sh. /lava-3392665/e=
nvironment
    2023-03-07T17:32:04.423919  =

    2023-03-07T17:32:04.424166  / # <3>[   18.104275] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-07T17:32:04.525363  . /lava-3392665/environment/lava-3392665/bi=
n/lava-test-runner /lava-3392665/1
    2023-03-07T17:32:04.525993  =

    2023-03-07T17:32:04.530044  / # /lava-3392665/bin/lava-test-runner /lav=
a-3392665/1
    2023-03-07T17:32:04.594988  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/640770f17632b7a5418c863d

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/640770f17632b7a5418c86e1
        failing since 8 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:14:07.554079  /lava-9475274/1/../bin/lava-test-case

    2023-03-07T17:14:07.560240  <8>[   21.619224] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/640770f17632b7a5418c86e2
        failing since 8 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:14:05.509304    reserved1:    0x0

    2023-03-07T17:14:05.509405    nv:           0

    2023-03-07T17:14:05.512402    extensive:    0

    2023-03-07T17:14:05.512504    flushed:      0

    2023-03-07T17:14:05.515602    cHandles:     0x0

    2023-03-07T17:14:05.515694    rHandle:      0

    2023-03-07T17:14:05.519394    V:            0

    2023-03-07T17:14:05.519488    Res:          0x0

    2023-03-07T17:14:05.522379  TPM2_CC_PolicyPCR:

    2023-03-07T17:14:05.522468    value: 0x200017F
 =

    ... (81 line(s) more)  =


  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
770f17632b7a5418c86e8
        failing since 13 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-3304-g34939120e353)

    2023-03-07T17:14:10.417787  /lava-9475274/1/../bin/lava-test-case

    2023-03-07T17:14:10.427842  <8>[   24.484164] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/6407748931732509018c863b

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
7748a31732509018c868f
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-07T17:29:24.323462  /lava-9475561/1/../bin/lava-test-case

    2023-03-07T17:29:24.329638  <8>[   24.480463] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/6407748a31732509018c86e1
        failing since 1 day (last pass: v6.2-8700-gab98cc06b683, first fail=
: v6.2-13684-gf93c476d9769)

    2023-03-07T17:29:21.452638  /lava-9475561/1/../bin/lava-test-case

    2023-03-07T17:29:21.462503  <8>[   21.611678] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/6407748a31732509018c86e2
        failing since 1 day (last pass: v6.2-8700-gab98cc06b683, first fail=
: v6.2-13684-gf93c476d9769)

    2023-03-07T17:29:19.402245    nv:           0

    2023-03-07T17:29:19.402343    extensive:    0

    2023-03-07T17:29:19.405847    flushed:      0

    2023-03-07T17:29:19.405946    cHandles:     0x0

    2023-03-07T17:29:19.408959    rHandle:      0

    2023-03-07T17:29:19.409057    V:            0

    2023-03-07T17:29:19.412050    Res:          0x0

    2023-03-07T17:29:19.412149  TPM2_CC_PolicyPCR:

    2023-03-07T17:29:19.415704    value: 0x200017F

    2023-03-07T17:29:19.418727    commandIndex: 0x17f
 =

    ... (80 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/6407711c936fa6ed678c8630

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/basel=
ine-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/6407711d936fa6ed678c86cf
        failing since 8 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:14:35.552882  /lava-9475288/1/../bin/lava-test-case

    2023-03-07T17:14:35.559398  <8>[   22.776248] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/6407711d936fa6ed678c86d0
        failing since 8 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:14:34.533988  /lava-9475288/1/../bin/lava-test-case

    2023-03-07T17:14:34.539901  <8>[   21.756617] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/6407711d936fa6ed678c86d1
        failing since 8 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-07T17:14:32.504861    Res:          0x0

    2023-03-07T17:14:32.505279  TPM2_CC_TestParms:

    2023-03-07T17:14:32.508643    value: 0x18A

    2023-03-07T17:14:32.509138    commandIndex: 0x18a

    2023-03-07T17:14:32.512209    reserved1:    0x0

    2023-03-07T17:14:32.512798    nv:           0

    2023-03-07T17:14:32.514892    extensive:    0

    2023-03-07T17:14:32.515387    flushed:      0

    2023-03-07T17:14:32.519073    cHandles:     0x0

    2023-03-07T17:14:32.519569    rHandle:      0
 =

    ... (50 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/640774dcb2b5b9b9a38c8653

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/640774dcb2b5b9b9a38c870b
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-13370-g5872d227b73f)

    2023-03-07T17:30:35.981583  /lava-9475549/1/../bin/lava-test-case

    2023-03-07T17:30:35.988223  <8>[   22.776559] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/640774dcb2b5b9b9a38c870c
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-13370-g5872d227b73f)

    2023-03-07T17:30:34.962665  /lava-9475549/1/../bin/lava-test-case

    2023-03-07T17:30:34.969233  <8>[   21.757438] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/640774dcb2b5b9b9a38c870d
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-13370-g5872d227b73f)

    2023-03-07T17:30:32.934209    Res:          0x0

    2023-03-07T17:30:32.934658  TPM2_CC_TestParms:

    2023-03-07T17:30:32.937097    value: 0x18A

    2023-03-07T17:30:32.937548    commandIndex: 0x18a

    2023-03-07T17:30:32.940679    reserved1:    0x0

    2023-03-07T17:30:32.941128    nv:           0

    2023-03-07T17:30:32.943623    extensive:    0

    2023-03-07T17:30:32.944086    flushed:      0

    2023-03-07T17:30:32.947540    cHandles:     0x0

    2023-03-07T17:30:32.947989    rHandle:      0
 =

    ... (50 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6407724a05f89ef5a48c869e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid=
-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid=
-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407724a05f89ef5a48c8=
69f
        new failure (last pass: v6.2-13684-gf93c476d9769) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64076c1e882f866df48c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076c1f882f866df48c8=
649
        failing since 146 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640779d26a37cb15f08c8760

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-q=
com-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640779d26a37cb15f08c8=
761
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6407736ed972891fd88c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407736ed972891fd88c8=
630
        failing since 146 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640780a9f78cfd08798c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640780a9f78cfd08798c8=
63c
        failing since 146 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640773320b5201de568c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640773320b5201de568c8=
637
        failing since 146 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640780a8415ee736e18c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640780a8415ee736e18c8=
63d
        failing since 146 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640773106243f3d38d8c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640773106243f3d38d8c8=
64d
        failing since 146 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6407736f54f06ce9908c868c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407736f54f06ce9908c8=
68d
        failing since 146 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640780bc415ee736e18c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640780bc415ee736e18c8=
64e
        failing since 146 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6407731170e363da808c8695

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407731170e363da808c8=
696
        failing since 146 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640773713bd25157b38c867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640773713bd25157b38c8=
67e
        failing since 146 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/640780bd87cf256eb58c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640780bd87cf256eb58c8=
630
        failing since 146 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e3ed2fc0c47688c867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu=
_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e3ed2fc0c47688c8=
680
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e7aae3c3f2da98c867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e7aae3c3f2da98c8=
67e
        failing since 1 day (last pass: v6.2-13370-g5872d227b73f, first fai=
l: v6.2-13684-gf93c476d9769) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64077ba766b571ac8a8c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_=
i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077ba766b571ac8a8c8=
64a
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/64077d0fd63b2cdccc8c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077d0fd63b2cdccc8c8=
63c
        failing since 1 day (last pass: v6.2-13370-g5872d227b73f, first fai=
l: v6.2-13684-gf93c476d9769) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e3606b0df92728c8667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qem=
u_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e3606b0df92728c8=
668
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64076a41d4a4ee93ef8c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076a41d4a4ee93ef8c8=
65e
        failing since 15 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64076ae435b38444fb8c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076ae435b38444fb8c8=
65d
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bd5265b4d69f28c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bd5265b4d69f28c8=
64e
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bfb44708b192e8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bfb44708b192e8c8=
630
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64076d2678f856c31b8c868b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076d2678f856c31b8c8=
68c
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e02a1a1aeee2f8c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e02a1a1aeee2f8c8=
643
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e174d7f6e58238c86a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e174d7f6e58238c8=
6a7
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64076f1b9f93ad009e8c8661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-ba=
ylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-ba=
ylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076f1b9f93ad009e8c8=
662
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e9972e3c3cb078c8697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e9972e3c3cb078c8=
698
        failing since 15 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640771559206552acc8c865d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x8=
6_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x8=
6_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640771559206552acc8c8=
65e
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/6407737205ef778ed18c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407737205ef778ed18c8=
632
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640774b20501f4c9e78c86c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774b20501f4c9e78c8=
6c2
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64077872db4ae8a8528c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077872db4ae8a8528c8=
645
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640779da3413ee27728c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640779da3413ee27728c8=
640
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/64077a2c94e31c1e148c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077a2c94e31c1e148c8=
636
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64077dec65046c574e8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-br=
oonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-br=
oonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077dec65046c574e8c8=
63f
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bca588810fcd98c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bca588810fcd98c8=
630
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64076d328f2d2f915a8c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076d328f2d2f915a8c8=
66c
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64076a4232cea0e3178c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076a4232cea0e3178c8=
65c
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64076ae335b38444fb8c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x=
86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076ae335b38444fb8c8=
65a
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bd425b781ce7e8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bd425b781ce7e8c8=
63f
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bfd262499d7828c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline=
-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bfd262499d7828c8=
630
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64076d279c816cd52a8c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076d279c816cd52a8c8=
65f
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e038ddb10fc918c8644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/=
baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e038ddb10fc918c8=
645
        failing since 15 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/64076e164d7f6e58238c86a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076e164d7f6e58238c8=
6a4
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64076f1afdef6295d58c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-ba=
ylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-ba=
ylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076f1afdef6295d58c8=
648
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64076ee99460c194f18c866b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076ee99460c194f18c8=
66c
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/640771418d5ed69ad08c86bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x8=
6_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x8=
6_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640771418d5ed69ad08c8=
6bc
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/6407735ec3db2914108c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407735ec3db2914108c8=
636
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640774da7c064573a78c8736

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774da7c064573a78c8=
737
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/640778eabbfab6c6c38c86a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640778eabbfab6c6c38c8=
6a5
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/640779dc3413ee27728c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640779dc3413ee27728c8=
643
        failing since 15 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/64077a2b94e31c1e148c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077a2b94e31c1e148c8=
633
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64077daf9422b2d7b68c8642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-br=
oonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-br=
oonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077daf9422b2d7b68c8=
643
        failing since 21 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bb71e1e1752aa8c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bb71e1e1752aa8c8=
652
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/64076bf21637ad23e58c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076bf21637ad23e58c8=
65f
        failing since 15 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64076dfb8ddb10fc918c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64076dfb8ddb10fc918c8=
631
        failing since 15 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407717b87a9cc54dc8c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407717b87a9cc54dc8c8=
642
        failing since 82 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6407706ad80c0afea48c868b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407706ad80c0afea48c8=
68c
        failing since 82 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640774ca87d81790578c8683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399=
-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774ca87d81790578c8=
684
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640774a491caba73398c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3=
399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640774a491caba73398c8=
631
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6407798f3e9443cca48c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6407798f3e9443cca48c8=
63e
        failing since 28 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64077567ed033b385c8c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64077567ed033b385c8c8=
65a
        failing since 27 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64076aa5df46e501be8c863d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64076aa5df46e501be8c8646
        failing since 4 days (last pass: v6.2-12625-g13efc3a9f23b, first fa=
il: v6.2-13370-g5872d227b73f)

    2023-03-07T16:47:10.580690  <8>[    9.862187] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3392283_1.5.2.4.1>
    2023-03-07T16:47:10.699979  / # #
    2023-03-07T16:47:10.805444  export SHELL=3D/bin/sh
    2023-03-07T16:47:10.806957  #
    2023-03-07T16:47:10.910304  / # export SHELL=3D/bin/sh. /lava-3392283/e=
nvironment
    2023-03-07T16:47:10.911821  =

    2023-03-07T16:47:11.015146  / # . /lava-3392283/environment/lava-339228=
3/bin/lava-test-runner /lava-3392283/1
    2023-03-07T16:47:11.017851  =

    2023-03-07T16:47:11.025979  / # /lava-3392283/bin/lava-test-runner /lav=
a-3392283/1
    2023-03-07T16:47:11.174490  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640771323842317e0b8c8635

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc1-15=
6-g1bb628591feb/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230303.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640771323842317e0b8c8=
636
        failing since 82 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
