Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044426A9033
	for <lists+linux-next@lfdr.de>; Fri,  3 Mar 2023 05:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjCCEUl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Mar 2023 23:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCCEUj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Mar 2023 23:20:39 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CAA149AF
        for <linux-next@vger.kernel.org>; Thu,  2 Mar 2023 20:20:34 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id d6so765120pgu.2
        for <linux-next@vger.kernel.org>; Thu, 02 Mar 2023 20:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1677817234;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Og326CFaPRCi8U1OL8mkPaNexwwTMg94Ysr+ZloaD8M=;
        b=CWhBCym6x41fs/OtfjnFtadlbWw/l+SVoZqagPj0Q+FlgTv0MVoh75Cz1knjthz8zu
         RrBr9W+RzxSF6fNsuV15T6HW4CQsN9PqvgseLGI7YUJHMEcoC/f2PKTJuIP6tprxEZ3P
         HPSpf7BGhtSsJW7PkOeFlCHPMVhTew+xF2jG2Lg7TsNZS4l9SumxekVnDfZLZBvd7Hxe
         UUDr3DtcYdRJ06415JvoC2rWKChcauDoFdplXzIpM6MdFbTO6xb6Uph7QY41+WpbZ8Lz
         CzyFvMGobhW42+QlCTRxnXAp3g3QImJ/0OWfbPEfR6zCNuVOwaTJUqY7SkLXQzuyOICJ
         sIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677817234;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og326CFaPRCi8U1OL8mkPaNexwwTMg94Ysr+ZloaD8M=;
        b=wTk3QQDHN7BczwK/hkFRB10BW10GRjSm2Io6LLu6PVtXOpZwl16QhRJ2XVAECyvCXM
         rXAyq8q9GhYh2Onw51OQuLuksezzXjkxe34NKMsj+FTk2icyPz4FEXQgiqwY5X3zmln0
         2ItqQm7+EDn1DtCAsu7viRhZdj/duMVrE4yIGg47uGG0iV8skYEN84qVB5fLf/iMRT/p
         nZ1gtKq3kbffusmNvXEdipMsGqWvwQzapGByrX5K8dnzppzX1C6HPHdrlr0U8MkR2zFO
         fs23+Ot3wbqseth4DMegh561dT0W4ooJbTsR8qKdpcWox961vTtJPuwmLvLkBub7Y7IM
         Fm4g==
X-Gm-Message-State: AO0yUKUJvK9dUOzvzdzfF5ykIYtqb5bY6s7ZiXV1fiuB6UwqvxRlp2aZ
        STVFekxRCv7HxLrn/yXvJL6seSe38LhW3LMrFgk=
X-Google-Smtp-Source: AK7set9unSH1Wfnfkx2W1Y811krGyGQgn+9wAQwKEN2/AajyscLaGPCLhoXGBK7qht/VgH01UGgqmg==
X-Received: by 2002:a62:38d1:0:b0:5a8:2008:d1eb with SMTP id f200-20020a6238d1000000b005a82008d1ebmr806969pfa.17.1677817232505;
        Thu, 02 Mar 2023 20:20:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0058dbd7a5e0esm487666pfo.89.2023.03.02.20.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 20:20:32 -0800 (PST)
Message-ID: <64017590.a70a0220.b847f.1907@mx.google.com>
Date:   Thu, 02 Mar 2023 20:20:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.2-13370-g5872d227b73f
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 781 runs,
 171 regressions (v6.2-13370-g5872d227b73f)
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

next/pending-fixes baseline: 781 runs, 171 regressions (v6.2-13370-g5872d22=
7b73f)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

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
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

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
fig+ima                | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

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
fig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

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
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =

qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-13370-g5872d227b73f/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-13370-g5872d227b73f
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5872d227b73f84aa041522c5c0e0516ffc176c3a =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/640149abf4a0155a838c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/=
baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640149abf4a0155a838c8=
658
        failing since 144 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ef08793c231c48c86a1

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-c=
ollabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64013ef08793c23=
1c48c86a4
        failing since 7 days (last pass: v6.2-3304-g34939120e353, first fai=
l: v6.2-8700-gab98cc06b683)
        3 lines

    2023-03-03T00:27:03.028334  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-03T00:27:03.034954  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-03T00:27:03.041364  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-03T00:27:03.048196  <8>[   14.590782] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cbe5fed06f4fe8c8672

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi=
-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi=
-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013cbe5fed06f4fe8c867b
        new failure (last pass: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:17:44.499937  + set +x
    2023-03-03T00:17:44.503718  <8>[   18.222347] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 86988_1.5.2.4.1>
    2023-03-03T00:17:44.636724  / # #
    2023-03-03T00:17:44.740000  export SHELL=3D/bin/sh
    2023-03-03T00:17:44.742500  #
    2023-03-03T00:17:44.848004  / # export SHELL=3D/bin/sh. /lava-86988/env=
ironment
    2023-03-03T00:17:44.848749  =

    2023-03-03T00:17:44.950682  / # . /lava-86988/environment/lava-86988/bi=
n/lava-test-runner /lava-86988/1
    2023-03-03T00:17:44.951605  =

    2023-03-03T00:17:44.957779  / # /lava-86988/bin/lava-test-runner /lava-=
86988/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64013db10cf8d330368c863c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-r=
pi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013db10cf8d330368c8645
        failing since 50 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-03T00:21:50.635828  / # #

    2023-03-03T00:21:50.737455  export SHELL=3D/bin/sh

    2023-03-03T00:21:50.737928  #

    2023-03-03T00:21:50.839388  / # export SHELL=3D/bin/sh. /lava-9390169/e=
nvironment

    2023-03-03T00:21:50.839787  =


    2023-03-03T00:21:50.941101  / # . /lava-9390169/environment/lava-939016=
9/bin/lava-test-runner /lava-9390169/1

    2023-03-03T00:21:50.941719  =


    2023-03-03T00:21:50.945576  / # /lava-9390169/bin/lava-test-runner /lav=
a-9390169/1

    2023-03-03T00:21:51.069006  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-03T00:21:51.069328  + cd /lava-9390169/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6401406cae4d563cf88c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-co=
llabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401406cae4d563cf88c8=
63a
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64014335ff4b532eed8c86d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014335ff4b532eed8c8=
6d6
        failing since 40 days (last pass: v6.2-rc4-412-g665ddd640630, first=
 fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/64014040f2ad6e910b8c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-x=
m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-x=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014040f2ad6e910b8c8=
65b
        failing since 9 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64013bbcb6e923ac1f8c8667

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/bas=
eline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013bbcb6e923ac1f8c8670
        failing since 44 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-03T00:13:25.922452  <8>[   16.658511] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3379359_1.5.2.4.1>
    2023-03-03T00:13:26.032342  / # #
    2023-03-03T00:13:26.136214  export SHELL=3D/bin/sh
    2023-03-03T00:13:26.137043  #
    2023-03-03T00:13:26.239052  / # export SHELL=3D/bin/sh. /lava-3379359/e=
nvironment
    2023-03-03T00:13:26.239995  =

    2023-03-03T00:13:26.342181  / # . /lava-3379359/environment/lava-337935=
9/bin/lava-test-runner /lava-3379359/1
    2023-03-03T00:13:26.343817  =

    2023-03-03T00:13:26.349986  / # /lava-3379359/bin/lava-test-runner /lav=
a-3379359/1
    2023-03-03T00:13:26.428323  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c6311ed7a68548c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruc=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013c6311ed7a68548c8653
        failing since 44 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-03T00:16:12.468129  <8>[   15.505153] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3379400_1.5.2.4.1>
    2023-03-03T00:16:12.577127  / # #
    2023-03-03T00:16:12.678807  export SHELL=3D/bin/sh
    2023-03-03T00:16:12.679343  #
    2023-03-03T00:16:12.780747  / # export SHELL=3D/bin/sh. /lava-3379400/e=
nvironment
    2023-03-03T00:16:12.781633  =

    2023-03-03T00:16:12.782093  <3>[   15.727821] Bluetooth: hci0: command =
0xfc18 tx timeout
    2023-03-03T00:16:12.884134  / # . /lava-3379400/environment/lava-337940=
0/bin/lava-test-runner /lava-3379400/1
    2023-03-03T00:16:12.885868  =

    2023-03-03T00:16:12.890515  / # /lava-3379400/bin/lava-test-runner /lav=
a-3379400/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e4d5c1f0087b28c86ca

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cubie=
truck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013e4d5c1f0087b28c86d3
        failing since 44 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-03T00:24:28.738611  + set +x<8>[   15.744300] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3379467_1.5.2.4.1>
    2023-03-03T00:24:28.738837  =

    2023-03-03T00:24:28.845520  / # #
    2023-03-03T00:24:28.947162  export SHELL=3D/bin/sh
    2023-03-03T00:24:28.947528  #
    2023-03-03T00:24:29.048654  / # export SHELL=3D/bin/sh. /lava-3379467/e=
nvironment
    2023-03-03T00:24:29.049020  =

    2023-03-03T00:24:29.150370  / # . /lava-3379467/environment/lava-337946=
7/bin/lava-test-runner /lava-3379467/1
    2023-03-03T00:24:29.150984  =

    2023-03-03T00:24:29.151167  / # /lava-3379467/bin/lava-test-runner /lav=
a-3379467/1<3>[   16.127648] Bluetooth: hci0: command 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/640140417cf3514ba48c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-cu=
bietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640140417cf3514ba48c8638
        failing since 44 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-03T00:32:48.841525  + set +x<8>[   24.479617] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3379532_1.5.2.4.1>
    2023-03-03T00:32:48.841783  =

    2023-03-03T00:32:48.949541  / # #
    2023-03-03T00:32:49.051166  export SHELL=3D/bin/sh
    2023-03-03T00:32:49.051589  #
    2023-03-03T00:32:49.152797  / # export SHELL=3D/bin/sh. /lava-3379532/e=
nvironment
    2023-03-03T00:32:49.153268  =

    2023-03-03T00:32:49.254544  / # . /lava-3379532/environment/lava-337953=
2/bin/lava-test-runner /lava-3379532/1
    2023-03-03T00:32:49.255244  =

    2023-03-03T00:32:49.259919  / # /lava-3379532/bin/lava-test-runner /lav=
a-3379532/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640140c6a8cce2d0ab8c87c7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-ba=
ylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640140c6a8cce2d0ab8c87d0
        failing since 44 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-03T00:35:00.330888  <8>[   14.777004] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3379557_1.5.2.4.1>
    2023-03-03T00:35:00.442819  / # #
    2023-03-03T00:35:00.544553  export SHELL=3D/bin/sh
    2023-03-03T00:35:00.545634  #
    2023-03-03T00:35:00.648013  / # export SHELL=3D/bin/sh. /lava-3379557/e=
nvironment
    2023-03-03T00:35:00.649555  =

    2023-03-03T00:35:00.751934  / # . /lava-3379557/environment/lava-337955=
7/bin/lava-test-runner /lava-3379557/1
    2023-03-03T00:35:00.753405  =

    2023-03-03T00:35:00.758340  / # /lava-3379557/bin/lava-test-runner /lav=
a-3379557/1
    2023-03-03T00:35:00.802515  <3>[   15.245240] Bluetooth: hci0: command =
0x0c03 tx timeout =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/64013b3037f1d04e9f8c8666

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-=
lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64013b3037f1d04=
e9f8c8669
        new failure (last pass: v6.2-1218-g2d4a54ee969d)
        30 lines

    2023-03-03T00:11:04.213384  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18>
    2023-03-03T00:11:04.214052  egister r4 information: slab kmalloc-512 st=
art c4b7c200 pointer offset 0 size 512
    2023-03-03T00:11:04.214548  kern  :alert : Register r5 information: non=
-slab/vmalloc memory
    2023-03-03T00:11:04.215006  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-03T00:11:04.256853  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-03T00:11:04.257482  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4b7c200 pointer offset 4 size 512
    2023-03-03T00:11:04.258021  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-03T00:11:04.258475  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-03T00:11:04.258912  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-03-03T00:11:04.260053  kern  :alert : Register r12 information: no=
n-paged memory =

    ... (11 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64013b3037f1d04=
e9f8c866a
        failing since 403 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-03T00:11:04.165297  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-03T00:11:04.166068  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-03T00:11:04.166482  kern  :alert : 8<--- cut here ---
    2023-03-03T00:11:04.167153  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-03T00:11:04.167535  kern  :alert : [00000060] *pgd=3Dc4a12831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-03T00:11:04.167880  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-03T00:11:04.208879  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc890c000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-03T00:11:04.209844  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-03T00:11:04.210473  kern  :alert : Register r3 information: non=
-paged memory   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640141248d8129eadd8c8666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640141248d8129eadd8c8=
667
        failing since 66 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64014021c2826b9b478c86b4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pe=
ngutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pe=
ngutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64014021c2826b9b478c86bd
        new failure (last pass: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:32:11.663861  + set[   15.032569] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 913805_1.5.2.3.1>
    2023-03-03T00:32:11.664032   +x
    2023-03-03T00:32:11.770347  / # #
    2023-03-03T00:32:11.872042  export SHELL=3D/bin/sh
    2023-03-03T00:32:11.872645  #
    2023-03-03T00:32:11.973891  / # export SHELL=3D/bin/sh. /lava-913805/en=
vironment
    2023-03-03T00:32:11.975156  =

    2023-03-03T00:32:12.076489  / # . /lava-913805/environment/lava-913805/=
bin/lava-test-runner /lava-913805/1
    2023-03-03T00:32:12.077118  =

    2023-03-03T00:32:12.080458  / # /lava-913805/bin/lava-test-runner /lava=
-913805/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/640140f7e64a9d61088c8691

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-s=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d-s=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640140f7e64a9d61088c8698
        failing since 57 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-03T00:35:37.569785  / # #
    2023-03-03T00:35:38.727693  export SHELL=3D/bin/sh
    2023-03-03T00:35:38.733111  #
    2023-03-03T00:35:40.278432  / # export SHELL=3D/bin/sh. /lava-1162779/e=
nvironment
    2023-03-03T00:35:40.283884  =

    2023-03-03T00:35:40.284063  / # . /lava-1162779/environment
    2023-03-03T00:35:43.102961  //lava-1162779/bin/lava-test-runner /lava-1=
162779/1
    2023-03-03T00:35:43.112184   # /lava-1162779/bin/lava-test-runner /lava=
-1162779/1
    2023-03-03T00:35:43.202238  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:35:43.202650  + cd /lava-1162779/1/tests/1_bootrr =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/640141348d8129eadd8c868d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7ulp=
-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640141348d8129eadd8c8694
        failing since 57 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-03T00:36:54.414617  + set +x
    2023-03-03T00:36:54.415750  <8>[   66.940390] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1162780_1.5.2.4.1>
    2023-03-03T00:36:54.525336  / # #
    2023-03-03T00:36:55.685421  export SHELL=3D/bin/sh
    2023-03-03T00:36:55.691124  #
    2023-03-03T00:36:55.691419  / # export SHELL=3D/bin/sh
    2023-03-03T00:36:57.238921  / # . /lava-1162780/environment
    2023-03-03T00:37:00.065816  /lava-1162780/bin/lava-test-runner /lava-11=
62780/1
    2023-03-03T00:37:00.072044  . /lava-1162780/environment
    2023-03-03T00:37:00.072311  / # /lava-1162780/bin/lava-test-runner /lav=
a-1162780/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b5884f3444a268c86df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b5884f3444a268c8=
6e0
        failing since 307 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c9ca7bccf76358c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-vi=
sionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/riscv/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-vi=
sionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c9ca7bccf76358c8=
659
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e6807ab3318648c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-s=
tarfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-s=
tarfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013e6807ab3318648c8=
64e
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/64013ab07885f1fc7a8c8630

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-=
a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013ab07885f1fc7a8c8637
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:09:07.327236  / #
    2023-03-03T00:09:07.429547  # #export SHELL=3D/bin/sh
    2023-03-03T00:09:07.430038  =

    2023-03-03T00:09:07.531518  / # export SHELL=3D/bin/sh. /lava-287518/en=
vironment
    2023-03-03T00:09:07.532039  =

    2023-03-03T00:09:07.633570  / # . /lava-287518/environment/lava-287518/=
bin/lava-test-runner /lava-287518/1
    2023-03-03T00:09:07.634448  =

    2023-03-03T00:09:07.639400  / # /lava-287518/bin/lava-test-runner /lava=
-287518/1
    2023-03-03T00:09:07.706347  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:09:07.706702  + <8>[   22.397670] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 287518_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64013ab07885f1fc7a8c863b
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:09:09.801535  /lava-287518/1/../bin/lava-test-case
    2023-03-03T00:09:09.801946  <8>[   24.505293] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-03T00:09:09.802191  /lava-287518/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
013ab07885f1fc7a8c863d
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:09:10.858171  /lava-287518/1/../bin/lava-test-case
    2023-03-03T00:09:10.858555  <8>[   25.542018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-03T00:09:10.858812  /lava-287518/1/../bin/lava-test-case
    2023-03-03T00:09:10.859043  <8>[   25.559043] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64013ab07885f1fc7a8c8642
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:09:11.930727  /lava-287518/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64013ab07885f1fc7a8c8643
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:09:11.933945  <8>[   26.650106] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-03T00:09:12.988348  /lava-287518/1/../bin/lava-test-case
    2023-03-03T00:09:12.988742  <8>[   27.671383] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-03T00:09:12.988981  /lava-287518/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/64013c170e8ac1f78a8c86e4

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013c170e8ac1f78a8c86eb
        failing since 8 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-3304-g34939120e353)

    2023-03-03T00:15:01.482398  / # #
    2023-03-03T00:15:01.584481  export SHELL=3D/bin/sh
    2023-03-03T00:15:01.584986  #
    2023-03-03T00:15:01.686404  / # export SHELL=3D/bin/sh. /lava-287528/en=
vironment
    2023-03-03T00:15:01.686934  =

    2023-03-03T00:15:01.788421  / # . /lava-287528/environment/lava-287528/=
bin/lava-test-runner /lava-287528/1
    2023-03-03T00:15:01.789180  =

    2023-03-03T00:15:01.794524  / # /lava-287528/bin/lava-test-runner /lava=
-287528/1
    2023-03-03T00:15:01.861519  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:15:01.861858  + <8>[   22.536373] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 287528_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64013c170e8ac1f78a8c86ef
        failing since 8 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-3304-g34939120e353)

    2023-03-03T00:15:03.954604  /lava-287528/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
013c170e8ac1f78a8c86f1
        failing since 8 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-3304-g34939120e353)

    2023-03-03T00:15:05.015617  /lava-287528/1/../bin/lava-test-case
    2023-03-03T00:15:05.015987  <8>[   25.680065] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64013c170e8ac1f78a8c86f6
        failing since 8 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-3304-g34939120e353)

    2023-03-03T00:15:06.092806  /lava-287528/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64013c170e8ac1f78a8c86f7
        failing since 8 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-3304-g34939120e353)

    2023-03-03T00:15:06.096060  <8>[   26.796021] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-03T00:15:07.154182  /lava-287528/1/../bin/lava-test-case
    2023-03-03T00:15:07.154479  <8>[   27.816200] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-03T00:15:07.154632  /lava-287528/1/../bin/lava-test-case
    2023-03-03T00:15:07.154772  <8>[   27.835324] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-03-03T00:15:07.154913  /lava-287528/1/../bin/lava-test-case
    2023-03-03T00:15:07.155046  <8>[   27.855067] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-03-03T00:15:07.155181  /lava-287528/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/64013dbe4c2c21246b8c8652

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013dbe4c2c21246b8c8659
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:21:54.650803  / # #
    2023-03-03T00:21:54.752427  export SHELL=3D/bin/sh
    2023-03-03T00:21:54.752919  #
    2023-03-03T00:21:54.854316  / # export SHELL=3D/bin/sh. /lava-287543/en=
vironment
    2023-03-03T00:21:54.854820  =

    2023-03-03T00:21:54.956082  / # . /lava-287543/environment/lava-287543/=
bin/lava-test-runner /lava-287543/1
    2023-03-03T00:21:54.956825  =

    2023-03-03T00:21:54.964107  / # /lava-287543/bin/lava-test-runner /lava=
-287543/1
    2023-03-03T00:21:55.030098  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:21:55.030414  + <8>[   22.409858] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 287543_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64013dbe4c2c21246b8c865d
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:21:57.124270  /lava-287543/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
013dbe4c2c21246b8c865f
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:21:58.180678  /lava-287543/1/../bin/lava-test-case
    2023-03-03T00:21:58.181050  <8>[   25.554036] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-03T00:21:58.181305  /lava-287543/1/../bin/lava-test-case
    2023-03-03T00:21:58.181535  <8>[   25.571073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64013dbe4c2c21246b8c8664
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:21:59.259515  /lava-287543/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64013dbe4c2c21246b8c8665
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:21:59.262755  <8>[   26.668240] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-03T00:22:00.320582  /lava-287543/1/../bin/lava-test-case
    2023-03-03T00:22:00.320950  <8>[   27.689372] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-03T00:22:00.321191  /lava-287543/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/64013f37c456ecc14e8c866e

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-23=
0-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013f37c456ecc14e8c8675
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:28:11.151738  / # #
    2023-03-03T00:28:11.256227  export SHELL=3D/bin/sh
    2023-03-03T00:28:11.256771  #
    2023-03-03T00:28:11.358682  / # export SHELL=3D/bin/sh. /lava-287558/en=
vironment
    2023-03-03T00:28:11.359357  =

    2023-03-03T00:28:11.464130  / # . /lava-287558/environment/lava-287558/=
bin/lava-test-runner /lava-287558/1
    2023-03-03T00:28:11.465002  =

    2023-03-03T00:28:11.480895  / # /lava-287558/bin/lava-test-runner /lava=
-287558/1
    2023-03-03T00:28:11.536914  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:28:11.537211  + <8>[   22.563872] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 287558_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64013f37c456ecc14e8c8679
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:28:13.634086  /lava-287558/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
013f37c456ecc14e8c867b
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:28:14.689791  /lava-287558/1/../bin/lava-test-case
    2023-03-03T00:28:14.690118  <8>[   25.709749] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-03T00:28:14.690285  /lava-287558/1/../bin/lava-test-case
    2023-03-03T00:28:14.690449  <8>[   25.726474] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-03-03T00:28:14.690623  /lava-287558/1/../bin/lava-test-case
    2023-03-03T00:28:14.690790  <8>[   25.744943] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-03-03T00:28:14.690964  /lava-287558/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64013f37c456ecc14e8c8680
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:28:15.764080  /lava-287558/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64013f37c456ecc14e8c8681
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:28:15.767156  <8>[   26.819885] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-03T00:28:16.823356  /lava-287558/1/../bin/lava-test-case
    2023-03-03T00:28:16.823639  <8>[   27.841033] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-03T00:28:16.823789  /lava-287558/1/../bin/lava-test-case
    2023-03-03T00:28:16.823927  <8>[   27.859336] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-03-03T00:28:16.824066  /lava-287558/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/64014013c2826b9b478c8642

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64014013c2826b9b478c8649
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:31:25.721692  + set +x
    2023-03-03T00:31:25.750270  <8>[   46.078999][  T187] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 287563_1.5.2.4.1>
    2023-03-03T00:31:25.878145  / # #
    2023-03-03T00:31:25.982184  export SHELL=3D/bin/sh
    2023-03-03T00:31:25.982592  #
    2023-03-03T00:31:26.090165  / # export SHELL=3D/bin/sh. /lava-287563/en=
vironment
    2023-03-03T00:31:26.090572  =

    2023-03-03T00:31:26.197650  / # . /lava-287563/environment/lava-287563/=
bin/lava-test-runner /lava-287563/1
    2023-03-03T00:31:26.198762  =

    2023-03-03T00:31:26.213802  / # /lava-287563/bin/lava-test-runner /lava=
-287563/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64014013c2826b9b478c864d
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:31:30.572717  /lava-287563/1/../bin/lava-test-case
    2023-03-03T00:31:30.689776  <8>[   51.015448][  T256] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
014013c2826b9b478c864f
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:31:32.198102  /lava-287563/1/../bin/lava-test-case
    2023-03-03T00:31:32.299010  <8>[   52.626880][  T266] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64014013c2826b9b478c8654
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:31:35.025021  /lava-287563/1/../bin/lava-test-case
    2023-03-03T00:31:35.157963  <8>[   55.486242][  T297] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64014013c2826b9b478c8655
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:31:36.405876  /lava-287563/1/../bin/lava-test-case
    2023-03-03T00:31:36.522539  <8>[   56.850900][  T303] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/6401417b09fd1bbb9c8c864d

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6401417b09fd1bbb9c8c8654
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:37:55.135911  <8>[   43.976412] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 287572_1.5.2.4.1>
    2023-03-03T00:37:55.241275  / # #
    2023-03-03T00:37:55.343207  export SHELL=3D/bin/sh
    2023-03-03T00:37:55.343649  #
    2023-03-03T00:37:55.445057  / # export SHELL=3D/bin/sh. /lava-287572/en=
vironment
    2023-03-03T00:37:55.445548  =

    2023-03-03T00:37:55.547004  / # . /lava-287572/environment/lava-287572/=
bin/lava-test-runner /lava-287572/1
    2023-03-03T00:37:55.547747  =

    2023-03-03T00:37:55.567608  / # /lava-287572/bin/lava-test-runner /lava=
-287572/1
    2023-03-03T00:37:55.619531  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/6401417b09fd1bbb9c8c8658
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:37:57.714834  /lava-287572/1/../bin/lava-test-case
    2023-03-03T00:37:57.715230  <8>[   46.544590] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-03T00:37:57.715513  /lava-287572/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
01417b09fd1bbb9c8c865a
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:37:58.773204  /lava-287572/1/../bin/lava-test-case
    2023-03-03T00:37:58.773595  <8>[   47.581126] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-03T00:37:58.774024  /lava-287572/1/../bin/lava-test-case
    2023-03-03T00:37:58.774243  <8>[   47.597471] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-03-03T00:37:58.774455  /lava-287572/1/../bin/lava-test-case
    2023-03-03T00:37:58.774661  <8>[   47.617530] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-03-03T00:37:58.774867  /lava-287572/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/6401417b09fd1bbb9c8c865f
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:37:59.846924  /lava-287572/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/6401417b09fd1bbb9c8c8660
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-6789-g74c3b2e0a611)

    2023-03-03T00:37:59.850095  <8>[   48.693645] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-03T00:38:00.907666  /lava-287572/1/../bin/lava-test-case
    2023-03-03T00:38:00.908075  <8>[   49.713697] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-03-03T00:38:00.908320  /lava-287572/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640142f9c6c0fc66d88c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron=
-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142f9c6c0fc66d88c8=
642
        failing since 8 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-3304-g34939120e353) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64013c180e8ac1f78a8c8748

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/=
baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013c180e8ac1f78a8c874f
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-03-03T00:15:00.577412  / # #
    2023-03-03T00:15:00.679303  export SHELL=3D/bin/sh
    2023-03-03T00:15:00.679821  #
    2023-03-03T00:15:00.781327  / # export SHELL=3D/bin/sh. /lava-287531/en=
vironment
    2023-03-03T00:15:00.781874  =

    2023-03-03T00:15:00.883351  / # . /lava-287531/environment/lava-287531/=
bin/lava-test-runner /lava-287531/1
    2023-03-03T00:15:00.884292  =

    2023-03-03T00:15:00.889212  / # /lava-287531/bin/lava-test-runner /lava=
-287531/1
    2023-03-03T00:15:00.954177  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:15:00.954561  + cd /l<8>[   15.547966] <LAVA_SIGNAL_START=
RUN 1_bootrr 287531_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/640=
13c190e8ac1f78a8c875f
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-03-03T00:15:05.009664  /lava-287531/1/../bin/lava-test-case
    2023-03-03T00:15:05.010066  <8>[   19.768784] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-03-03T00:15:05.010316  /lava-287531/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64013a9256e5e8a1f58c8679

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-s=
ei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-s=
ei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013a9256e5e8a1f58c8682
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:08:26.637883  / # #
    2023-03-03T00:08:26.739701  export SHELL=3D/bin/sh
    2023-03-03T00:08:26.740149  #
    2023-03-03T00:08:26.841428  / # export SHELL=3D/bin/sh. /lava-3379353/e=
nvironment
    2023-03-03T00:08:26.842053  =

    2023-03-03T00:08:26.842420  / # <3>[   18.534862] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:08:26.944026  . /lava-3379353/environment/lava-3379353/bi=
n/lava-test-runner /lava-3379353/1
    2023-03-03T00:08:26.945315  =

    2023-03-03T00:08:26.991356  / # /lava-3379353/bin/lava-test-runner /lav=
a-3379353/1
    2023-03-03T00:08:26.992007  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013bfadeadb0a1dc8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013bfadeadb0a1dc8c8639
        failing since 7 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:14:45.526932  <8>[   18.083990] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3379423_1.5.2.4.1>
    2023-03-03T00:14:45.630687  / # #
    2023-03-03T00:14:45.732218  export SHELL=3D/bin/sh
    2023-03-03T00:14:45.732569  #
    2023-03-03T00:14:45.833730  / # export SHELL=3D/bin/sh. /lava-3379423/e=
nvironment
    2023-03-03T00:14:45.834080  =

    2023-03-03T00:14:45.834256  / # <3>[   18.334286] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:14:45.935454  . /lava-3379423/environment/lava-3379423/bi=
n/lava-test-runner /lava-3379423/1
    2023-03-03T00:14:45.935996  =

    2023-03-03T00:14:45.942670  / # /lava-3379423/bin/lava-test-runner /lav=
a-3379423/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64013d9ee05a7b1c4b8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013d9ee05a7b1c4b8c8639
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:21:28.393242  / # #
    2023-03-03T00:21:28.495079  export SHELL=3D/bin/sh
    2023-03-03T00:21:28.495523  #
    2023-03-03T00:21:28.596915  / # export SHELL=3D/bin/sh. /lava-3379506/e=
nvironment
    2023-03-03T00:21:28.597372  =

    2023-03-03T00:21:28.597624  / # <3>[   18.458391] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:21:28.699039  . /lava-3379506/environment/lava-3379506/bi=
n/lava-test-runner /lava-3379506/1
    2023-03-03T00:21:28.700305  =

    2023-03-03T00:21:28.712247  / # /lava-3379506/bin/lava-test-runner /lav=
a-3379506/1
    2023-03-03T00:21:28.771288  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e6607ab3318648c8642

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei51=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei51=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013e6607ab3318648c864b
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:25:05.451053  + set +x<8>[   17.866867] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3379581_1.5.2.4.1>
    2023-03-03T00:25:05.555072  / # #
    2023-03-03T00:25:05.657239  export SHELL=3D/bin/sh
    2023-03-03T00:25:05.657676  #
    2023-03-03T00:25:05.759041  / # export SHELL=3D/bin/sh. /lava-3379581/e=
nvironment
    2023-03-03T00:25:05.759524  =

    2023-03-03T00:25:05.759806  / # <3>[   18.136134] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:25:05.861169  . /lava-3379581/environment/lava-3379581/bi=
n/lava-test-runner /lava-3379581/1
    2023-03-03T00:25:05.861844  =

    2023-03-03T00:25:05.871758  / # /lava-3379581/bin/lava-test-runner /lav=
a-3379581/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/640140e87a15c3d4668c8896

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12=
a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12=
a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640140e87a15c3d4668c889f
        failing since 4 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:35:29.624763  <8>[  102.251336] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3379725_1.5.2.4.1>
    2023-03-03T00:35:29.728713  / # #
    2023-03-03T00:35:29.830391  export SHELL=3D/bin/sh
    2023-03-03T00:35:29.830762  #
    2023-03-03T00:35:29.932188  / # export SHELL=3D/bin/sh. /lava-3379725/e=
nvironment
    2023-03-03T00:35:29.932840  =

    2023-03-03T00:35:29.933197  / # <3>[  102.498762] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:35:30.034796  . /lava-3379725/environment/lava-3379725/bi=
n/lava-test-runner /lava-3379725/1
    2023-03-03T00:35:30.035513  =

    2023-03-03T00:35:30.045199  / # /lava-3379725/bin/lava-test-runner /lav=
a-3379725/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6401423bda2619e6e38c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401423bda2619e6e38c8=
659
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640142ac9dc425c56f8c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142ac9dc425c56f8c8=
64f
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640142beae384bc88f8c864c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142beae384bc88f8c8=
64d
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640143995f167455288c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640143995f167455288c8=
65c
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64014328e2eb297b8f8c8725

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014328e2eb297b8f8c8=
726
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6401427720116d92d78c8641

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401427720116d92d78c8=
642
        failing since 11 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64013aa50eddd1badb8c8697

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-n=
anopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-n=
anopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013aa50eddd1badb8c86a0
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:08:57.787244  / # #
    2023-03-03T00:08:57.888948  export SHELL=3D/bin/sh
    2023-03-03T00:08:57.889304  #
    2023-03-03T00:08:57.990624  / # export SHELL=3D/bin/sh. /lava-3379333/e=
nvironment
    2023-03-03T00:08:57.991022  =

    2023-03-03T00:08:58.092383  / # . /lava-3379333/environment/lava-337933=
3/bin/lava-test-runner /lava-3379333/1
    2023-03-03T00:08:58.093049  =

    2023-03-03T00:08:58.098598  / # /lava-3379333/bin/lava-test-runner /lav=
a-3379333/1
    2023-03-03T00:08:58.170407  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:08:58.170680  + cd /lava-3379333/1/tests/1_bootrr =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c203093291f188c864a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013c203093291f188c8653
        failing since 7 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:15:15.558218  / # #
    2023-03-03T00:15:15.660156  export SHELL=3D/bin/sh
    2023-03-03T00:15:15.660637  #
    2023-03-03T00:15:15.761966  / # export SHELL=3D/bin/sh. /lava-3379410/e=
nvironment
    2023-03-03T00:15:15.762377  =

    2023-03-03T00:15:15.863738  / # . /lava-3379410/environment/lava-337941=
0/bin/lava-test-runner /lava-3379410/1
    2023-03-03T00:15:15.864479  =

    2023-03-03T00:15:15.869475  / # /lava-3379410/bin/lava-test-runner /lav=
a-3379410/1
    2023-03-03T00:15:15.941307  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:15:15.941601  + cd /lava-3379410/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64013dc60cf8d330368c8740

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013dc60cf8d330368c8749
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:22:04.470196  + set +x<8>[   18.448187] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3379484_1.5.2.4.1>
    2023-03-03T00:22:04.576785  / # #
    2023-03-03T00:22:04.678653  export SHELL=3D/bin/sh
    2023-03-03T00:22:04.679151  #
    2023-03-03T00:22:04.780474  / # export SHELL=3D/bin/sh. /lava-3379484/e=
nvironment
    2023-03-03T00:22:04.780962  =

    2023-03-03T00:22:04.882355  / # . /lava-3379484/environment/lava-337948=
4/bin/lava-test-runner /lava-3379484/1
    2023-03-03T00:22:04.883199  =

    2023-03-03T00:22:04.889223  / # /lava-3379484/bin/lava-test-runner /lav=
a-3379484/1
    2023-03-03T00:22:04.921186  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e95cebf25bf968c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013e95cebf25bf968c8639
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:25:41.137741  #
    2023-03-03T00:25:41.239603  / # #export SHELL=3D/bin/sh
    2023-03-03T00:25:41.239952  =

    2023-03-03T00:25:41.341276  / # export SHELL=3D/bin/sh. /lava-3379563/e=
nvironment
    2023-03-03T00:25:41.341623  =

    2023-03-03T00:25:41.442820  / # . /lava-3379563/environment/lava-337956=
3/bin/lava-test-runner /lava-3379563/1
    2023-03-03T00:25:41.443417  =

    2023-03-03T00:25:41.449581  / # /lava-3379563/bin/lava-test-runner /lav=
a-3379563/1
    2023-03-03T00:25:41.521341  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:25:41.521598  + cd /lava-3379563/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640140a6a8cce2d0ab8c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640140a6a8cce2d0ab8c8639
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:34:17.802328  + set +x<8>[   18.977432] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3379694_1.5.2.4.1>
    2023-03-03T00:34:17.802688  =

    2023-03-03T00:34:17.909769  / # #
    2023-03-03T00:34:18.011718  export SHELL=3D/bin/sh
    2023-03-03T00:34:18.012396  #
    2023-03-03T00:34:18.012761  / # export SHELL=3D/bin/sh<3>[   19.177417]=
 mmc0: error -84 whilst initialising SD card
    2023-03-03T00:34:18.114292  . /lava-3379694/environment
    2023-03-03T00:34:18.114979  =

    2023-03-03T00:34:18.216542  / # . /lava-3379694/environment/lava-337969=
4/bin/lava-test-runner /lava-3379694/1
    2023-03-03T00:34:18.217578   =

    ... (19 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6401411ae5e04858598c8674

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxb=
b-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6401411ae5e04858598c867d
        failing since 4 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:36:31.027285  / # #
    2023-03-03T00:36:31.129246  export SHELL=3D/bin/sh
    2023-03-03T00:36:31.129762  #
    2023-03-03T00:36:31.130005  / # <3>[   33.759035] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:36:31.231393  export SHELL=3D/bin/sh. /lava-3379714/envir=
onment
    2023-03-03T00:36:31.231895  =

    2023-03-03T00:36:31.333280  / # . /lava-3379714/environment/lava-337971=
4/bin/lava-test-runner /lava-3379714/1
    2023-03-03T00:36:31.334111  =

    2023-03-03T00:36:31.349961  / # /lava-3379714/bin/lava-test-runner /lav=
a-3379714/1
    2023-03-03T00:36:31.407853  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640142849dc425c56f8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142849dc425c56f8c8=
632
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ab85b0c8212608c8656

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s8=
05x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s8=
05x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013ab85b0c8212608c865f
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:09:09.253775  / # #
    2023-03-03T00:09:09.355537  export SHELL=3D/bin/sh
    2023-03-03T00:09:09.355967  #
    2023-03-03T00:09:09.457301  / # export SHELL=3D/bin/sh. /lava-3379343/e=
nvironment
    2023-03-03T00:09:09.457735  =

    2023-03-03T00:09:09.559089  / # . /lava-3379343/environment/lava-337934=
3/bin/lava-test-runner /lava-3379343/1
    2023-03-03T00:09:09.559767  =

    2023-03-03T00:09:09.566076  / # /lava-3379343/bin/lava-test-runner /lav=
a-3379343/1
    2023-03-03T00:09:09.643034  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:09:09.643292  + cd /lava-3379343/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c3966defb99048c866a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013c3966defb99048c8673
        failing since 7 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:15:28.588063  / # #
    2023-03-03T00:15:28.689908  export SHELL=3D/bin/sh
    2023-03-03T00:15:28.690337  #
    2023-03-03T00:15:28.791793  / # export SHELL=3D/bin/sh. /lava-3379429/e=
nvironment
    2023-03-03T00:15:28.792254  =

    2023-03-03T00:15:28.893715  / # . /lava-3379429/environment/lava-337942=
9/bin/lava-test-runner /lava-3379429/1
    2023-03-03T00:15:28.894528  =

    2023-03-03T00:15:28.899281  / # /lava-3379429/bin/lava-test-runner /lav=
a-3379429/1
    2023-03-03T00:15:28.947380  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:15:28.982114  + cd /lava-3379429/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64013dc81229455e7d8c86c4

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g=
xl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013dc81229455e7d8c86cd
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:22:06.934236  <8>[   18.302114] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3379489_1.5.2.4.1>
    2023-03-03T00:22:07.039692  / # #
    2023-03-03T00:22:07.141645  export SHELL=3D/bin/sh
    2023-03-03T00:22:07.142149  #
    2023-03-03T00:22:07.243517  / # export SHELL=3D/bin/sh. /lava-3379489/e=
nvironment
    2023-03-03T00:22:07.244024  =

    2023-03-03T00:22:07.345418  / # . /lava-3379489/environment/lava-337948=
9/bin/lava-test-runner /lava-3379489/1
    2023-03-03T00:22:07.346396  =

    2023-03-03T00:22:07.351645  / # /lava-3379489/bin/lava-test-runner /lav=
a-3379489/1
    2023-03-03T00:22:07.429628  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64013eb0cebf25bf968c86de

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013eb0cebf25bf968c86e7
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:25:54.455435  / # #
    2023-03-03T00:25:54.557121  export SHELL=3D/bin/sh
    2023-03-03T00:25:54.557474  #
    2023-03-03T00:25:54.658800  / # export SHELL=3D/bin/sh. /lava-3379569/e=
nvironment
    2023-03-03T00:25:54.659306  =

    2023-03-03T00:25:54.760662  / # . /lava-3379569/environment/lava-337956=
9/bin/lava-test-runner /lava-3379569/1
    2023-03-03T00:25:54.761271  =

    2023-03-03T00:25:54.766720  / # /lava-3379569/bin/lava-test-runner /lav=
a-3379569/1
    2023-03-03T00:25:54.844642  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:25:54.845118  + cd /lava-3379569/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/640140a4937a3fd8c28c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640140a4937a3fd8c28c8638
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:34:30.950186  / # #
    2023-03-03T00:34:31.052536  export SHELL=3D/bin/sh
    2023-03-03T00:34:31.053119  #
    2023-03-03T00:34:31.154616  / # export SHELL=3D/bin/sh. /lava-3379690/e=
nvironment
    2023-03-03T00:34:31.155378  =

    2023-03-03T00:34:31.257081  / # . /lava-3379690/environment/lava-337969=
0/bin/lava-test-runner /lava-3379690/1
    2023-03-03T00:34:31.258196  =

    2023-03-03T00:34:31.272720  / # /lava-3379690/bin/lava-test-runner /lav=
a-3379690/1
    2023-03-03T00:34:31.304742  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:34:31.344598  + cd /lava-3379690/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64014174ef7c3914c58c8640

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64014174ef7c3914c58c8649
        failing since 4 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:37:48.791263  / # #
    2023-03-03T00:37:48.892937  export SHELL=3D/bin/sh
    2023-03-03T00:37:48.893493  #
    2023-03-03T00:37:48.995018  / # export SHELL=3D/bin/sh. /lava-3379720/e=
nvironment
    2023-03-03T00:37:48.995646  =

    2023-03-03T00:37:49.097204  / # . /lava-3379720/environment/lava-337972=
0/bin/lava-test-runner /lava-3379720/1
    2023-03-03T00:37:49.098164  =

    2023-03-03T00:37:49.117624  / # /lava-3379720/bin/lava-test-runner /lav=
a-3379720/1
    2023-03-03T00:37:49.181595  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-03T00:37:49.181979  + cd /lava-3379720/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64014313e2eb297b8f8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014313e2eb297b8f8c8=
632
        failing since 23 days (last pass: v6.2-rc6-351-gf42837eac380f, firs=
t fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640142d26fcd72759f8c868e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142d26fcd72759f8c8=
68f
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640146710172ab39a98c8683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640146710172ab39a98c8=
684
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6401423414fd815c618c8663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401423414fd815c618c8=
664
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640144f3586facde1f8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640144f3586facde1f8c8=
637
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64014209fc3849e80d8c8665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014209fc3849e80d8c8=
666
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6401498cf4a0155a838c8638

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401498cf4a0155a838c8=
639
        new failure (last pass: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64013a930eddd1badb8c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-se=
i610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-se=
i610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013a930eddd1badb8c8647
        failing since 4 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:08:27.130560  / # #
    2023-03-03T00:08:27.232416  export SHELL=3D/bin/sh
    2023-03-03T00:08:27.232813  #
    2023-03-03T00:08:27.334165  / # export SHELL=3D/bin/sh. /lava-3379357/e=
nvironment
    2023-03-03T00:08:27.334567  =

    2023-03-03T00:08:27.334798  / # <3>[   18.225407] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:08:27.436242  . /lava-3379357/environment/lava-3379357/bi=
n/lava-test-runner /lava-3379357/1
    2023-03-03T00:08:27.437027  =

    2023-03-03T00:08:27.454597  / # /lava-3379357/bin/lava-test-runner /lav=
a-3379357/1
    2023-03-03T00:08:27.509571  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c0e0e8ac1f78a8c86b5

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre=
/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013c0e0e8ac1f78a8c86be
        failing since 7 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:14:47.865359  / # #
    2023-03-03T00:14:47.966808  export SHELL=3D/bin/sh
    2023-03-03T00:14:47.967200  #
    2023-03-03T00:14:48.068346  / # export SHELL=3D/bin/sh. /lava-3379417/e=
nvironment
    2023-03-03T00:14:48.068719  =

    2023-03-03T00:14:48.068880  / # <3>[   18.360369] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:14:48.169981  . /lava-3379417/environment/lava-3379417/bi=
n/lava-test-runner /lava-3379417/1
    2023-03-03T00:14:48.170515  =

    2023-03-03T00:14:48.178762  / # /lava-3379417/bin/lava-test-runner /lav=
a-3379417/1
    2023-03-03T00:14:48.239754  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64013da044ba648f728c867f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013da044ba648f728c8686
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:21:29.587674  / # #
    2023-03-03T00:21:29.689654  export SHELL=3D/bin/sh
    2023-03-03T00:21:29.690113  #
    2023-03-03T00:21:29.791496  / # export SHELL=3D/bin/sh. /lava-3379510/e=
nvironment
    2023-03-03T00:21:29.792200  =

    2023-03-03T00:21:29.792592  / # <3>[   18.304236] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:21:29.894386  . /lava-3379510/environment/lava-3379510/bi=
n/lava-test-runner /lava-3379510/1
    2023-03-03T00:21:29.895180  =

    2023-03-03T00:21:29.904067  / # /lava-3379510/bin/lava-test-runner /lav=
a-3379510/1
    2023-03-03T00:21:29.966078  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e7acf15c5bb748c8653

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013e7acf15c5bb748c865c
        failing since 7 days (last pass: v6.2-1218-g2d4a54ee969d, first fai=
l: v6.2-8700-gab98cc06b683)

    2023-03-03T00:25:08.259061  / # #
    2023-03-03T00:25:08.360964  export SHELL=3D/bin/sh
    2023-03-03T00:25:08.361435  #
    2023-03-03T00:25:08.462764  / # export SHELL=3D/bin/sh. /lava-3379575/e=
nvironment
    2023-03-03T00:25:08.463227  =

    2023-03-03T00:25:08.463436  / # <3>[   18.344947] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:25:08.564773  . /lava-3379575/environment/lava-3379575/bi=
n/lava-test-runner /lava-3379575/1
    2023-03-03T00:25:08.565557  =

    2023-03-03T00:25:08.607144  / # /lava-3379575/bin/lava-test-runner /lav=
a-3379575/1
    2023-03-03T00:25:08.634108  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/640140e77a15c3d4668c8880

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1=
-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1=
-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/640140e77a15c3d4668c8889
        failing since 4 days (last pass: v6.2-6789-g74c3b2e0a611, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:35:34.863636  / # #
    2023-03-03T00:35:34.965100  export SHELL=3D/bin/sh
    2023-03-03T00:35:34.965459  #
    2023-03-03T00:35:35.066667  / # export SHELL=3D/bin/sh. /lava-3379724/e=
nvironment
    2023-03-03T00:35:35.067083  =

    2023-03-03T00:35:35.067241  / # <3>[  103.263027] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-03T00:35:35.168402  . /lava-3379724/environment/lava-3379724/bi=
n/lava-test-runner /lava-3379724/1
    2023-03-03T00:35:35.168987  =

    2023-03-03T00:35:35.183271  / # /lava-3379724/bin/lava-test-runner /lav=
a-3379724/1
    2023-03-03T00:35:35.238148  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6401423cda2619e6e38c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-=
sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401423cda2619e6e38c8=
65f
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/64014313706402ecdb8c863c

  Results:     166 PASS, 6 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.panel-edp-probed: https://kernelci.org/test/case/id/640=
14313706402ecdb8c8690
        failing since 8 days (last pass: v6.2-rc8-211-g05def2d212c6, first =
fail: v6.2-3304-g34939120e353)

    2023-03-03T00:44:37.531929  /lava-9390529/1/../bin/lava-test-case

    2023-03-03T00:44:37.541685  <8>[   25.095533] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpanel-edp-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-pericfg-probed: https://kernelci.org/test/ca=
se/id/64014313706402ecdb8c86e2
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:44:34.660966  /lava-9390529/1/../bin/lava-test-case

    2023-03-03T00:44:34.670377  <8>[   22.224670] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8183-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8183-infracfg-probed: https://kernelci.org/test/c=
ase/id/64014313706402ecdb8c86e3
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:44:32.617729    cHandles:     0x1

    2023-03-03T00:44:32.617827    rHandle:      0

    2023-03-03T00:44:32.620689    V:            0

    2023-03-03T00:44:32.620783    Res:          0x0

    2023-03-03T00:44:32.624209  TPM2_CC_PolicyNvWritten:

    2023-03-03T00:44:32.624299    value: 0x200018F

    2023-03-03T00:44:32.627156    commandIndex: 0x18f

    2023-03-03T00:44:32.630547    reserved1:    0x0

    2023-03-03T00:44:32.630635    nv:           0

    2023-03-03T00:44:32.633780    extensive:    0
 =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ook+videodec | 3          =


  Details:     https://kernelci.org/test/plan/id/64013ef48793c231c48c86bb

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabor=
a/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/64013ef48793c231c48c8771
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-03-03T00:27:03.627111  /lava-9390352/1/../bin/lava-test-case

    2023-03-03T00:27:03.633114  <8>[   22.690678] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/64013ef48793c231c48c8772
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-03-03T00:27:02.606483  /lava-9390352/1/../bin/lava-test-case

    2023-03-03T00:27:02.612840  <8>[   21.670367] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/64013ef48793c231c48c8773
        new failure (last pass: v6.2-8700-gab98cc06b683)

    2023-03-03T00:27:00.577169    Res:          0x0

    2023-03-03T00:27:00.577245  TPM2_CC_TestParms:

    2023-03-03T00:27:00.577318    value: 0x18A

    2023-03-03T00:27:00.580629    commandIndex: 0x18a

    2023-03-03T00:27:00.583946    reserved1:    0x0

    2023-03-03T00:27:00.584026    nv:           0

    2023-03-03T00:27:00.587341    extensive:    0

    2023-03-03T00:27:00.587414    flushed:      0

    2023-03-03T00:27:00.590710    cHandles:     0x0

    2023-03-03T00:27:00.590788    rHandle:      0
 =

    ... (50 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/640143487ebd19961f8c8640

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/640143487ebd19961f8c86f6
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:45:23.206350  /lava-9390575/1/../bin/lava-test-case

    2023-03-03T00:45:23.212652  <8>[   22.624830] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/640143487ebd19961f8c86f7
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:45:22.187262  /lava-9390575/1/../bin/lava-test-case

    2023-03-03T00:45:22.194134  <8>[   21.605841] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/640143487ebd19961f8c86f8
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:45:20.158856    V:            0

    2023-03-03T00:45:20.159366    Res:          0x0

    2023-03-03T00:45:20.162622  TPM2_CC_TestParms:

    2023-03-03T00:45:20.163065    value: 0x18A

    2023-03-03T00:45:20.165274    commandIndex: 0x18a

    2023-03-03T00:45:20.165730    reserved1:    0x0

    2023-03-03T00:45:20.168840    nv:           0

    2023-03-03T00:45:20.169281    extensive:    0

    2023-03-03T00:45:20.171997    flushed:      0

    2023-03-03T00:45:20.172457    cHandles:     0x0
 =

    ... (51 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ae20dff8ea7408c868a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-clo=
udengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013ae20dff8ea7408c8=
68b
        failing since 141 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64014c1ecb9e508b868c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qco=
m-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qco=
m-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014c1ecb9e508b868c8=
657
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640140a1b0afac6c478c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640140a1b0afac6c478c8=
63f
        new failure (last pass: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640140f4e64a9d61088c868b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640140f4e64a9d61088c8=
68c
        new failure (last pass: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640140b9a8cce2d0ab8c86c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640140b9a8cce2d0ab8c8=
6c4
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640141062086e6b06b8c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640141062086e6b06b8c8=
638
        new failure (last pass: v6.2-rc7-318-g73d40d27ae59c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640140b8a8cce2d0ab8c86b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64=
-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640140b8a8cce2d0ab8c8=
6b6
        new failure (last pass: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/640141042086e6b06b8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640141042086e6b06b8c8=
632
        new failure (last pass: v6.2-1218-g2d4a54ee969d) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-baylibre    | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e7e0cea050a7a8c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i=
386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_i=
386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013e7e0cea050a7a8c8=
637
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/64013abe5b0c8212608c867a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013abe5b0c8212608c8=
67b
        failing since 13 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ef89c6c87904f8c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i3=
86-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i3=
86-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013ef89c6c87904f8c8=
63c
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/64013aa3dda3e9d96f8c8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013aa3dda3e9d96f8c8=
656
        failing since 13 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-150-g30cd52e17d48) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10   | i386_d=
efconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013f043488bb322c8c866f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_=
i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/i386/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_=
i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013f043488bb322c8c8=
670
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b6d2c4ca732f78c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b6d2c4ca732f78c8=
631
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c49857bff056e8c866e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c49857bff056e8c8=
66f
        failing since 16 days (last pass: v6.2-rc7-136-g39693c3ba989, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cc28d51ba5e6e8c8696

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013cc28d51ba5e6e8c8=
697
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ce8825514f4e68c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013ce8825514f4e68c8=
63b
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64013d8c626cecba6b8c8655

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013d8c626cecba6b8c8=
656
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ef1d7174f5e3d8c8662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013ef1d7174f5e3d8c8=
663
        failing since 11 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013fc66db23807a38c864e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013fc66db23807a38c8=
64f
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640142bcae384bc88f8c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142bcae384bc88f8c8=
648
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b5ff2f91d6e148c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b5ff2f91d6e148c8=
632
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c4e857bff056e8c8677

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c4e857bff056e8c8=
678
        failing since 16 days (last pass: v6.2-rc7-136-g39693c3ba989, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cef825514f4e68c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013cef825514f4e68c8=
63e
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013d189c819ee3718c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013d189c819ee3718c8=
631
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e6b07ab3318648c8653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013e6b07ab3318648c8=
654
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64013f47c85fbd434e8c8643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013f47c85fbd434e8c8=
644
        failing since 11 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640140c3a8cce2d0ab8c87c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640140c3a8cce2d0ab8c8=
7c2
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640142f4c6c0fc66d88c863b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142f4c6c0fc66d88c8=
63c
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b62aae84bd3b18c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b62aae84bd3b18c8=
657
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c3e857bff056e8c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c3e857bff056e8c8=
63d
        failing since 16 days (last pass: v6.2-rc7-136-g39693c3ba989, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cb6cecf2d65908c8686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013cb6cecf2d65908c8=
687
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cc18d51ba5e6e8c8693

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013cc18d51ba5e6e8c8=
694
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64013dba4c2c21246b8c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013dba4c2c21246b8c8=
64e
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64013f370b72cb26178c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013f370b72cb26178c8=
640
        failing since 11 days (last pass: v6.2-rc8-150-g30cd52e17d48, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640140b7a8cce2d0ab8c86b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640140b7a8cce2d0ab8c8=
6b3
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/6401433c59712f8b7c8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401433c59712f8b7c8c8=
630
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b6c552d2e69698c865c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b6c552d2e69698c8=
65d
        failing since 11 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c4a857bff056e8c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu=
_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c4a857bff056e8c8=
672
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cc0763bdf088b8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013cc0763bdf088b8c8=
631
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ce7763bdf088b8c86c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013ce7763bdf088b8c8=
6c4
        failing since 11 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64013d8a7ef4ca523d8c8637

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-bayl=
ibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013d8a7ef4ca523d8c8=
638
        failing since 16 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ef08793c231c48c869e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013ef08793c231c48c8=
69f
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013fc46db23807a38c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-baylibre/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013fc46db23807a38c8=
64c
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre    | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640142d46fcd72759f8c86aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-baylibre/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142d46fcd72759f8c8=
6ab
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b5eaae84bd3b18c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/bas=
eline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b5eaae84bd3b18c8=
650
        failing since 11 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c50857bff056e8c867a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c50857bff056e8c8=
67b
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cdb8d51ba5e6e8c86b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013cdb8d51ba5e6e8c8=
6b7
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013d171fb33bd6fb8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013d171fb33bd6fb8c8=
630
        failing since 11 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64013e57cacceb537e8c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broo=
nie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013e57cacceb537e8c8=
63d
        failing since 16 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64013f0bf6787c218f8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/base=
line-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013f0bf6787c218f8c8=
640
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/640140afa8cce2d0ab8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qe=
mu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640140afa8cce2d0ab8c8=
647
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640142f5c6c0fc66d88c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142f5c6c0fc66d88c8=
63f
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b4eaae84bd3b18c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/b=
aseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b4eaae84bd3b18c8=
631
        failing since 11 days (last pass: v6.2-rc7-233-gd885c5e298888, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c3f857bff056e8c863f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c3f857bff056e8c8=
640
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c986d818f50cd8c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x8=
6_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c986d818f50cd8c8=
648
        failing since 11 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/64013cbfbbb354b1668c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013cbfbbb354b1668c8=
658
        failing since 11 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-211-g05def2d212c6) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64013d7e7ef4ca523d8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-coll=
abora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013d7e7ef4ca523d8c8=
632
        failing since 16 days (last pass: v6.2-rc7-188-gc82c3af3ec13, first=
 fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/64013f360b72cb26178c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/ba=
seline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013f360b72cb26178c8=
63d
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/6401409eea5dfe53c68c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-=
qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401409eea5dfe53c68c8=
63e
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/640143787ebd19961f8c87f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/x86_64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-q=
emu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640143787ebd19961f8c8=
7fa
        failing since 16 days (last pass: v6.2-rc7-318-g73d40d27ae59c, firs=
t fail: v6.2-rc8-94-g11ce0876aa1c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013c83c13e076fbb8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013c83c13e076fbb8c8=
630
        failing since 77 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013b1bd3e473b7978c86ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013b1bd3e473b7978c8=
6eb
        failing since 77 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6401427a20116d92d78c8647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-r=
oc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6401427a20116d92d78c8=
648
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64013f9125b6eb11e38c864b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-=
4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-=
4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013f9125b6eb11e38c8=
64c
        new failure (last pass: v6.2-8700-gab98cc06b683) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64014202fc3849e80d8c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk339=
9-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014202fc3849e80d8c8=
65c
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/64014313c6c0fc66d88c8680

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-sc7180-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/baselin=
e-sc7180-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64014313c6c0fc66d88c8689
        failing since 4 days (last pass: v6.2-8700-gab98cc06b683, first fai=
l: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:44:41.087485  + <8>[   16.892061] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 9390510_1.5.2.3.1>

    2023-03-03T00:44:41.088100  set +x

    2023-03-03T00:44:41.196966  / # #

    2023-03-03T00:44:41.299910  export SHELL=3D/bin/sh

    2023-03-03T00:44:41.300815  #

    2023-03-03T00:44:41.402851  / # export SHELL=3D/bin/sh. /lava-9390510/e=
nvironment

    2023-03-03T00:44:41.403773  =


    2023-03-03T00:44:41.506001  / # . /lava-9390510/environment/lava-939051=
0/bin/lava-test-runner /lava-9390510/1

    2023-03-03T00:44:41.507387  =


    2023-03-03T00:44:41.514748  / # /lava-9390510/bin/lava-test-runner /lav=
a-9390510/1
 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64014312c6c0fc66d88c867c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64014312c6c0fc66d88c8=
67d
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/640142749e6b9cd7fd8c86c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm64/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-=
h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/640142749e6b9cd7fd8c8=
6c6
        failing since 23 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-157-ga82755b498dd) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/64013a4d13d9d1f9c88c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-plu=
s-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64013a4d13d9d1f9c88c8643
        new failure (last pass: v6.2-12625-g13efc3a9f23b)

    2023-03-03T00:07:29.709044  <8>[    9.432410] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3379323_1.5.2.4.1>
    2023-03-03T00:07:29.828221  / # #
    2023-03-03T00:07:29.933768  export SHELL=3D/bin/sh
    2023-03-03T00:07:29.935269  #
    2023-03-03T00:07:30.038842  / # export SHELL=3D/bin/sh. /lava-3379323/e=
nvironment
    2023-03-03T00:07:30.040366  =

    2023-03-03T00:07:30.143810  / # . /lava-3379323/environment/lava-337932=
3/bin/lava-test-runner /lava-3379323/1
    2023-03-03T00:07:30.146497  =

    2023-03-03T00:07:30.153980  / # /lava-3379323/bin/lava-test-runner /lav=
a-3379323/1
    2023-03-03T00:07:30.313754  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64013ba7867a3f14108c8671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-13370-=
g5872d227b73f/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230224.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64013ba7867a3f14108c8=
672
        failing since 77 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
