Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA89A738121
	for <lists+linux-next@lfdr.de>; Wed, 21 Jun 2023 13:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbjFUJv4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jun 2023 05:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjFUJvc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jun 2023 05:51:32 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB0C26AA
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2023 02:50:43 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-666eba6f3d6so2471560b3a.3
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2023 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1687341042; x=1689933042;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Hpzp2B6bebd5/qaeX6QRlqx/d+VtH/axmanPXWs9q4=;
        b=sIT9BIylQsi12TrAH0NL58sAMC0INgLDV6EUCWmSTP20y94PmikO/5H2MJpCDNIj1l
         WE+o9uy0ZU/dODYAVROb6AJpG1VhXbgdEXPrOvvZIPOoqMqn4aZNn1mOuIT8TGzZTYHp
         /G2oinwzpK3fANSGT6G25CHdHdN998j7z6yvLdjEqjFGlPZfOF0SxzMr+6MFzAwT5Kil
         uPao8dCfhgKrip1LpG+zcKCYkWhV6JyDl40cpiOY8JNZoadhY9NXsTYJrJyu3xYJMKFG
         RpzLBLh+A1oKUXhAskEA/tTpn2UP24DTDxyvUezhdpFeip9LYLEUX9tLAnweIpJf3SH7
         u2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687341042; x=1689933042;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Hpzp2B6bebd5/qaeX6QRlqx/d+VtH/axmanPXWs9q4=;
        b=l8NVFLKgHgiMIC7ZoAJDWI6KEAtP7Rv73ES7pBjuUCQN1BzJxGQP3YdsVU44chVS8P
         hP5bAbfti8KnaMN65y7FPu3ivdi+F7siWz6WpSrBgGXGcd9b7ZzySWGTFkrQMJme2waD
         G9bTRzD2j83wd9uNvs1uFla49YAx9OaVGSZIg2B31rRyc3sjWSpDZqHjPwq663zfQXiZ
         7WmSkDzEIfv4bDfa/4lgkDySfHdlD1cAAQ0o9MPIu+wr2AwA60+dowCaeIM/ckufsQ4x
         TKScgRODzkf+xdiZnnRFD2W1S3FvvBDI4jWcuCKxxdPi1qmtCBu4jJvBMxNaIWpyTDI7
         uEnA==
X-Gm-Message-State: AC+VfDwFU4nyB1eIiHPti1InaYh/PhOZM1I0KwPvP+RPCHeYkhk78aXM
        S6fFtufzEUjdb/F8yQwUWgXm1BESrGe1ZTc1tU+/nA==
X-Google-Smtp-Source: ACHHUZ4RiKVo+AAJLqTtiQXqrXrN3khqrly68DSzrFU2+iAzpSzf0/Xrmok05Z8QMUabBBczY8xe4g==
X-Received: by 2002:a05:6a20:3d10:b0:121:a354:c65d with SMTP id y16-20020a056a203d1000b00121a354c65dmr5425113pzi.55.1687341040457;
        Wed, 21 Jun 2023 02:50:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d28-20020a630e1c000000b00528da88275bsm2751578pgl.47.2023.06.21.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 02:50:39 -0700 (PDT)
Message-ID: <6492c7ef.630a0220.4dcd6.6509@mx.google.com>
Date:   Wed, 21 Jun 2023 02:50:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20230621
Subject: next/master baseline: 856 runs, 177 regressions (next-20230621)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 856 runs, 177 regressions (next-20230621)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | multi_=
v5_defconfig           | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | clang-17 | multi_=
v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =

imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =

imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig+arm64-chromebook   | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-13 | defcon=
fig+arm64-chromebook   | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 2          =

mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
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

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230621/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230621
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      15e71592dbae49a674429c618a10401d7f992ac3 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-R721T-grunt             | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929457e3dd1d008f306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-R721T-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929457e3dd1d008f306=
13a
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929544da97291bb8306176

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
acer-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929544da97291bb8306=
177
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a6c849d3e73156306150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492a6c849d3e73156306=
151
        failing since 280 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929545da97291bb830617c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929545da97291bb8306=
17d
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649295a08e6889eb4930614f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649295a08e6889eb49306154
        failing since 84 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-21T06:15:43.617362  <8>[   10.122562] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10842376_1.4.2.3.1>

    2023-06-21T06:15:43.620967  + set +x

    2023-06-21T06:15:43.725097  / # #

    2023-06-21T06:15:43.825637  export SHELL=3D/bin/sh

    2023-06-21T06:15:43.825771  #

    2023-06-21T06:15:43.926273  / # export SHELL=3D/bin/sh. /lava-10842376/=
environment

    2023-06-21T06:15:43.926412  =


    2023-06-21T06:15:44.026932  / # . /lava-10842376/environment/lava-10842=
376/bin/lava-test-runner /lava-10842376/1

    2023-06-21T06:15:44.027198  =


    2023-06-21T06:15:44.032692  / # /lava-10842376/bin/lava-test-runner /la=
va-10842376/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6492969005a1718711306142

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492969005a1718711306147
        failing since 84 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-21T06:19:46.693274  <8>[    7.913192] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10842589_1.4.2.3.1>

    2023-06-21T06:19:46.696622  + set +x

    2023-06-21T06:19:46.801256  / # #

    2023-06-21T06:19:46.902056  export SHELL=3D/bin/sh

    2023-06-21T06:19:46.902320  #

    2023-06-21T06:19:47.002940  / # export SHELL=3D/bin/sh. /lava-10842589/=
environment

    2023-06-21T06:19:47.003206  =


    2023-06-21T06:19:47.103871  / # . /lava-10842589/environment/lava-10842=
589/bin/lava-test-runner /lava-10842589/1

    2023-06-21T06:19:47.104286  =


    2023-06-21T06:19:47.109947  / # /lava-10842589/bin/lava-test-runner /la=
va-10842589/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929461e3dd1d008f30615e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929461e3dd1d008f306=
15f
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/649294391f00aec07f30613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
asus-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649294391f00aec07f306=
13b
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/64929502eee9407f24306146

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929502eee9407f2430614b
        failing since 84 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-21T06:13:04.354139  <8>[   10.335525] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10842429_1.4.2.3.1>

    2023-06-21T06:13:04.357764  + set +x

    2023-06-21T06:13:04.459088  =


    2023-06-21T06:13:04.559680  / # #export SHELL=3D/bin/sh

    2023-06-21T06:13:04.559858  =


    2023-06-21T06:13:04.660377  / # export SHELL=3D/bin/sh. /lava-10842429/=
environment

    2023-06-21T06:13:04.660517  =


    2023-06-21T06:13:04.761034  / # . /lava-10842429/environment/lava-10842=
429/bin/lava-test-runner /lava-10842429/1

    2023-06-21T06:13:04.761312  =


    2023-06-21T06:13:04.766258  / # /lava-10842429/bin/lava-test-runner /la=
va-10842429/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64929680836bafb2e8306164

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929680836bafb2e8306169
        failing since 84 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-21T06:19:26.008226  <8>[   10.197469] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10842592_1.4.2.3.1>

    2023-06-21T06:19:26.011449  + set +x

    2023-06-21T06:19:26.112959  =


    2023-06-21T06:19:26.213567  / # #export SHELL=3D/bin/sh

    2023-06-21T06:19:26.213761  =


    2023-06-21T06:19:26.314341  / # export SHELL=3D/bin/sh. /lava-10842592/=
environment

    2023-06-21T06:19:26.314548  =


    2023-06-21T06:19:26.415204  / # . /lava-10842592/environment/lava-10842=
592/bin/lava-test-runner /lava-10842592/1

    2023-06-21T06:19:26.415558  =


    2023-06-21T06:19:26.420535  / # /lava-10842592/bin/lava-test-runner /la=
va-10842592/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | at91_d=
t_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64929167651832962a30615d

  Results:     52 PASS, 2 FAIL, 1 SKIP
  Full config: at91_dt_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
at91_dt_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/64929167651832962a306179
        failing since 16 days (last pass: next-20230601, first fail: next-2=
0230605)

    2023-06-21T05:57:49.599652  /lava-645074/1/../bin/lava-test-case
    2023-06-21T05:57:49.641484  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10   | multi_=
v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64929488c64b3a8f37306133

  Results:     51 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.atmel-ramc-driver-present: https://kernelci.org/test/ca=
se/id/64929488c64b3a8f3730614b
        failing since 16 days (last pass: next-20230601, first fail: next-2=
0230605)

    2023-06-21T06:10:51.822335  /lava-645186/1/../bin/lava-test-case
    2023-06-21T06:10:51.862432  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Datm=
el-ramc-driver-present RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6492938decfa15a25e30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492938decfa15a25e306=
130
        failing since 16 days (last pass: next-20230601, first fail: next-2=
0230605) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649294194767b9b463306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649294194767b9b463306=
154
        failing since 84 days (last pass: next-20230327, first fail: next-2=
0230328) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492928c2fda89b269306147

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-be=
agle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492928c2fda89b269306=
148
        failing since 81 days (last pass: next-20230330, first fail: next-2=
0230331) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6492944a396681c70c306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/clang-17/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492944a396681c70c306=
139
        failing since 1 day (last pass: next-20230616, first fail: next-202=
30619) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492937ffe5d955fc7306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492937ffe5d955fc7306=
134
        failing since 0 day (last pass: next-20230619, first fail: next-202=
30620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64929cc607360fbb89306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929cc607360fbb89306=
178
        failing since 0 day (last pass: next-20230619, first fail: next-202=
30620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6492932c06af86b60c30614d

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6492932c06af86b=
60c306154
        failing since 127 days (last pass: next-20230208, first fail: next-=
20230213)
        30 lines

    2023-06-21T06:05:20.289522  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4d46600 pointer offset 4 size 512
    2023-06-21T06:05:20.321401  kern  :alert : Register r9 information: non=
-paged memory
    2023-06-21T06:05:20.321714  kern  :alert : Register r10 information: NU=
LL pointer
    2023-06-21T06:05:20.321919  kern  :alert : Register r11 information: 1-=
page vmalloc region starting at 0xbf2c6000 allocated at load_module+0x6b0/0=
x1954
    2023-06-21T06:05:20.324447  kern  :alert : Register r12 information: no=
n-paged memory
    2023-06-21T06:05:20.429157  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-06-21T06:05:20.429656  kern  :emerg : Process udevd (pid: 65, stac=
k limit =3D 0xb1693ef2)
    2023-06-21T06:05:20.429921  kern  :emerg : Stack: (0xc8901cf8 to 0xc890=
2000)
    2023-06-21T06:05:20.430114  kern  :emerg : 1ce0:                       =
                                c4d46600 c0773880
    2023-06-21T06:05:20.430329  kern  :emerg : 1d00: 00000000 c03b2e5c 0000=
0000 4c94740c 0000005d 4c94740c c0773880 bf2c6220 =

    ... (7 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929544da97291bb8306173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929544da97291bb8306=
174
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929542da97291bb830616a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
dell-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929542da97291bb8306=
16b
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649296fe8703c69d17306191

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/risc=
v/defconfig+kselftest/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/risc=
v/defconfig+kselftest/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649296fe8703c69d17306=
192
        failing since 5 days (last pass: next-20230615, first fail: next-20=
230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6492948305e06c03b830612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492948305e06c03b8306=
12f
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-14-db0003na-grunt         | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6492943c1f00aec07f306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-14-db0003na-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492943c1f00aec07f306=
141
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6492951c6e37970fb130613f

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492951c6e37970fb1306144
        failing since 84 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-21T06:13:33.910698  + set +x

    2023-06-21T06:13:33.917105  <8>[   10.283103] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10842419_1.4.2.3.1>

    2023-06-21T06:13:34.024752  / # #

    2023-06-21T06:13:34.126831  export SHELL=3D/bin/sh

    2023-06-21T06:13:34.127522  #

    2023-06-21T06:13:34.228853  / # export SHELL=3D/bin/sh. /lava-10842419/=
environment

    2023-06-21T06:13:34.229543  =


    2023-06-21T06:13:34.331022  / # . /lava-10842419/environment/lava-10842=
419/bin/lava-test-runner /lava-10842419/1

    2023-06-21T06:13:34.332284  =


    2023-06-21T06:13:34.336903  / # /lava-10842419/bin/lava-test-runner /la=
va-10842419/1
 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/649296eeda98092e1230625e

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649296eeda98092e12306263
        failing since 84 days (last pass: next-20230327, first fail: next-2=
0230328)

    2023-06-21T06:21:35.183398  + set +x

    2023-06-21T06:21:35.190182  <8>[   10.866333] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10842584_1.4.2.3.1>

    2023-06-21T06:21:35.294884  / # #

    2023-06-21T06:21:35.395566  export SHELL=3D/bin/sh

    2023-06-21T06:21:35.395790  #

    2023-06-21T06:21:35.496365  / # export SHELL=3D/bin/sh. /lava-10842584/=
environment

    2023-06-21T06:21:35.496593  =


    2023-06-21T06:21:35.597197  / # . /lava-10842584/environment/lava-10842=
584/bin/lava-test-runner /lava-10842584/1

    2023-06-21T06:21:35.597536  =


    2023-06-21T06:21:35.602153  / # /lava-10842584/bin/lava-test-runner /la=
va-10842584/1
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/649294ea534d5d8759306157

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649294ea534d5d875930615c
        failing since 84 days (last pass: next-20230324, first fail: next-2=
0230328)

    2023-06-21T06:12:49.050032  <8>[   10.456039] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 10842382_1.4.2.3.1>

    2023-06-21T06:12:49.053445  + set +x

    2023-06-21T06:12:49.154902  #

    2023-06-21T06:12:49.155234  =


    2023-06-21T06:12:49.255860  / # #export SHELL=3D/bin/sh

    2023-06-21T06:12:49.256083  =


    2023-06-21T06:12:49.356598  / # export SHELL=3D/bin/sh. /lava-10842382/=
environment

    2023-06-21T06:12:49.356796  =


    2023-06-21T06:12:49.457283  / # . /lava-10842382/environment/lava-10842=
382/bin/lava-test-runner /lava-10842382/1

    2023-06-21T06:12:49.457582  =

 =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-x360-14a-cb0001xx-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929452396681c70c306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
hp-x360-14a-cb0001xx-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929452396681c70c306=
154
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649292be06e265dd343061da

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649292be06e265dd343061df
        new failure (last pass: next-20230620)

    2023-06-21T06:03:18.546454  + set[   15.216307] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 983638_1.5.2.3.1>
    2023-06-21T06:03:18.546840   +x
    2023-06-21T06:03:18.652063  / # #
    2023-06-21T06:03:18.754001  export SHELL=3D/bin/sh
    2023-06-21T06:03:18.754512  #
    2023-06-21T06:03:18.855824  / # export SHELL=3D/bin/sh. /lava-983638/en=
vironment
    2023-06-21T06:03:18.856329  =

    2023-06-21T06:03:18.957658  / # . /lava-983638/environment/lava-983638/=
bin/lava-test-runner /lava-983638/1
    2023-06-21T06:03:18.958327  =

    2023-06-21T06:03:18.961655  / # /lava-983638/bin/lava-test-runner /lava=
-983638/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64929a16a322795504306157

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929a16a322795504306=
158
        failing since 315 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6492970a72d38301db306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492970a72d38301db306=
145
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mm-innocomm-wb15-evk     | arm64  | lab-pengutronix | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649299628c8cbd6a0030616e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-pengutronix/baseline-imx8mm-innocomm-wb15-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299628c8cbd6a00306=
16f
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6492955a2837e0dbea306188

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492955a2837e0dbea306=
189
        new failure (last pass: next-20230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64929743aa0202234e3061dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929743aa0202234e306=
1dd
        failing since 435 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929d0dd4c9071d3f30613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929d0dd4c9071d3f306=
13d
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64929bb379a4afd15b306175

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929bb379a4afd15b30617a
        new failure (last pass: next-20230615)

    2023-06-21T06:41:33.192294  <8>[    8.081533] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3683601_1.5.2.4.1>
    2023-06-21T06:41:33.302846  / # #
    2023-06-21T06:41:33.405946  export SHELL=3D/bin/sh
    2023-06-21T06:41:33.407332  #
    2023-06-21T06:41:33.509985  / # export SHELL=3D/bin/sh. /lava-3683601/e=
nvironment
    2023-06-21T06:41:33.510851  =

    2023-06-21T06:41:33.612509  / # . /lava-3683601/environment/lava-368360=
1/bin/lava-test-runner /lava-3683601/1
    2023-06-21T06:41:33.613864  =

    2023-06-21T06:41:33.624489  / # /lava-3683601/bin/lava-test-runner /lav=
a-3683601/1
    2023-06-21T06:41:33.669616  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492944eec51983b9330613e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-k3-am62=
5-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492944eec51983b93306143
        failing since 62 days (last pass: next-20230417, first fail: next-2=
0230419)

    2023-06-21T06:10:09.350244  <8>[    8.330694] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3683309_1.5.2.4.1>
    2023-06-21T06:10:09.468982  / # #
    2023-06-21T06:10:09.570667  export SHELL=3D/bin/sh
    2023-06-21T06:10:09.571036  #
    2023-06-21T06:10:09.671985  / # export SHELL=3D/bin/sh. /lava-3683309/e=
nvironment
    2023-06-21T06:10:09.672370  =

    2023-06-21T06:10:09.773654  / # . /lava-3683309/environment/lava-368330=
9/bin/lava-test-runner /lava-3683309/1
    2023-06-21T06:10:09.774205  =

    2023-06-21T06:10:09.816647  / # /lava-3683309/bin/lava-test-runner /lav=
a-3683309/1
    2023-06-21T06:10:09.827179  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6492978cad16a7abf23061ad

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492978cad16a7abf23061b2
        failing since 5 days (last pass: next-20230615, first fail: next-20=
230616)

    2023-06-21T06:23:55.416643  + set +x
    2023-06-21T06:23:55.416961  <8>[   11.543449] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3683474_1.5.2.4.1>
    2023-06-21T06:23:55.527384  / # #
    2023-06-21T06:23:55.632498  export SHELL=3D/bin/sh
    2023-06-21T06:23:55.633037  #
    2023-06-21T06:23:55.738796  / # export SHELL=3D/bin/sh. /lava-3683474/e=
nvironment
    2023-06-21T06:23:55.739287  =

    2023-06-21T06:23:55.846666  / # . /lava-3683474/environment/lava-368347=
4/bin/lava-test-runner /lava-3683474/1
    2023-06-21T06:23:55.847675  =

    2023-06-21T06:23:55.863967  / # /lava-3683474/bin/lava-test-runner /lav=
a-3683474/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
k3-am625-sk                  | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64929c329bbbb29cfa306173

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929c329bbbb29cfa306178
        failing since 5 days (last pass: next-20230615, first fail: next-20=
230616)

    2023-06-21T06:43:28.877606  <8>[    7.711648] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3683624_1.5.2.4.1>
    2023-06-21T06:43:28.987398  / # #
    2023-06-21T06:43:29.090611  export SHELL=3D/bin/sh
    2023-06-21T06:43:29.091349  #
    2023-06-21T06:43:29.193298  / # export SHELL=3D/bin/sh. /lava-3683624/e=
nvironment
    2023-06-21T06:43:29.194265  =

    2023-06-21T06:43:29.296371  / # . /lava-3683624/environment/lava-368362=
4/bin/lava-test-runner /lava-3683624/1
    2023-06-21T06:43:29.297819  =

    2023-06-21T06:43:29.312448  / # /lava-3683624/bin/lava-test-runner /lav=
a-3683624/1
    2023-06-21T06:43:29.357320  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/649297d2e06e6b4011306158

  Results:     92 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
49297d2e06e6b401130618e
        failing since 7 days (last pass: next-20230607, first fail: next-20=
230613)

    2023-06-21T06:25:09.359773  /lava-362184/1/../bin/lava-test-case
    2023-06-21T06:25:09.363046  <8>[   46.468063] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
49297d2e06e6b401130618f
        failing since 7 days (last pass: next-20230607, first fail: next-20=
230613)

    2023-06-21T06:25:10.381305  /lava-362184/1/../bin/lava-test-case
    2023-06-21T06:25:10.384580  <8>[   47.489860] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
49297d2e06e6b4011306190
        failing since 7 days (last pass: next-20230607, first fail: next-20=
230613)

    2023-06-21T06:25:11.443562  /lava-362184/1/../bin/lava-test-case
    2023-06-21T06:25:11.444105  <8>[   48.511802] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-06-21T06:25:11.444590  /lava-362184/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929995f5c5eedfe0306136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929995f5c5eedfe0306=
137
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/64929066b4bd6041e930620e

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929066b4bd6041e9306211
        new failure (last pass: next-20230619)

    2023-06-21T05:53:31.040632  / # #
    2023-06-21T05:53:31.143268  export SHELL=3D/bin/sh
    2023-06-21T05:53:31.144063  #
    2023-06-21T05:53:31.245761  / # export SHELL=3D/bin/sh. /lava-362152/en=
vironment
    2023-06-21T05:53:31.246025  =

    2023-06-21T05:53:31.347107  / # . /lava-362152/environment/lava-362152/=
bin/lava-test-runner /lava-362152/1
    2023-06-21T05:53:31.348388  =

    2023-06-21T05:53:31.367304  / # /lava-362152/bin/lava-test-runner /lava=
-362152/1
    2023-06-21T05:53:31.383538  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-21T05:53:31.422438  + cd /lava-362152/1/tests/1_bootrr =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/649=
29066b4bd6041e9306221
        new failure (last pass: next-20230619)

    2023-06-21T05:53:33.818695  /lava-362152/1/../bin/lava-test-case
    2023-06-21T05:53:33.819174  <8>[   17.987238] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-06-21T05:53:33.819582  /lava-362152/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64929423dfdab7d9ce3061fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929423dfdab7d9ce306=
1fd
        failing since 62 days (last pass: next-20230417, first fail: next-2=
0230419) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 3          =


  Details:     https://kernelci.org/test/plan/id/649298d621a0b0f22730640c

  Results:     100 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.caam_jr-jr1-probed: https://kernelci.org/test/case/id/6=
49298d621a0b0f227306449
        failing since 7 days (last pass: next-20230607, first fail: next-20=
230613)

    2023-06-21T06:29:21.824782  /lava-362188/1/../bin/lava-test-case
    2023-06-21T06:29:21.828071  <8>[   41.185282] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr1-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr2-probed: https://kernelci.org/test/case/id/6=
49298d621a0b0f22730644a
        failing since 7 days (last pass: next-20230607, first fail: next-20=
230613)

    2023-06-21T06:29:22.847329  /lava-362188/1/../bin/lava-test-case
    2023-06-21T06:29:22.850503  <8>[   42.207246] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr2-probed RESULT=3Dfail>   =


  * baseline.bootrr.caam_jr-jr3-probed: https://kernelci.org/test/case/id/6=
49298d621a0b0f22730644b
        failing since 7 days (last pass: next-20230607, first fail: next-20=
230613)

    2023-06-21T06:29:23.911084  /lava-362188/1/../bin/lava-test-case
    2023-06-21T06:29:23.911584  <8>[   43.229093] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcaam_jr-jr3-probed RESULT=3Dfail>
    2023-06-21T06:29:23.911908  /lava-362188/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649299edbfe937e301306139

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299edbfe937e301306=
13a
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929461e3dd1d008f30615b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929461e3dd1d008f306=
15c
        failing since 35 days (last pass: next-20230516, first fail: next-2=
0230517) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/64929684836bafb2e83061de

  Results:     5 PASS, 2 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/x86/rootfs.cpio.gz =



  * baseline.bootrr.tpm-chip-is-online: https://kernelci.org/test/case/id/6=
4929684836bafb2e83061e1
        new failure (last pass: next-20230620)

    2023-06-21T06:19:16.936876  /usr/bin/tpm2_getcap

    2023-06-21T06:19:16.943625  <4>[   12.747003] process '/usr/bin/tpm2_ge=
tcap' started with executable stack

    2023-06-21T06:19:16.953450  <6>[   12.754925] tpm2_getcap[257]: segfaul=
t at f ip 000000000000000f sp 00000000fff7b4b0 error 14 likely on CPU 1 (co=
re 0, socket 0)

    2023-06-21T06:19:16.963199  <6>[   12.766687] Code: Unable to access op=
code bytes at 0xffffffffffffffe5.

    2023-06-21T06:19:17.975481  <6>[   13.774851] tpm2_getcap[259]: segfaul=
t at f ip 000000000000000f sp 00000000ffaf6ef0 error 14 likely on CPU 1 (co=
re 0, socket 0)

    2023-06-21T06:19:17.981857  <6>[   13.786601] Code: Unable to access op=
code bytes at 0xffffffffffffffe5.

    2023-06-21T06:19:18.995131  <6>[   14.794881] tpm2_getcap[261]: segfaul=
t at f ip 000000000000000f sp 00000000ffde4140 error 14 likely on CPU 1 (co=
re 0, socket 0)

    2023-06-21T06:19:19.001410  <6>[   14.806634] Code: Unable to access op=
code bytes at 0xffffffffffffffe5.

    2023-06-21T06:19:20.015030  <6>[   15.814771] tpm2_getcap[263]: segfaul=
t at f ip 000000000000000f sp 00000000ffd34870 error 14 likely on CPU 1 (co=
re 0, socket 0)

    2023-06-21T06:19:20.021399  <6>[   15.826522] Code: Unable to access op=
code bytes at 0xffffffffffffffe5.
 =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649291350c13a6967f30614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649291350c13a6967f306=
14e
        new failure (last pass: next-20230619) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492944c396681c70c306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492944c396681c70c306=
141
        failing since 1 day (last pass: next-20230616, first fail: next-202=
30619) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6492972743eaef2158306154

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492972743eaef2158306=
155
        failing since 0 day (last pass: next-20230619, first fail: next-202=
30620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649297a2418b6ce3b4306162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649297a2418b6ce3b4306=
163
        new failure (last pass: next-20230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929ad11ea5c1817430620a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929ad11ea5c18174306=
20b
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64929c0d79a4afd15b3061a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929c0d79a4afd15b306=
1a7
        failing since 6 days (last pass: next-20230614, first fail: next-20=
230615) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b24529c9841a4306142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b24529c9841a4306=
143
        failing since 147 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649298b0ea2699beec306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649298b0ea2699beec306=
134
        failing since 147 days (last pass: next-20230124, first fail: next-=
20230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a0610ee089a11c306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492a0610ee089a11c306=
132
        failing since 135 days (last pass: next-20230203, first fail: next-=
20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b38529c9841a430621d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b38529c9841a4306=
21e
        failing since 133 days (last pass: next-20230203, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-13 | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/649294ce54e809d2ae30614c

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-meson-gxl-s905x=
-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-baylibre/baseline-meson-gxl-s905x=
-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649294ce5=
4e809d2ae30614f
        new failure (last pass: next-20230619)

    2023-06-21T06:12:13.552530  /lava-3683290/1/../bin/lava-test-case
    2023-06-21T06:12:13.552781  <8>[   20.004337] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:12:13.552978  + set +x
    2023-06-21T06:12:13.553165  <8>[   20.020350] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 3683290_1.5.2.4.5>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
9294ce54e809d2ae306150
        new failure (last pass: next-20230619)

    2023-06-21T06:12:12.500305  /lava-3683290/1/../bin/lava-test-case
    2023-06-21T06:12:12.503416  <8>[   18.970313] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-13 | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/6492948ed4af11ad2e306135

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-meson-gxl-s905x-=
libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-meson-gxl-s905x-=
libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/6492948ed=
4af11ad2e306138
        new failure (last pass: next-20230619)

    2023-06-21T06:11:10.495914  /lava-645171/1/../bin/lava-test-case
    2023-06-21T06:11:10.510399  <8>[   19.910780] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:11:10.511000  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
92948ed4af11ad2e306139
        new failure (last pass: next-20230619)

    2023-06-21T06:11:09.473790  /lava-645171/1/../bin/lava-test-case
    2023-06-21T06:11:09.485252  <8>[   18.887866] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64929d2cd4c9071d3f306196

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/64929d2cd=
4c9071d3f306199
        new failure (last pass: next-20230619)

    2023-06-21T06:47:58.770840  /lava-3683616/1/../bin/lava-test-case
    2023-06-21T06:47:58.771440  <8>[   20.397497] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:47:58.771664  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
929d2cd4c9071d3f30619a
        new failure (last pass: next-20230619)

    2023-06-21T06:47:57.711983  /lava-3683616/1/../bin/lava-test-case
    2023-06-21T06:47:57.734762  <8>[   19.374592] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64929ab71ea5c1817430615f

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/64929ab71=
ea5c18174306162
        new failure (last pass: next-20230619)

    2023-06-21T06:37:20.749422  /lava-645464/1/../bin/lava-test-case
    2023-06-21T06:37:20.760845  <8>[   20.351954] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
929ab71ea5c18174306163
        new failure (last pass: next-20230619)

    2023-06-21T06:37:19.726223  /lava-645464/1/../bin/lava-test-case
    2023-06-21T06:37:19.738305  <8>[   19.328888] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/649290fe64b6476185306176

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649290fe6=
4b6476185306179
        new failure (last pass: next-20230619)

    2023-06-21T05:55:51.492453  /lava-3683166/1/../bin/lava-test-case
    2023-06-21T05:55:51.493152  <8>[   20.273605] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T05:55:51.493687  + set +x
    2023-06-21T05:55:51.494201  <8>[   20.280559] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 3683166_1.5.2.4.5>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
9290fe64b647618530617a
        new failure (last pass: next-20230619)

    2023-06-21T05:55:50.449570  /lava-3683166/1/../bin/lava-test-case
    2023-06-21T05:55:50.452794  <8>[   19.238490] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/649295590a8f9929ac306185

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649295590=
a8f9929ac306188
        new failure (last pass: next-20230620)

    2023-06-21T06:14:39.390316  /lava-3683306/1/../bin/lava-test-case
    2023-06-21T06:14:39.391354  <8>[   20.675087] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:14:39.392110  + set +x
    2023-06-21T06:14:39.392902  <8>[   20.681829] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 3683306_1.5.2.4.5>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
9295590a8f9929ac306189
        new failure (last pass: next-20230620)

    2023-06-21T06:14:38.325739  /lava-3683306/1/../bin/lava-test-case
    2023-06-21T06:14:38.349687  <8>[   19.640247] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/64929787ad16a7abf2306138

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/64929787a=
d16a7abf230613b
        new failure (last pass: next-20230620)

    2023-06-21T06:23:54.894303  /lava-3683443/1/../bin/lava-test-case
    2023-06-21T06:23:54.894620  <8>[   20.349393] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:23:54.894809  + set +x
    2023-06-21T06:23:54.894978  <8>[   20.357551] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 3683443_1.5.2.4.5>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
929787ad16a7abf230613c
        new failure (last pass: next-20230620)

    2023-06-21T06:23:53.833040  /lava-3683443/1/../bin/lava-test-case
    2023-06-21T06:23:53.854043  <8>[   19.315512] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/649298722fb1bcd9f6306161

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-l=
ibretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-l=
ibretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649298722=
fb1bcd9f6306164
        new failure (last pass: next-20230620)

    2023-06-21T06:27:47.120207  /lava-3683462/1/../bin/lava-test-case
    2023-06-21T06:27:47.120881  <8>[   19.767000] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:27:47.121221  + set +x
    2023-06-21T06:27:47.121518  <8>[   19.775132] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 3683462_1.5.2.4.5>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
9298722fb1bcd9f6306165
        new failure (last pass: next-20230620)

    2023-06-21T06:27:46.055383  /lava-3683462/1/../bin/lava-test-case
    2023-06-21T06:27:46.080039  <8>[   18.732474] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/649299161784e233bf306141

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649299161=
784e233bf306144
        new failure (last pass: next-20230616)

    2023-06-21T06:30:36.857447  /lava-3683484/1/../bin/lava-test-case
    2023-06-21T06:30:36.858044  <8>[   23.895300] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:30:36.858293  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
9299161784e233bf306145
        new failure (last pass: next-20230616)

    2023-06-21T06:30:35.803499  /lava-3683484/1/../bin/lava-test-case
    2023-06-21T06:30:35.827237  <8>[   22.872804] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929c169bbbb29cfa306155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929c169bbbb29cfa306=
156
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64929cb707360fbb89306132

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
929cb707360fbb89306166
        new failure (last pass: next-20230620)

    2023-06-21T06:45:48.065079  <3>[   19.630066] mmc0: error -84 whilst in=
itialising SD card
    2023-06-21T06:45:48.368881  /lava-3683560/1/../bin/lava-test-case
    2023-06-21T06:45:48.390739  <8>[   19.955323] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =


  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/64929cb70=
7360fbb89306167
        new failure (last pass: next-20230620)

    2023-06-21T06:45:49.426912  /lava-3683560/1/../bin/lava-test-case
    2023-06-21T06:45:49.428208  <8>[   20.978142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:45:49.428755  + set +x   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/64929dd9a899727f7f306137

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretech-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/64929dd9a=
899727f7f30613a
        new failure (last pass: next-20230620)

    2023-06-21T06:50:33.642640  /lava-3683633/1/../bin/lava-test-case
    2023-06-21T06:50:33.645671  <8>[   20.338812] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:50:33.645954  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
929dd9a899727f7f30613b
        new failure (last pass: next-20230620)

    2023-06-21T06:50:32.591290  /lava-3683633/1/../bin/lava-test-case
    2023-06-21T06:50:32.614200  <8>[   19.306389] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/6492915341e1e2539e306173

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649291534=
1e1e2539e306176
        new failure (last pass: next-20230619)

    2023-06-21T05:57:33.230641  /lava-645047/1/../bin/lava-test-case
    2023-06-21T05:57:33.244431  <8>[   20.257270] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T05:57:33.244805  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
92915341e1e2539e306177
        new failure (last pass: next-20230619)

    2023-06-21T05:57:32.208304  /lava-645047/1/../bin/lava-test-case
    2023-06-21T05:57:32.220315  <8>[   19.235095] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6492951b531f48d64730615a

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-meson-gx=
l-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/6492951b5=
31f48d64730615d
        new failure (last pass: next-20230620)

    2023-06-21T06:13:32.764707  /lava-645188/1/../bin/lava-test-case
    2023-06-21T06:13:32.777519  <8>[   20.552124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:13:32.778050  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
92951b531f48d64730615e
        new failure (last pass: next-20230620)

    2023-06-21T06:13:31.730151  /lava-645188/1/../bin/lava-test-case
    2023-06-21T06:13:31.742403  <8>[   19.517544] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/649297221221b204f9306146

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649297221=
221b204f9306149
        new failure (last pass: next-20230620)

    2023-06-21T06:22:17.651140  /lava-645319/1/../bin/lava-test-case
    2023-06-21T06:22:17.664603  <8>[   20.283428] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:22:17.665379  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
9297221221b204f930614a
        new failure (last pass: next-20230620)

    2023-06-21T06:22:16.628398  /lava-645319/1/../bin/lava-test-case
    2023-06-21T06:22:16.640347  <8>[   19.260825] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/649297aed6faa7a026306139

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-meson-gxl-s905x-li=
bretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-broonie/baseline-meson-gxl-s905x-li=
bretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/649297aed=
6faa7a02630613c
        new failure (last pass: next-20230620)

    2023-06-21T06:24:34.113753  /lava-645338/1/../bin/lava-test-case
    2023-06-21T06:24:34.127482  <8>[   19.852859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:24:34.128226  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
9297aed6faa7a02630613d
        new failure (last pass: next-20230620)

    2023-06-21T06:24:33.080002  /lava-645338/1/../bin/lava-test-case
    2023-06-21T06:24:33.092598  <8>[   18.819215] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/6492983c2b9a6305dc30614a

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/6492983c2=
b9a6305dc30614d
        new failure (last pass: next-20230616)

    2023-06-21T06:26:57.337351  /lava-645356/1/../bin/lava-test-case
    2023-06-21T06:26:57.349721  <8>[   23.935229] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
92983c2b9a6305dc30614e
        new failure (last pass: next-20230616)

    2023-06-21T06:26:56.315140  /lava-645356/1/../bin/lava-test-case
    2023-06-21T06:26:56.326916  <8>[   22.912491] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929a265ede8fe691306165

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929a265ede8fe691306=
166
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/64929a305ede8fe69130616a

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/64929a305=
ede8fe69130616d
        new failure (last pass: next-20230620)

    2023-06-21T06:35:09.670411  /lava-645410/1/../bin/lava-test-case
    2023-06-21T06:35:09.684521  <8>[   20.929096] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>
    2023-06-21T06:35:09.685180  + set +x   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
929a305ede8fe69130616e
        new failure (last pass: next-20230620)

    2023-06-21T06:35:08.371056  <3>[   19.620202] mmc0: error -84 whilst in=
itialising SD card
    2023-06-21T06:35:08.636160  /lava-645410/1/../bin/lava-test-case
    2023-06-21T06:35:08.648087  <8>[   19.895567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/64929abb1ea5c181743061a5

  Results:     50 PASS, 4 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sound-card: https://kernelci.org/test/case/id/64929abb1=
ea5c181743061a8
        new failure (last pass: next-20230620)

    2023-06-21T06:37:30.972155  /lava-645478/1/../bin/lava-test-case
    2023-06-21T06:37:30.983302  <8>[   20.403059] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card RESULT=3Dfail>   =


  * baseline.bootrr.sound-card-probed: https://kernelci.org/test/case/id/64=
929abb1ea5c181743061a9
        new failure (last pass: next-20230620)

    2023-06-21T06:37:29.949693  /lava-645478/1/../bin/lava-test-case
    2023-06-21T06:37:29.961195  <8>[   19.380232] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsound-card-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929a05c1c8942cd6306144

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8173=
-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929a05c1c8942cd6306=
145
        failing since 147 days (last pass: next-20230123, first fail: next-=
20230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/649298a9ea2699beec30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649298a9ea2699beec306=
12f
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b09907b3ca75e30613a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8183=
-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b09907b3ca75e306=
13b
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b02907b3ca75e30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-mt8192=
-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b02907b3ca75e306=
130
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6492b52a9a23a1d951306143

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492b52a9a23a1d951306=
144
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6492bb570e6ee1f12030612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom=
-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492bb570e6ee1f120306=
12f
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64929930a0765a4bac30615a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929930a0765a4bac306=
15b
        failing since 280 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64929995c8cb93bf16306140

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929995c8cb93bf16306=
141
        failing since 280 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6492990bb3697bb1d6306174

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492990bb3697bb1d6306=
175
        failing since 280 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64929933c59ef52dfb306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929933c59ef52dfb306=
132
        failing since 278 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649299d4ed441fdf14306189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299d4ed441fdf14306=
18a
        failing since 278 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6492990d5b538a525130612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492990d5b538a5251306=
130
        failing since 278 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64929934c59ef52dfb306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929934c59ef52dfb306=
135
        failing since 278 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649299d56031bc3d5e306141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299d56031bc3d5e306=
142
        failing since 278 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6492990f1784e233bf30613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492990f1784e233bf306=
13d
        failing since 278 days (last pass: next-20220907, first fail: next-=
20220915) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64929932c59ef52dfb30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929932c59ef52dfb306=
12f
        failing since 280 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/649299973d654a8d4430615f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299973d654a8d44306=
160
        failing since 280 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6492990e5b538a5251306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492990e5b538a5251306=
134
        failing since 280 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492941f388a3c9cce30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492941f388a3c9cce306=
13e
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649294d554e809d2ae306198

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649294d554e809d2ae306=
199
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649293fa80358d142f306202

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649293fa80358d142f306=
203
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492941d169f1e966f306245

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492941d169f1e966f306=
246
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649294d354e809d2ae30618a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649294d354e809d2ae306=
18b
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649293f968ea43c4a530613e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649293f968ea43c4a5306=
13f
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10   | malta_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6492922a782542ee68306131

  Results:     4 PASS, 1 FAIL, 2 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/mipsel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6492922a782542e=
e68306139
        new failure (last pass: next-20230620)
        1 lines

    2023-06-21T06:00:52.307593  kern  :alert : CPU 0 Unable to handle kerne=
l paging request at virtual address 1a6ce378, epc =3D=3D 801ffee8, ra =3D=
=3D 80202894
    2023-06-21T06:00:52.307802  =


    2023-06-21T06:00:52.337514  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>
    2023-06-21T06:00:52.337689  =

   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10   | shmobi=
le_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649291b0dd52b8a425306178

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649291b0dd52b8a425306=
179
        failing since 7 days (last pass: next-20230609, first fail: next-20=
230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6492c68f985dcb53f430612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492c68f985dcb53f4306=
12f
        failing since 6 days (last pass: next-20230601, first fail: next-20=
230615) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/649294e354e809d2ae30619f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649294e354e809d2ae306=
1a0
        failing since 6 days (last pass: next-20230613, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64929f5ba6a61d28de306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929f5ba6a61d28de306=
134
        failing since 7 days (last pass: next-20230608, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649291b0fd00c577ae306137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649291b0fd00c577ae306=
138
        failing since 6 days (last pass: next-20230613, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649296729764ccb49630618e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649296729764ccb496306=
18f
        failing since 5 days (last pass: next-20230613, first fail: next-20=
230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6492983e2b9a6305dc306189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492983e2b9a6305dc306=
18a
        failing since 5 days (last pass: next-20230608, first fail: next-20=
230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/649299a64bff1d3d57306137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299a64bff1d3d57306=
138
        failing since 7 days (last pass: next-20230609, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b0ed0fcf992ac306147

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b0ed0fcf992ac306=
148
        failing since 7 days (last pass: next-20230613, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929df220babf2c21306157

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929df220babf2c21306=
158
        failing since 6 days (last pass: next-20230613, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a0eb78a70de439306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492a0eb78a70de439306=
133
        failing since 7 days (last pass: next-20230613, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a2662e28e6f57b306177

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492a2662e28e6f57b306=
178
        failing since 7 days (last pass: next-20230613, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649297b1aff973ed7f30613d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649297b1aff973ed7f306=
13e
        failing since 210 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649296ae3ef99b21b230615c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649296ae3ef99b21b2306=
15d
        failing since 210 days (last pass: next-20221121, first fail: next-=
20221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | clang-13 | cros:/=
/chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/64929419dfdab7d9ce3061ee

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-b=
aylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929419dfdab7d9ce3061f3
        failing since 12 days (last pass: next-20221012, first fail: next-2=
0230609)

    2023-06-21T06:09:15.725408  [    5.059541] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3683256_1.5.2.4.1>
    2023-06-21T06:09:15.829894  =

    2023-06-21T06:09:15.931422  / # #export SHELL=3D/bin/sh
    2023-06-21T06:09:15.931893  =

    2023-06-21T06:09:16.033311  / # export SHELL=3D/bin/sh. /lava-3683256/e=
nvironment
    2023-06-21T06:09:16.033891  =

    2023-06-21T06:09:16.135268  / # . /lava-3683256/environment/lava-368325=
6/bin/lava-test-runner /lava-3683256/1
    2023-06-21T06:09:16.136036  =

    2023-06-21T06:09:16.139483  / # /lava-3683256/bin/lava-test-runner /lav=
a-3683256/1
    2023-06-21T06:09:16.198369  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/64929095250a4ebe29306147

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929095250a4ebe2930614c
        failing since 140 days (last pass: next-20221012, first fail: next-=
20230201)

    2023-06-21T05:54:10.654996  [   23.526258] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3683179_1.5.2.4.1>
    2023-06-21T05:54:10.764841  =

    2023-06-21T05:54:10.866789  / # #export SHELL=3D/bin/sh
    2023-06-21T05:54:10.867599  =

    2023-06-21T05:54:10.969042  / # export SHELL=3D/bin/sh. /lava-3683179/e=
nvironment
    2023-06-21T05:54:10.969817  =

    2023-06-21T05:54:11.071255  / # . /lava-3683179/environment/lava-368317=
9/bin/lava-test-runner /lava-3683179/1
    2023-06-21T05:54:11.072449  =

    2023-06-21T05:54:11.075747  / # /lava-3683179/bin/lava-test-runner /lav=
a-3683179/1
    2023-06-21T05:54:11.123933  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64929483c42d896f37306135

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-rk3328-=
rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64929483c42d896f3730613a
        failing since 47 days (last pass: next-20221012, first fail: next-2=
0230504)

    2023-06-21T06:10:42.592384  [   24.224066] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3683326_1.5.2.4.1>
    2023-06-21T06:10:42.696935  =

    2023-06-21T06:10:42.798302  / # #export SHELL=3D/bin/sh
    2023-06-21T06:10:42.798663  =

    2023-06-21T06:10:42.899955  / # export SHELL=3D/bin/sh. /lava-3683326/e=
nvironment
    2023-06-21T06:10:42.900289  =

    2023-06-21T06:10:43.001403  / # . /lava-3683326/environment/lava-368332=
6/bin/lava-test-runner /lava-3683326/1
    2023-06-21T06:10:43.001927  =

    2023-06-21T06:10:43.005323  / # /lava-3683326/bin/lava-test-runner /lav=
a-3683326/1
    2023-06-21T06:10:43.050465  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3328-rock64                | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649297627696ed770a306131

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649297627696ed770a306136
        failing since 140 days (last pass: next-20221012, first fail: next-=
20230201)

    2023-06-21T06:23:22.700207  [   29.695685] <LAVA_SIGNAL_ENDRUN 0_dmesg =
3683469_1.5.2.4.1>
    2023-06-21T06:23:22.804206  =

    2023-06-21T06:23:22.905342  / # #export SHELL=3D/bin/sh
    2023-06-21T06:23:22.905747  =

    2023-06-21T06:23:23.007049  / # export SHELL=3D/bin/sh. /lava-3683469/e=
nvironment
    2023-06-21T06:23:23.007473  =

    2023-06-21T06:23:23.108918  / # . /lava-3683469/environment/lava-368346=
9/bin/lava-test-runner /lava-3683469/1
    2023-06-21T06:23:23.109604  =

    2023-06-21T06:23:23.113067  / # /lava-3683469/bin/lava-test-runner /lav=
a-3683469/1
    2023-06-21T06:23:23.161076  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929afed0fcf992ac306136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-rk3399=
-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929afed0fcf992ac306=
137
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649297e8fa9854f901306141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649297e8fa9854f901306=
142
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b0b430b86e249306138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b0b430b86e249306=
139
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b20529c9841a430613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-collabora/baseline-sc7180=
-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b20529c9841a4306=
13d
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230208) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a35962c31c664930612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492a35962c31c6649306=
12f
        failing since 7 days (last pass: next-20230608, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64929eff95be182755306134

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929eff95be182755306=
135
        failing since 7 days (last pass: next-20230608, first fail: next-20=
230614) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/6492928b56b18854c8306161

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492928b56b18854c8306=
162
        failing since 7 days (last pass: next-20230609, first fail: next-20=
230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649299588c8cbd6a00306153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-sun50i-=
a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299588c8cbd6a00306=
154
        failing since 63 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/64929b4cf05ac0fe4b306141

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929b4cf05ac0fe4b306=
142
        failing since 5 days (last pass: next-20230608, first fail: next-20=
230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/64929d1813ea3116f0306131

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929d1813ea3116f0306=
132
        failing since 14 days (last pass: next-20230606, first fail: next-2=
0230607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a4febe12dd4fc830613c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492a4febe12dd4fc8306=
13d
        failing since 7 days (last pass: next-20230608, first fail: next-20=
230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649292bb06e265dd34306179

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649292bb06e265dd34306=
17a
        failing since 7 days (last pass: next-20230609, first fail: next-20=
230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649295899839f730e8306401

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649295899839f730e8306=
402
        failing since 63 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6492985a1f6bd19bca30613f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492985a1f6bd19bca306=
140
        failing since 5 days (last pass: next-20230608, first fail: next-20=
230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/649299aea7683dc9cc306137

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299aea7683dc9cc306=
138
        failing since 14 days (last pass: next-20230606, first fail: next-2=
0230607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929c5955d762992730614d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929c5955d7629927306=
14e
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64929dabae40609e26306150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929dabae40609e26306=
151
        failing since 7 days (last pass: next-20230609, first fail: next-20=
230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a053590a659673306173

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492a053590a659673306=
174
        failing since 7 days (last pass: next-20230608, first fail: next-20=
230613) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | clang-17 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/649299ea87fcb2ce1830614a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig/clang-17/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299ea87fcb2ce18306=
14b
        failing since 14 days (last pass: next-20230605, first fail: next-2=
0230607) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/649291a1fd00c577ae30612f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649291a1fd00c577ae306=
130
        failing since 4 days (last pass: next-20230614, first fail: next-20=
230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649294eb42866d72df30612e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-broonie/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649294eb42866d72df306=
12f
        failing since 63 days (last pass: v6.3-rc6-12018-gd3f2cd248191, fir=
st fail: next-20230417) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6492977dc52e52d5a830614a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6492977dc52e52d5a8306=
14b
        failing since 4 days (last pass: next-20230615, first fail: next-20=
230616) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/649298aa15b5444f50306132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649298aa15b5444f50306=
133
        failing since 133 days (last pass: next-20230206, first fail: next-=
20230207) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/649299febfe937e30130616b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/649299febfe937e301306=
16c
        new failure (last pass: next-20230620) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649292018a868d8a30306152

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649292018a868d8a30306157
        failing since 14 days (last pass: next-20230525, first fail: next-2=
0230607)

    2023-06-21T06:00:03.187219  =

    2023-06-21T06:00:03.288468  / # #export SHELL=3D/bin/sh
    2023-06-21T06:00:03.288844  =

    2023-06-21T06:00:03.389978  / # export SHELL=3D/bin/sh. /lava-3683210/e=
nvironment
    2023-06-21T06:00:03.390423  =

    2023-06-21T06:00:03.491635  / # . /lava-3683210/environment/lava-368321=
0/bin/lava-test-runner /lava-3683210/1
    2023-06-21T06:00:03.492167  =

    2023-06-21T06:00:03.532826  / # /lava-3683210/bin/lava-test-runner /lav=
a-3683210/1
    2023-06-21T06:00:03.630672  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-21T06:00:03.631224  + cd /lava-3683210/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/649292de0fab538f3530614d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649292de0fab538f35306152
        failing since 14 days (last pass: next-20230517, first fail: next-2=
0230607)

    2023-06-21T06:03:50.821657  <8>[   13.612221] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3683244_1.5.2.4.1>
    2023-06-21T06:03:50.925372  / # #
    2023-06-21T06:03:51.027091  export SHELL=3D/bin/sh
    2023-06-21T06:03:51.027465  #
    2023-06-21T06:03:51.128468  / # export SHELL=3D/bin/sh. /lava-3683244/e=
nvironment
    2023-06-21T06:03:51.128889  =

    2023-06-21T06:03:51.230171  / # . /lava-3683244/environment/lava-368324=
4/bin/lava-test-runner /lava-3683244/1
    2023-06-21T06:03:51.230737  =

    2023-06-21T06:03:51.276887  / # /lava-3683244/bin/lava-test-runner /lav=
a-3683244/1
    2023-06-21T06:03:51.317032  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/649294fb955108339e30613d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/649294fb955108339e306142
        failing since 14 days (last pass: next-20230525, first fail: next-2=
0230607)

    2023-06-21T06:13:01.046987  / # #
    2023-06-21T06:13:01.150464  export SHELL=3D/bin/sh
    2023-06-21T06:13:01.151326  #
    2023-06-21T06:13:01.253338  / # export SHELL=3D/bin/sh. /lava-3683377/e=
nvironment
    2023-06-21T06:13:01.254270  =

    2023-06-21T06:13:01.356369  / # . /lava-3683377/environment/lava-368337=
7/bin/lava-test-runner /lava-3683377/1
    2023-06-21T06:13:01.357843  =

    2023-06-21T06:13:01.368863  / # /lava-3683377/bin/lava-test-runner /lav=
a-3683377/1
    2023-06-21T06:13:01.496829  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-21T06:13:01.497883  + cd /lava-3683377/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6492955b3197c1eeb0306130

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-cu=
bieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492955b3197c1eeb0306135
        failing since 14 days (last pass: next-20230525, first fail: next-2=
0230607)

    2023-06-21T06:14:37.767573  / # #
    2023-06-21T06:14:37.870624  export SHELL=3D/bin/sh
    2023-06-21T06:14:37.871525  #
    2023-06-21T06:14:37.973667  / # export SHELL=3D/bin/sh. /lava-3683406/e=
nvironment
    2023-06-21T06:14:37.974734  =

    2023-06-21T06:14:38.076920  / # . /lava-3683406/environment/lava-368340=
6/bin/lava-test-runner /lava-3683406/1
    2023-06-21T06:14:38.078355  =

    2023-06-21T06:14:38.090278  / # /lava-3683406/bin/lava-test-runner /lav=
a-3683406/1
    2023-06-21T06:14:38.199781  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-21T06:14:38.203306  + cd /lava-3683406/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | clang-17 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a4f3be12dd4fc830612e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-17 (Debian clang version 17.0.0 (++20230619112049+9ef7=
3f2f58ec-1~exp1~20230619112157.719))
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/clang-17/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492a4f3be12dd4fc8306133
        failing since 19 days (last pass: next-20230516, first fail: next-2=
0230601)

    2023-06-21T07:21:10.250653  / # #
    2023-06-21T07:21:10.356481  export SHELL=3D/bin/sh
    2023-06-21T07:21:10.358336  #
    2023-06-21T07:21:10.461788  / # export SHELL=3D/bin/sh. /lava-3683218/e=
nvironment
    2023-06-21T07:21:10.463314  =

    2023-06-21T07:21:10.566947  / # . /lava-3683218/environment/lava-368321=
8/bin/lava-test-runner /lava-3683218/1
    2023-06-21T07:21:10.569973  =

    2023-06-21T07:21:10.574544  / # /lava-3683218/bin/lava-test-runner /lav=
a-3683218/1
    2023-06-21T07:21:10.702390  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-21T07:21:10.703436  + cd /lava-3683218/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a6974449c47e7e306159

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-su=
n7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492a6974449c47e7e30615e
        failing since 19 days (last pass: next-20230516, first fail: next-2=
0230601)

    2023-06-21T07:28:11.923448  <8>[   14.149116] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3683249_1.5.2.4.1>
    2023-06-21T07:28:12.049852  / # #
    2023-06-21T07:28:12.160119  export SHELL=3D/bin/sh
    2023-06-21T07:28:12.161594  #
    2023-06-21T07:28:12.264916  / # export SHELL=3D/bin/sh. /lava-3683249/e=
nvironment
    2023-06-21T07:28:12.266406  =

    2023-06-21T07:28:12.369703  / # . /lava-3683249/environment/lava-368324=
9/bin/lava-test-runner /lava-3683249/1
    2023-06-21T07:28:12.372391  =

    2023-06-21T07:28:12.380181  / # /lava-3683249/bin/lava-test-runner /lav=
a-3683249/1
    2023-06-21T07:28:12.489971  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a75f5bb0ff5ea4306140

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492a75f5bb0ff5ea4306145
        failing since 19 days (last pass: next-20230516, first fail: next-2=
0230601)

    2023-06-21T07:31:27.666546  / # #
    2023-06-21T07:31:27.772037  export SHELL=3D/bin/sh
    2023-06-21T07:31:27.773558  #
    2023-06-21T07:31:27.876940  / # export SHELL=3D/bin/sh. /lava-3683368/e=
nvironment
    2023-06-21T07:31:27.878466  =

    2023-06-21T07:31:27.981898  / # . /lava-3683368/environment/lava-368336=
8/bin/lava-test-runner /lava-3683368/1
    2023-06-21T07:31:27.984590  =

    2023-06-21T07:31:27.991667  / # /lava-3683368/bin/lava-test-runner /lav=
a-3683368/1
    2023-06-21T07:31:28.127163  + export 'TESTRUN_ID=3D1_bootrr'
    2023-06-21T07:31:28.128358  + cd /lava-3683368/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun7i-a20-olinuxino-lime2    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6492a86472bb31b3cb30614a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-sun7i-a20-ol=
inuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6492a86472bb31b3cb30614f
        failing since 19 days (last pass: next-20230516, first fail: next-2=
0230601)

    2023-06-21T07:35:46.609805  <8>[   15.401503] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3683397_1.5.2.4.1>
    2023-06-21T07:35:46.728954  / # #
    2023-06-21T07:35:46.834798  export SHELL=3D/bin/sh
    2023-06-21T07:35:46.836367  #
    2023-06-21T07:35:46.939654  / # export SHELL=3D/bin/sh. /lava-3683397/e=
nvironment
    2023-06-21T07:35:46.941161  =

    2023-06-21T07:35:47.044617  / # . /lava-3683397/environment/lava-368339=
7/bin/lava-test-runner /lava-3683397/1
    2023-06-21T07:35:47.047196  =

    2023-06-21T07:35:47.054197  / # /lava-3683397/bin/lava-test-runner /lav=
a-3683397/1
    2023-06-21T07:35:47.180872  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/64929a46a80bfcc065306238

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929a46a80bfcc065306=
239
        failing since 13 days (last pass: next-20230605, first fail: next-2=
0230608) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/64929c4eb49d7d2297306133

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230621/arm6=
4/defconfig+arm64-chromebook+kselftest/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230609.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64929c4eb49d7d2297306=
134
        failing since 15 days (last pass: next-20230601, first fail: next-2=
0230606) =

 =20
