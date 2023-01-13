Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE2F2669304
	for <lists+linux-next@lfdr.de>; Fri, 13 Jan 2023 10:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbjAMJeH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Jan 2023 04:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241220AbjAMJ2k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Jan 2023 04:28:40 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28223FC8D
        for <linux-next@vger.kernel.org>; Fri, 13 Jan 2023 01:25:58 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id i1so693730pfk.3
        for <linux-next@vger.kernel.org>; Fri, 13 Jan 2023 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oezM2nNdRapUeTYMma3klInMnpxgeC4EJqjy1qmIFCI=;
        b=xWuGOgNrPr4fAeCNFyoecapRX0KOEVo+WQFK8DKL6yTgmTDLMWSxbRqp6/EVnilE7y
         fq1GDBSnmB4bW98uQ5cQgcMr9iKF9327S+zMIH7sr/M737Kd+qhOWWUHPwMYmOUhKpM2
         8WTViqRwc4di6jlg6qszC54yA89xH/qaCYSEGBGPXfT7s+AydTvQ0/SHgwmiSfMOp9U/
         R9DKQhh6DmT8bn65Tb2vBukE2eJZeg+7Z0YoOnU/4FBJq4svx2XScPKizaVd4l1op0G9
         1xw1mlhfpc8ZtDFmjDV75Zn8vihUI8RxiYlc6/drnh1z/WvF79Ru5kWYXolyFvqIOSXN
         K10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oezM2nNdRapUeTYMma3klInMnpxgeC4EJqjy1qmIFCI=;
        b=A4aHj4Otbx2QNbAgSACKAaVwmbNcBwFlnojb2mqxqdh1gGLth1jfcjOflXCPlFhZdW
         +3hxbPN7NwzxUlmLCtoGUKA4fKGZea7lSvWLZecH9/I/7RxwYT7HZ6DRDaAuEBe5PRI/
         eYsnuVvdDJ1dDUPMIQdqs3ph1tUW+LawhfHOGkNZ47jhZRT0Zn5P17KCjfvn5vcoXS+k
         BNAi8tkLiDnfl4btjfKzaiTAOMUbKXWAPlwVBdPLbNA586nUkST/AAGsxU2JbEwRlaDT
         GpsMtzI+icfHKb3DGoyxXM6DrgzQAuLb1eBcQdeXcHvLChW/xdtRON7oLSosNksFxAXc
         0vEA==
X-Gm-Message-State: AFqh2kqgHK7D3V4yoE2pyiMUwBVf5mZ4e53V4ta5EiZYJwFEcp67aGCs
        WoDnTds/678K5vkTzpACHM4CucrFFqSNJ+MOc6LOGg==
X-Google-Smtp-Source: AMrXdXtoDysMPdEmIeXus/39YfdDY2NO7RKLdL3AswUQ4hWBOgjJ/XbBmvQ8NzyVU9lX2f1Of8kQeA==
X-Received: by 2002:aa7:8f09:0:b0:587:364f:17f5 with SMTP id x9-20020aa78f09000000b00587364f17f5mr9293403pfr.7.1673601956103;
        Fri, 13 Jan 2023 01:25:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a203-20020a621ad4000000b00580e3917af7sm10135583pfa.117.2023.01.13.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:25:55 -0800 (PST)
Message-ID: <63c123a3.620a0220.2f52e.106b@mx.google.com>
Date:   Fri, 13 Jan 2023 01:25:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230113
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 472 runs, 357 regressions (next-20230113)
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

next/master baseline: 472 runs, 357 regressions (next-20230113)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | clang-16   | mult=
i_v7_defconfig           | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defconfig           | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | omap=
2plus_defconfig          | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

at91sam9g20ek                | arm    | lab-broonie     | clang-16   | mult=
i_v5_defconfig           | 1          =

at91sam9g20ek                | arm    | lab-broonie     | gcc-10     | mult=
i_v5_defconfig           | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10     | bcm2=
835_defconfig            | 1          =

beaglebone-black             | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | clang-16   | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defconfig           | 1          =

beaglebone-black             | arm    | lab-broonie     | gcc-10     | omap=
2plus_defconfig          | 1          =

beaglebone-black             | arm    | lab-cip         | gcc-10     | omap=
2plus_defconfig          | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | clang-16   | mult=
i_v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6q-udoo                   | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | clang-16   | mult=
i_v7_defconfig           | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | clang-16   | defc=
onfig                    | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | clang-16   | mult=
i_v7_defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | clang-16   | mult=
i_v7_defconfig           | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 1          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 1          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

odroid-xu3                   | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | exyn=
os_defconfig             | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+crypto             | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig                    | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+videodec           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+ima                | 1          =

qemu_arm-vexpress-a15        | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =

qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =

qemu_i386                    | i386   | lab-broonie     | clang-16   | i386=
_defconfig               | 1          =

qemu_i386                    | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386                    | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | clang-16   | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | clang-16   | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =

qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =

qemu_mips-malta              | mips   | lab-broonie     | gcc-10     | malt=
a_defconfig              | 1          =

qemu_mips-malta              | mips   | lab-collabora   | gcc-10     | malt=
a_defconfig              | 1          =

qemu_riscv64                 | riscv  | lab-broonie     | clang-16   | defc=
onfig                    | 1          =

qemu_riscv64                 | riscv  | lab-collabora   | clang-16   | defc=
onfig                    | 1          =

qemu_riscv64                 | riscv  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

qemu_riscv64                 | riscv  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | clang-16   | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | clang-16   | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64                  | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-16   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-16   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-16   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-16   | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =

r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =

r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | clang-13   | cros=
://chrome...avour.config | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+crypto             | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+videodec           | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+ima                | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-13   | cros=
://chrome...avour.config | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =

sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+crypto             | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+videodec           | 1          =

sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+ima                | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+crypto             | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+ima                | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-a33-olinuxino          | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =

sun8i-a33-olinuxino          | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a33-olinuxino          | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun8i-a33-olinuxino          | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =

sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...BIG_ENDIAN=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =

sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230113/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230113
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6b31ffe9c8b9947d6d3552d6e10752fd96d0f80f =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2261502c5ae331d39d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-cb3=
17-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-acer-cb3=
17-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2261502c5ae331d3=
9d1
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec371af7bcb64b1d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-cb317-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-ace=
r-cb317-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec371af7bcb64b1d3=
9c4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
acer-cb317-1h-c3z6-dedede    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec6049e82b8a6b1d39d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-cb317=
-1h-c3z6-dedede.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-acer-cb317=
-1h-c3z6-dedede.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec6049e82b8a6b1d3=
9d7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c122057f8224d79f1d39d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c122057f8224d79f1d3=
9d8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c121080e643fa46b1d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c121080e643fa46b1d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c121fae0a158fef41d39d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c121fae0a158fef41d3=
9d1
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1222149a1b3800a1d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1222149a1b3800a1d3=
9df
        failing since 121 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10     | omap=
2plus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c121d1b41a01ef2a1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
omap2plus_defconfig/gcc-10/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c121d1b41a01ef2a1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f620577d42b7ab1d39ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C43=
3TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C43=
3TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f620577d42b7ab1d3=
9ee
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ecaa0e6de7a8181d39d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C433TA-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C433TA-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ecaa0e6de7a8181d3=
9d7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C433TA-AJ0005-rammus    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee127f6447ed8e1d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C433T=
A-AJ0005-rammus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C433T=
A-AJ0005-rammus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee127f6447ed8e1d3=
9dc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f7741b75e61ca11d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C43=
6FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C43=
6FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f7741b75e61ca11d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec837100c6386e1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C436FA-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec837100c6386e1d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C436FA-Flip-hatch       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edafc063a71e771d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C436F=
A-Flip-hatch.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edafc063a71e771d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ffe958dca0bca31d39ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-C52=
3NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ffe958dca0bca31d3=
9cf
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee8a44620b27631d39e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee8a44620b27631d3=
9e4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-C523NA-A20057-coral     | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2ecbdd8647e6a1d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-C523N=
A-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2ecbdd8647e6a1d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f229b698d1557c1d39c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-cx9=
400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-asus-cx9=
400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f229b698d1557c1d3=
9c8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec1f95209ec4151d39e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-asu=
s-cx9400-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec1f95209ec4151d3=
9e1
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
asus-cx9400-volteer          | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec5c49e82b8a6b1d39c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-asus-cx940=
0-volteer.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec5c49e82b8a6b1d3=
9ca
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | clang-16   | mult=
i_v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed7c632d019b7a1d39cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v5_defconfig/clang-16/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v5_defconfig/clang-16/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed7c632d019b7a1d3=
9ce
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
at91sam9g20ek                | arm    | lab-broonie     | gcc-10     | mult=
i_v5_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f025ca695195851d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v5_defconfig/gcc-10/lab-broonie/baseline-at91sam9g20ek.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f025ca695195851d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10     | bcm2=
835_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec68175b5832b51d3a5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec68175b5832b51d3=
a5b
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f01eecf9809e6d1d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f01eecf9809e6d1d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f47730c15a75481d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f47730c15a75481d3=
9e5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed9420c625910b1d39dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed9420c625910b1d3=
9de
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f17211a5b08a721d3a12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f17211a5b08a721d3=
a13
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed82281893045f1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed82281893045f1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fd877623e33ddb1d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fd877623e33ddb1d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-broonie     | gcc-10     | omap=
2plus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef4cb6b0b3c3d11d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
omap2plus_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef4cb6b0b3c3d11d3=
9d5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
beaglebone-black             | arm    | lab-cip         | gcc-10     | omap=
2plus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef262d1233604c1d39eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
omap2plus_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef262d1233604c1d3=
9ec
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f56cd8373186111d39e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f56cd8373186111d3=
9e4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec21213884449b1d3a1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec21213884449b1d3=
a1f
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
dell-latitude...4305U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed9db16ea5c1ba1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-4305U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed9db16ea5c1ba1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2d80966ac76861d39da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-dell-lat=
itude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2d80966ac76861d3=
9db
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec381af7bcb64b1d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-del=
l-latitude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec381af7bcb64b1d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
dell-latitude...8665U-sarien | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec62175b5832b51d3a55

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-dell-latit=
ude-5400-8665U-sarien.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec62175b5832b51d3=
a56
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10ab18c6a9fd5011d39e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-11A-G=
6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10ab18c6a9fd5011d3=
9e2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef4222694dc6401d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef4222694dc6401d3=
9df
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f74ecaa88fc37f1d39e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f74ecaa88fc37f1d3=
9e2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c101db10be047e7c1d39dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c101db10be047e7c1d3=
9dd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eef0043379c5241d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-12b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eef0043379c5241d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-12b-c...4020-octopus | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0588b098de5f21d3a09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-12=
b-ca0010nr-n4020-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0588b098de5f21d3=
a0a
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f5d54daa99dd281d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-hp-x360-=
14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f5d54daa99dd281d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed2419dd6b42ba1d39ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-hp-=
x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed2419dd6b42ba1d3=
9ed
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
hp-x360-14-G1-sona           | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed9fb16ea5c1ba1d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-x360-14=
-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed9fb16ea5c1ba1d3=
9d5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f83ef72b1d46f71d39eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f83ef72b1d46f71d3=
9ec
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f4ceb7aa3229121d39dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f4ceb7aa3229121d3=
9dd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee8e4bd66663961d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6dl-ri=
otboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee8e4bd66663961d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f14acb75f57f1d1d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f14acb75f57f1d1d3=
9d0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f9921299ee8fd31d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f9921299ee8fd31d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fe1a922c6287321d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fe1a922c6287321d3=
9c3
        failing since 156 days (last pass: next-20220808, first fail: next-=
20220810) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f15560c101a2cd1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f15560c101a2cd1d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef9f21d0a9e5d31d3a0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef9f21d0a9e5d31d3=
a0e
        failing since 216 days (last pass: next-20220607, first fail: next-=
20220610) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ede4fd296f0f221d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ede4fd296f0f221d3=
9df
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6dl-udoo                  | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2a968ecf78e591d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2a968ecf78e591d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c104f462e8f502a41d39ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c104f462e8f502a41d3=
a00
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee37162060a6e51d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-imx6q-sabre=
lite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee37162060a6e51d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c103b27f66a9633a1d39c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-i=
mx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c103b27f66a9633a1d3=
9c5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-sabrelite              | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10507ddc95f9a071d39e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10507ddc95f9a071d3=
9e9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0ca2d5eef0a5b1d39d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0ca2d5eef0a5b1d3=
9d9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef25cf3c596a541d3a5e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef25cf3c596a541d3=
a5f
        failing since 127 days (last pass: next-20220831, first fail: next-=
20220907) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed80632d019b7a1d39d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-imx=
6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed80632d019b7a1d3=
9d1
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6q-udoo                   | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f21dc736c40d801d3a0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f21dc736c40d801d3=
a0f
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1c2dfb2ede5b91d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx6qp-wandboard-revd1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1c2dfb2ede5b91d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | imx_=
v6_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f01e4e020ddf591d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f01e4e020ddf591d3=
9e5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed26e02b2331361d39f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6qp-wa=
ndboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed26e02b2331361d3=
9f2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee7adb948271721d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee7adb948271721d3=
9da
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f316d44ea1d6531d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-revd1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f316d44ea1d6531d3=
9da
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f47d8bae5d96fa1d39cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baseline-imx6qp-wandboard-r=
evd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f47d8bae5d96fa1d3=
9ce
        failing since 143 days (last pass: next-20220810, first fail: next-=
20220822) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | clang-16   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0efa6e20d5b08f71d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/clang-16/lab-clabbe/baseline-jh7100-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/clang-16/lab-clabbe/baseline-jh7100-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0efa6e20d5b08f71d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e9150394f031cd1d3a38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e9150394f031cd1d3=
a39
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef9921d0a9e5d31d3a07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef9921d0a9e5d31d3=
a08
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f205c736c40d801d3a02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-juno-uboo=
t.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-juno-uboo=
t.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f205c736c40d801d3=
a03
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f359b8624e48fe1d39d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f359b8624e48fe1d3=
9d8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f616577d42b7ab1d39e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f616577d42b7ab1d3=
9ea
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
juno-uboot                   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f76afc478daf881d39e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-juno-uboot.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-juno-uboot.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f76afc478daf881d3=
9e6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef7f49d9b564921d39df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef7f49d9b564921d3=
9e0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f5d2f44f6beae01d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f5d2f44f6beae01d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f761902dea1ac71d39f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f761902dea1ac71d3=
9f2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ff6e23122ba90c1d3a3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ff6e23122ba90c1d3=
a3e
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c100eb6db22990621d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c100eb6db22990621d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f40684505aab961d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f40684505aab961d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ecfd9d4eaf53ca1d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ecfd9d4eaf53ca1d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f4a6fcba630acd1d39e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f4a6fcba630acd1d3=
9e8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3f059868ae5101d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3f059868ae5101d3=
9e5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ecfb9d4eaf53ca1d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-8g.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ecfb9d4eaf53ca1d3=
9d0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-kswitch-d10-mmt-8g   | arm    | lab-kontron     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f493fcba630acd1d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-8g.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f493fcba630acd1d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef80c096ac09be1d3a26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef80c096ac09be1d3=
a27
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f418fda785f9391d39f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f418fda785f9391d3=
9f4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f764902dea1ac71d39f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f764902dea1ac71d3=
9f5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fdca7623e33ddb1d3a05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fdca7623e33ddb1d3=
a06
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c102a341a410f6671d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c102a341a410f6671d3=
9dc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1031e0ad3888f401d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1031e0ad3888f401d3=
9c6
        failing since 65 days (last pass: next-20221107, first fail: next-2=
0221109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef7d49d9b564921d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef7d49d9b564921d3=
9da
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f4049bbcf0df8d1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f4049bbcf0df8d1d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f8f103c714cd5a1d39e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f8f103c714cd5a1d3=
9e2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fe06c92a3076211d3a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fe06c92a3076211d3=
a4a
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ff83bcf7b28aef1d39e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ff83bcf7b28aef1d3=
9e7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2c7f9fe3472cf1d3a4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-lenovo-T=
Pad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2c7f9fe3472cf1d3=
a4b
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec34b200f3cb5c1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-len=
ovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec34b200f3cb5c1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec5e419afbd4191d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec5e419afbd4191d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef75c096ac09be1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vi=
m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef75c096ac09be1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0efee040ee827ab1d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0efee040ee827ab1d3=
9d5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f13005764db3a81d39ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f13005764db3a81d3=
9cf
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2bef9fe3472cf1d3a3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2bef9fe3472cf1d3=
a3c
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f30dd44ea1d6531d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f30dd44ea1d6531d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef4e674e7950aa1d39dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef4e674e7950aa1d3=
9dd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0efd956088bd9be1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0efd956088bd9be1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0648dd8754b111d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0648dd8754b111d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f19ae9a5776fe01d39eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f19ae9a5776fe01d3=
9ec
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2271502c5ae331d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2271502c5ae331d3=
9da
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2b3b78a0373c01d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2b3b78a0373c01d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f24e8b8bfa7b5a1d39f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f24e8b8bfa7b5a1d3=
9f3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0fa7f54d3679c1d39c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0fa7f54d3679c1d3=
9c8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f37c28e51f41271d39ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f37c28e51f41271d3=
9f0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0bc2a3c75d56d1d39c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0bc2a3c75d56d1d3=
9c5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f047a0fad127771d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f047a0fad127771d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3b7ddaa293e161d3a2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3b7ddaa293e161d3=
a2d
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0abf96916722b1d39ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0abf96916722b1d3=
9eb
        failing since 2 days (last pass: next-20230109, first fail: next-20=
230110) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f045a0fad127771d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8192-asurada-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f045a0fad127771d3=
9c4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2de3ed39e10c01d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2de3ed39e10c01d3=
9d0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f02bca695195851d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f02bca695195851d3=
9cc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | exyn=
os_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eccf4734c20b111d39d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
exynos_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eccf4734c20b111d3=
9d9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed8320c625910b1d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed8320c625910b1d3=
9d0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee1030c6956a291d39dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-o=
droid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee1030c6956a291d3=
9dd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
odroid-xu3                   | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0e02d8c8d61d31d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0e02d8c8d61d31d3=
9cc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f8b4d0a39197c71d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-linaro-lkft/baseline-qcom-qdf2400=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-linaro-lkft/baseline-qcom-qdf2400=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f8b4d0a39197c71d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0efe256088bd9be1d39d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0efe256088bd9be1d3=
9d8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f20ec087b969e61d3a3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom-=
qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-qcom-=
qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f20ec087b969e61d3=
a3c
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f331801bfaa5801d39e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f331801bfaa5801d3=
9e2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f568b6edb62e121d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f568b6edb62e121d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f6876c0daff2f51d39d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f6876c0daff2f51d3=
9d7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a15        | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eaac20bf5689f01d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eaac20bf5689f01d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a15        | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e8eeab4942d0181d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e8eeab4942d0181d3=
9df
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-broonie     | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eaad20bf5689f01d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eaad20bf5689f01d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-vexpress-a9         | arm    | lab-collabora   | gcc-10     | vexp=
ress_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e8fc5f6935081a1d39d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e8fc5f6935081a1d3=
9d8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c103b00fc16a73ba1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c103b00fc16a73ba1d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f603672c6a9ae11d39fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f603672c6a9ae11d3=
9fb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f86efd24fa3e981d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f86efd24fa3e981d3=
9c4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c106a84316b12b2b1d39df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c106a84316b12b2b1d3=
9e0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c107ea64e6a292ed1d39fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c107ea64e6a292ed1d3=
9fd
        failing since 121 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f16e11a5b08a721d39e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f16e11a5b08a721d3=
9e3
        failing since 121 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10284341cb81c011d3a2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10284341cb81c011d3=
a2d
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f022d83e130dd81d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f022d83e130dd81d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f5c6000858aed31d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f5c6000858aed31d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f8d262ba4a8c6f1d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f8d262ba4a8c6f1d3=
9c7
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10680823d2c3e721d3a2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10680823d2c3e721d3=
a2f
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1081150a76acd491d39e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1081150a76acd491d3=
9ea
        failing since 121 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edd65b7cb19c321d39da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edd65b7cb19c321d3=
9db
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f13105764db3a81d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f13105764db3a81d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c103b1c48c7bfb831d39d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c103b1c48c7bfb831d3=
9d4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f59e7df0d36cf51d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f59e7df0d36cf51d3=
9df
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f896101dee85851d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f896101dee85851d3=
9c4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10681823d2c3e721d3a32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10681823d2c3e721d3=
a33
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c106bca293f361c71d39df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c106bca293f361c71d3=
9e0
        failing since 121 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edd55b7cb19c321d39d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-collabora/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edd55b7cb19c321d3=
9d8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c103d8ced578a8ae1d3a5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c103d8ced578a8ae1d3=
a5b
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0194e020ddf591d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0194e020ddf591d3=
9df
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f6023a63129fdc1d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f6023a63129fdc1d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f76bfc478daf881d39e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-qem=
u_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f76bfc478daf881d3=
9e9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c105549f738bfb901d39f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c105549f738bfb901d3=
9f5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10     | mult=
i_v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63c107e97584bdda501d3a29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c107e97584bdda501d3=
a2a
        failing since 121 days (last pass: next-20220907, first fail: next-=
20220913) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10e67edf9e5f72e1d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10e67edf9e5f72e1d3=
9da
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f6d310019026691d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f6d310019026691d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fe4cd3a1cc98e31d39e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fe4cd3a1cc98e31d3=
9e8
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1011cc446f91e121d39e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1011cc446f91e121d3=
9e4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1054079341180371d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1054079341180371d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c109f13d194922be1d39e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c109f13d194922be1d3=
9e3
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10b59b63e29ec191d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10b59b63e29ec191d3=
9c3
        new failure (last pass: next-20230106) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef51b6b0b3c3d11d39e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef51b6b0b3c3d11d3=
9e1
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f33a7354053b851d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f33a7354053b851d3=
9d5
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f533b3dfd0951d1d39d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f533b3dfd0951d1d3=
9d1
        new failure (last pass: next-20230106) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10e66fb6d38d8111d3a2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10e66fb6d38d8111d3=
a30
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ff9fbcf7b28aef1d39f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ff9fbcf7b28aef1d3=
9f7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10249e0734cb5531d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10249e0734cb5531d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c103eceadf58be111d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c103eceadf58be111d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10ab9697e8273891d3a9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10ab9697e8273891d3=
a9e
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10c23afd47452631d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10c23afd47452631d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f46f7c7f8137cc1d39d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f46f7c7f8137cc1d3=
9d4
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f56ad8373186111d39dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f56ad8373186111d3=
9de
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10e8e306827ffa11d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10e8e306827ffa11d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ffb3d8a3baa95b1d39c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ffb3d8a3baa95b1d3=
9c5
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10270341cb81c011d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10270341cb81c011d3=
9cc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1051ae5f701f04f1d39eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1051ae5f701f04f1d3=
9ec
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10aba697e8273891d3aa0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10aba697e8273891d3=
aa1
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10c21afd47452631d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10c21afd47452631d3=
9d0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef53beb06171af1d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef53beb06171af1d3=
9c7
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0efdf56088bd9be1d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0efdf56088bd9be1d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f11f7f54d3679c1d39f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f11f7f54d3679c1d3=
9f8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3        | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f43eca16ca0b311d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f43eca16ca0b311d3=
9c4
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10e7a306827ffa11d39ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-broonie/baseline-qemu_arm64-virt-=
gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10e7a306827ffa11d3=
9cf
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ff77bda41e64fe1d39c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ff77bda41e64fe1d3=
9c8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c102489ca50ff92a1d39dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c102489ca50ff92a1d3=
9dd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c105181efe3f0dd21d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c105181efe3f0dd21d3=
9c9
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10aa58c6a9fd5011d39da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10aa58c6a9fd5011d3=
9db
        new failure (last pass: next-20230110) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10c0d12fcc500ad1d3a4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10c0d12fcc500ad1d3=
a4e
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f11e7f54d3679c1d39f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f11e7f54d3679c1d3=
9f5
        new failure (last pass: next-20230109) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f38128e51f41271d39f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f38128e51f41271d3=
9f3
        new failure (last pass: next-20230110) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f5565232953f881d39da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f5565232953f881d3=
9db
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-broonie     | clang-16   | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fca7c071d7c0db1d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/clang-16/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/clang-16/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fca7c071d7c0db1d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee1df1970d5da21d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee1df1970d5da21d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1157f54d3679c1d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1157f54d3679c1d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eb069fe94befc31d39f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eb069fe94befc31d3=
9f3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386                    | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec0e65f8ae8dc91d39dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec0e65f8ae8dc91d3=
9de
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | clang-16   | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fccfa68e4509551d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/clang-16/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/clang-16/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fccfa68e4509551d3=
9d6
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | clang-16   | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee4da5e031da4d1d3a09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/clang-16/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/clang-16/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee4da5e031da4d1d3=
a0a
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee5910933cf54d1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee5910933cf54d1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-broonie     | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0ed2d8c8d61d31d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0ed2d8c8d61d31d3=
9d5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig+debug         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eb21b1cad187ca1d39e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eb21b1cad187ca1d3=
9e4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_i386-uefi               | i386   | lab-collabora   | gcc-10     | i386=
_defconfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec0c65f8ae8dc91d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec0c65f8ae8dc91d3=
9da
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_mips-malta              | mips   | lab-broonie     | gcc-10     | malt=
a_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f8d3749fbaa0bd1d3a07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/mips=
/malta_defconfig/gcc-10/lab-broonie/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f8d3749fbaa0bd1d3=
a08
        failing since 1 day (last pass: next-20230111, first fail: next-202=
30112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_mips-malta              | mips   | lab-collabora   | gcc-10     | malt=
a_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edcbcbfbf5f2821d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/mips=
/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mips-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edcbcbfbf5f2821d3=
9da
        failing since 1 day (last pass: next-20230111, first fail: next-202=
30112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_riscv64                 | riscv  | lab-broonie     | clang-16   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fe4bd3a1cc98e31d39e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/clang-16/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/clang-16/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fe4bd3a1cc98e31d3=
9e2
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_riscv64                 | riscv  | lab-collabora   | clang-16   | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef29674e7950aa1d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/clang-16/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/clang-16/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef29674e7950aa1d3=
9c4
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_riscv64                 | riscv  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edcccbfbf5f2821d39dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/gcc-10/lab-broonie/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edcccbfbf5f2821d3=
9dd
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_riscv64                 | riscv  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ea794478cdf2fb1d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/risc=
v/defconfig/gcc-10/lab-collabora/baseline-qemu_riscv64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ea794478cdf2fb1d3=
9d3
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10951e26add7ebc1d3a00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10951e26add7ebc1d3=
a01
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2d73ed39e10c01d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2d73ed39e10c01d3=
9c4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | clang-16   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f255e67544328b1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f255e67544328b1d3=
9c9
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | clang-16   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec4d19eb704f361d39d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec4d19eb704f361d3=
9d9
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e945f152ddf5ce1d39e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e945f152ddf5ce1d3=
9e9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ebd86169eb4b3c1d3a07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ebd86169eb4b3c1d3=
a08
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee8044620b27631d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee8044620b27631d3=
9c6
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f27d5c411a49a81d39cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f27d5c411a49a81d3=
9cd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3bd433aeef8f51d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3bd433aeef8f51d3=
9cc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f76a902dea1ac71d39fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f76a902dea1ac71d3=
9fb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fce3a68e4509551d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fce3a68e4509551d3=
9dc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c101083604f8ca141d39e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c101083604f8ca141d3=
9e2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e898ea739520ac1d39df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e898ea739520ac1d3=
9e0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ea05a3be4e79ec1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ea05a3be4e79ec1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eb41c289e7d4f21d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eb41c289e7d4f21d3=
9c6
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec6d419afbd4191d39e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec6d419afbd4191d3=
9e4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec857100c6386e1d39ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec857100c6386e1d3=
9cf
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f9fe1d4b5773821d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f9fe1d4b5773821d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fa3cba647d37111d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fa3cba647d37111d3=
9d0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64                  | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ede9a877606bd81d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ede9a877606bd81d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1093dda6966f24e1d39d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1093dda6966f24e1d3=
9d7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2d60966ac76861d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2d60966ac76861d3=
9d5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | clang-16   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1c9dfb2ede5b91d39ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1c9dfb2ede5b91d3=
a00
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | clang-16   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec49f470fcd95c1d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec49f470fcd95c1d3=
9c7
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e94490930946161d39e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e94490930946161d3=
9e6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec1495209ec4151d39c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec1495209ec4151d3=
9c8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef8549d9b564921d39f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef8549d9b564921d3=
9f8
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3337354053b851d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3337354053b851d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f49afcba630acd1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f49afcba630acd1d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f70610019026691d3a3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f70610019026691d3=
a3f
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fe0f725568e81d1d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fe0f725568e81d1d3=
9e5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c100e05381b4e6ae1d3a17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c100e05381b4e6ae1d3=
a18
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e89cea739520ac1d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e89cea739520ac1d3=
9e5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ea07be25b6f7511d39c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ea07be25b6f7511d3=
9c8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eb6ea543aa5a3d1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eb6ea543aa5a3d1d3=
9c3
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec77175b5832b51d3a67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec77175b5832b51d3=
a68
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec9c78ae3e05e11d39f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec9c78ae3e05e11d3=
9fa
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edcacbfbf5f2821d39d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edcacbfbf5f2821d3=
9d7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f9d667b59f89901d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f9d667b59f89901d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fb3f497fbc27151d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fb3f497fbc27151d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c10952e26add7ebc1d3a03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c10952e26add7ebc1d3=
a04
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-13   | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2d93ed39e10c01d39c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/clang-13/lab-collabora/baseline-qemu_x86=
_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2d93ed39e10c01d3=
9ca
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | clang-16   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1cbdfb2ede5b91d3a02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1cbdfb2ede5b91d3=
a03
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | clang-16   | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec45515aaae27c1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/clang-16/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec45515aaae27c1d3=
9c3
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e994c9a70523b21d39d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e994c9a70523b21d3=
9d1
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ebecdee6f148fb1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ebecdee6f148fb1d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef3522694dc6401d39d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef3522694dc6401d3=
9d9
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3319e881d79c71d39e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-broonie/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3319e881d79c71d3=
9e8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3e559868ae5101d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3e559868ae5101d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f72efc478daf881d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f72efc478daf881d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fce5c071d7c0db1d3a07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fce5c071d7c0db1d3=
a08
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | gcc-10     | x86_=
64_defconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/63c100e15381b4e6ae1d3a1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c100e15381b4e6ae1d3=
a1c
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e89d3e30c2e4251d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e89d3e30c2e4251d3=
9c4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ea014ccfdc37ec1d3a38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ea014ccfdc37ec1d3=
a39
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+amdgpu      | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0eb6d4e0ef7cdda1d39f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+amdgpu/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0eb6d4e0ef7cdda1d3=
9fa
        new failure (last pass: next-20230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec6fdc12a0249e1d3a38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-collabora/baseline-qem=
u_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec6fdc12a0249e1d3=
a39
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ec817100c6386e1d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ec817100c6386e1d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | gcc-10     | x86_=
64_defconfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edad1badd985f01d39c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edad1badd985f01d3=
9c5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defcon...rust-samples | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fa3aba647d37111d39cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+rust-samples
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig+rust-samples/rustc-1.62/lab-broonie/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fa3aba647d37111d3=
9cd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-broonie     | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fb677c0b9f57e81d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fb677c0b9f57e81d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-collabora   | rustc-1.62 | x86_=
64_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0edf2a877606bd81d3a37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    rustc-1.62 (Debian clang version 15.0.6)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/x86_=
64/x86_64_defconfig/rustc-1.62/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0edf2a877606bd81d3=
a38
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a7743-iwg20d-q7            | arm    | lab-cip         | gcc-10     | shmo=
bile_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ea89665fc3d1f71d39e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ea89665fc3d1f71d3=
9e4
        failing since 7 days (last pass: next-20230105, first fail: next-20=
230106) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1124fc32eb386b21d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1124fc32eb386b21d3=
9c3
        failing since 2 days (last pass: next-20230109, first fail: next-20=
230111) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c11f5e4b31bdc94f1d39f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c11f5e4b31bdc94f1d3=
9f5
        new failure (last pass: next-20230105) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f9ad1299ee8fd31d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f9ad1299ee8fd31d3=
9cc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef9a21d0a9e5d31d3a0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef9a21d0a9e5d31d3=
a0b
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1167f54d3679c1d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1167f54d3679c1d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2cff9fe3472cf1d3a50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2cff9fe3472cf1d3=
a51
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f5da4daa99dd281d39ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f5da4daa99dd281d3=
9cf
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
r8a774c0-ek874               | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f769902dea1ac71d39f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f769902dea1ac71d3=
9f8
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f674f2b2886f2b1d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f674f2b2886f2b1d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | cros=
://chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1c0bc0876a66b1d39e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1c0bc0876a66b1d3=
9e5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f87cb5a149d7981d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f87cb5a149d7981d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | clang-13   | cros=
://chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f50b7ccedcdfca1d39e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
labbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
labbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f50b7ccedcdfca1d3=
9ea
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0d32d8c8d61d31d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0d32d8c8d61d31d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f805b8ca0caed71d39cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-rk3399-roc=
-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f805b8ca0caed71d3=
9cd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f96be2e7eef0a11d39ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f96be2e7eef0a11d3=
9f0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ff5c23122ba90c1d3a26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ff5c23122ba90c1d3=
a27
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c103e66efd4bbd051d39eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c103e66efd4bbd051d3=
9ec
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | clang-13   | cros=
://chrome...avour.config | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0efd966abf174fc1d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
ollabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config/clang-13/lab-c=
ollabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0efd966abf174fc1d3=
9dc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee73db948271721d39d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee73db948271721d3=
9d1
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef13cf3c596a541d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-rk3399-=
rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef13cf3c596a541d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f03c8b098de5f21d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f03c8b098de5f21d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1cc00d7f8bd7a1d39d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1cc00d7f8bd7a1d3=
9d9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f23196259e39571d3a2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f23196259e39571d3=
a2d
        failing since 1 day (last pass: next-20230111, first fail: next-202=
30112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sc7180-trogdor-kingoftown    | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f530aa37f14b761d3a07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-kingoftown.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-kingoftown.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f530aa37f14b761d3=
a08
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sc7180-trogdo...zor-limozeen | arm64  | lab-collabora   | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f4a8d19e2d9c1a1d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f4a8d19e2d9c1a1d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee54a5e031da4d1d3a17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee54a5e031da4d1d3=
a18
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef1d2d1233604c1d39d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef1d2d1233604c1d3=
9d3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f05da263a7d14e1d39e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f05da263a7d14e1d3=
9e6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2b5f9fe3472cf1d3a2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2b5f9fe3472cf1d3=
a30
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-bananapi-m64      | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3199e881d79c71d39c6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3199e881d79c71d3=
9c7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee994bd66663961d39da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee994bd66663961d3=
9db
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef61208a60a1c01d39c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef61208a60a1c01d3=
9ca
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f12d05764db3a81d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f12d05764db3a81d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2e5bdd8647e6a1d39cc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-broonie/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2e5bdd8647e6a1d3=
9cd
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f34904b372d26b1d39e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f34904b372d26b1d3=
9e7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f3adbd8a9c2b061d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f3adbd8a9c2b061d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee70db948271721d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee70db948271721d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef76c096ac09be1d39d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-broonie/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef76c096ac09be1d3=
9d4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0f1babd093aa61d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0f1babd093aa61d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f26f4eac1e15571d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f26f4eac1e15571d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f283ed1654efca1d3a9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f283ed1654efca1d3=
a9e
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee6610933cf54d1d39c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee6610933cf54d1d3=
9ca
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef2e22694dc6401d39d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe/baseline-sun50i-h6-=
pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef2e22694dc6401d3=
9d2
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f00a4e020ddf591d39cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f00a4e020ddf591d3=
9cc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2518b8bfa7b5a1d39f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2518b8bfa7b5a1d3=
9f9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-clabbe      | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2c6f9fe3472cf1d3a47

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2c6f9fe3472cf1d3=
a48
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ee874bd66663961d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ee874bd66663961d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef13cf3c596a541d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef13cf3c596a541d3=
9dc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0403bceed23981d3a59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0403bceed23981d3=
a5a
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f1d000d7f8bd7a1d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f1d000d7f8bd7a1d3=
9dc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora   | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f25de67544328b1d39d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f25de67544328b1d3=
9d5
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0d62a3c75d56d1d39e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0d62a3c75d56d1d3=
9e1
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed78632d019b7a1d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun7=
i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed78632d019b7a1d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f2291502c5ae331d39df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f2291502c5ae331d3=
9e0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun7i-a20-cubieboard2        | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e8dce0f9c0afe61d39fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e8dce0f9c0afe61d3=
9fc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a33-olinuxino          | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef9521d0a9e5d31d3a04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef9521d0a9e5d31d3=
a05
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a33-olinuxino          | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ecd84734c20b111d39df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ecd84734c20b111d3=
9e0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a33-olinuxino          | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0c12b0fe1c9091d3a0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0c12b0fe1c9091d3=
a0e
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a33-olinuxino          | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e7ec32e700ea6f1d39cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e7ec32e700ea6f1d3=
9d0
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f018aba86256271d39d9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f018aba86256271d3=
9da
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ed84281893045f1d39c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ed84281893045f1d3=
9c9
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f16c60c101a2cd1d39ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f16c60c101a2cd1d3=
9cf
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-a83t-bananapi-m3       | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e8d3e0f9c0afe61d39ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e8d3e0f9c0afe61d3=
9ed
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f73d9b33ec2d5e1d3ac6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f73d9b33ec2d5e1d3=
ac7
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef3122694dc6401d39d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef3122694dc6401d3=
9d6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f998d70ed256f41d39ca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f998d70ed256f41d3=
9cb
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-h3-orangepi-pc         | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0e990c9a70523b21d39cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0e990c9a70523b21d3=
9ce
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | clang-16   | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fed37b17a563db1d3a11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230109071901+ba7a=
f0bf6932-1~exp1~20230109071950.525))
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/clang-16/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fed37b17a563db1d3=
a12
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0fc52eb6c7d4d9f1d39c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0fc52eb6c7d4d9f1d3=
9c6
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defc...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1003bb3200045571d3a7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun=
8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-clabbe/baseline-sun=
8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armeb/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1003bb3200045571d3=
a7b
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | mult=
i_v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c1021bfaa2f2c84c1d39ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c1021bfaa2f2c84c1d3=
9ed
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm    | lab-clabbe      | gcc-10     | sunx=
i_defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ea8098064a10101d39c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm/=
sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ea8098064a10101d3=
9c4
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | clang-13   | defc=
onfig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f9130ef23219791d3a09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f9130ef23219791d3=
a0a
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0ef4fb6b0b3c3d11d39da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0ef4fb6b0b3c3d11d3=
9db
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f0cb2d5eef0a5b1d39db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f0cb2d5eef0a5b1d3=
9dc
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f23316487c13ba1d39c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f23316487c13ba1d3=
9c3
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f5df4daa99dd281d39ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+videodec/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f5df4daa99dd281d3=
a00
        new failure (last pass: next-20230112) =

 =



platform                     | arch   | lab             | compiler   | defc=
onfig                    | regressions
-----------------------------+--------+-----------------+------------+-----=
-------------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10     | defc=
onfig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63c0f747caa88fc37f1d39de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230109.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63c0f747caa88fc37f1d3=
9df
        new failure (last pass: next-20230112) =

 =20
