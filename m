Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185D73AA948
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 04:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhFQDBO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Jun 2021 23:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhFQDBO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Jun 2021 23:01:14 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F00C061574
        for <linux-next@vger.kernel.org>; Wed, 16 Jun 2021 19:59:07 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id k7so2918345pjf.5
        for <linux-next@vger.kernel.org>; Wed, 16 Jun 2021 19:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=O/oiw+hmVX3bjppCOa2nNmJi+IRmxUourAE3Zm4KfHw=;
        b=WUIhTbch0P8A9sh6c7QMJGhkaPDQwSIwkNfR75f41yP+i0+LQGPcQKSNUaRUEM/Qhn
         pAzHW6kviJ49wO2d/M21f+7iPF+7/h+ELxnS0UvnNDo1Vlcj5POK+0DbWXJPY/AfWGR0
         fG6kyeUWhL1Ssf490ioHjK8Wd9EUqNOu4ijHRAb+JVnDklX3TUsQXtX8ZP//8pGa4Y7n
         D0GrkWqFkryJn8hAI5TcwcygzI0MBTP97D4Ly3nY6yxz3sPlkwZb0ZPn9MR020h4S7sA
         hO2lPnq3KET4OC0+GNk5y9AxmjC/iM9Wll5Yb+2CmxR5QOJ2+6qSBoIHThG0DZ6bcqIM
         uV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=O/oiw+hmVX3bjppCOa2nNmJi+IRmxUourAE3Zm4KfHw=;
        b=Cu64k3G9j5Q65AxgtKiSSAmlxVV0+7MhySPl3DVNU43LzEMymP76CZ1hrDLcoVvYTx
         82ysA57e7Q2LpAp5eqAIHR6HzW60WF33+ZNAWzZPxmulkuY1xYp+SJtc04g/1rqruyXT
         oEeWWtZzc/Rajnjyu9ikCeFllEiL8bO0suS9ddFuPVCjmdhX9CrOWLi3OEj92Hm0o71e
         nhB0P6fpnbsT8w0V1kbGncYW2oxCHhEuoGSrvMnRTFhp33IdOOLid9MmwHuFRlfzoSZy
         QQvXj0Yxr/s5CJQch2vrHc8Psun3bxzIb4vCk74fK4VgQQObXMXL0nLEVEOX31kI0lSl
         f9zw==
X-Gm-Message-State: AOAM533uWOSPC9/dAHWcSAYlWtSYMrVDsx2eYwNSiC2Fg9q5gCPYR68s
        g+ms8C5hMXy7b/Y6OoHWG0++YZG5CuoEa+wg
X-Google-Smtp-Source: ABdhPJw6qCVjG/AAn5fgD1hE0xMDdMP83ALlcsfiaeWGzo8RUyQOzNPYxhu+M8NSLSQqBMF5M8gDjA==
X-Received: by 2002:a17:902:b607:b029:11b:4da8:d180 with SMTP id b7-20020a170902b607b029011b4da8d180mr2429255pls.49.1623898745664;
        Wed, 16 Jun 2021 19:59:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u9sm3634361pgp.90.2021.06.16.19.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 19:59:04 -0700 (PDT)
Message-ID: <60caba78.1c69fb81.18b31.b5e6@mx.google.com>
Date:   Wed, 16 Jun 2021 19:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210616
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 530 runs, 181 regressions (next-20210616)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 530 runs, 181 regressions (next-20210616)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

dove-cubox                   | arm   | lab-pengutronix | clang-10 | multi_v=
7_defconfig           | 1          =

dove-cubox                   | arm   | lab-pengutronix | clang-12 | multi_v=
7_defconfig           | 1          =

dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =

dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

dove-cubox                   | arm   | lab-pengutronix | gcc-8    | mvebu_v=
7_defconfig           | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

imx27-phytec-phycard-s-rdk   | arm   | lab-pengutronix | gcc-8    | imx_v4_=
v5_defconfig          | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 2          =

imx6sx-sdb                   | arm   | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 2          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 2          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

imx6ul-14x14-evk             | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6ull-14x14-evk            | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =

imx6ull-14x14-evk            | arm   | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 1          =

imx6ull-14x14-evk            | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6ull-14x14-evk            | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6ull-14x14-evk            | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-10 | defconf=
ig                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-12 | defconf=
ig                    | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-10 | defconf=
ig                    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-12 | defconf=
ig                    | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-10 | defconf=
ig                    | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-12 | defconf=
ig                    | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-cip         | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-cip         | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-8    | vexpres=
s_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-12 | defconf=
ig                    | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210616/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210616
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c7d4c1fd91ab4a6d2620497921a9c6bf54650ab8 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca917b22aab6c2b641326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca917b22aab6c2b6413=
270
        failing since 112 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c45bba5798b404132c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c45bba5798b40413=
2c8
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78a6542fde4064413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78a6542fde4064413=
279
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca77913566a7580b413289

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca77913566a7580b413=
28a
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca77c15479c2656a413287

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-dove-cubox=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-pengutronix/baseline-dove-cubox=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca77c15479c2656a413=
288
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
dove-cubox                   | arm   | lab-pengutronix | gcc-8    | mvebu_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca733a48d55b4ec641329d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: mvebu_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
mvebu_v7_defconfig/gcc-8/lab-pengutronix/baseline-dove-cubox.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca733a48d55b4ec6413=
29e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7e9eb198a45f9d41327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7e9eb198a45f9d413=
27d
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d7023fee9ea1f413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d7023fee9ea1f413=
272
        failing since 1 day (last pass: next-20210604, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca756dd8b5025076413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca756dd8b5025076413=
267
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-lx2160a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7777d05f2e32d9413298

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7777d05f2e32d9413=
299
        new failure (last pass: next-20210610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca765adc742245bf413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca765adc742245bf413=
285
        failing since 47 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx27-phytec-phycard-s-rdk   | arm   | lab-pengutronix | gcc-8    | imx_v4_=
v5_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca74a7e4d27239f9413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v4_v5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca74a7e4d27239f9413=
273
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78f9f8b2f3d62d413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78f9f8b2f3d62d413=
267
        failing since 233 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/60ca7d407fd2cffcac413267

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60ca7d407fd2cff=
cac41326b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615)
        17 lines

    2021-06-16T22:37:20.891267  <8>[   47.929177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-06-16T22:37:20.907229  kern  :alert : 8<--- cut here ---
    2021-06-16T22:37:20.949503  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000034
    2021-06-16T22:37:20.949727  kern  :alert : pgd =3D (ptrval)<8>[   47.97=
8510] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D17>
    2021-06-16T22:37:20.949898     =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ca7d407fd2cff=
cac41326c
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615)
        167 lines

    2021-06-16T22:37:20.950855  kern  :alert : [00000034] *pgd=3Db93cb831
    2021-06-16T22:37:20.951017  kern  :alert : Register r0 information: NUL=
L pointer
    2021-06-16T22:37:20.951171  kern  :alert : Register r1 information: non=
-paged memory
    2021-06-16T22:37:20.951331  kern  :alert : Register r2 information: non=
-paged memory
    2021-06-16T22:37:20.951493  kern  :alert : Register r3 information: non=
-paged memory
    2021-06-16T22:37:20.992324  kern  :alert : Register r4 information: NUL=
L pointer
    2021-06-16T22:37:20.992866  kern  :alert : Register r5 information: NUL=
L pointer
    2021-06-16T22:37:20.993030  kern  :alert : Register r6 information: NUL=
L pointer
    2021-06-16T22:37:20.993201  kern  :alert : Register r7 information: non=
-slab/vmalloc memory
    2021-06-16T22:37:20.993365  kern  :alert : Register r8 information: NUL=
L pointer =

    ... (133 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/60ca7ade87cc642de441329f

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60ca7ade87cc642=
de44132a3
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615)
        17 lines

    2021-06-16T22:27:13.883189  kern  :alert : 8<--- cut here ---
    2021-06-16T22:27:13.883497  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000034
    2021-06-16T22:27:13.883960  kern  :alert : pgd =3D (ptrval)<8>[   47.57=
0997] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D17>
    2021-06-16T22:27:13.884163  =

    2021-06-16T22:27:13.884343  kern  :alert : [00000034] *pgd=3Db9357831
    2021-06-16T22:27:13.884511  kern  :alert : Register r0 information: NUL=
L pointer
    2021-06-16T22:27:13.884673  kern  :alert : Register r1 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ca7ade87cc642=
de44132a4
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615)
        109 lines

    2021-06-16T22:27:13.885660  kern  :alert : Register r2 information: non=
-paged memory
    2021-06-16T22:27:13.926289  kern  :alert : Register r3 information: non=
-paged memory
    2021-06-16T22:27:13.926588  kern  :alert : Register r4 information: NUL=
L pointer
    2021-06-16T22:27:13.926808  kern  :alert : Register r5 information: NUL=
L pointer
    2021-06-16T22:27:13.927004  kern  :alert : Register r6 information: NUL=
L pointer
    2021-06-16T22:27:13.927425  kern  :alert : Register r7 information: non=
-slab/vmalloc memory
    2021-06-16T22:27:13.927604  kern  :alert : Register r8 information: NUL=
L pointer
    2021-06-16T22:27:13.927768  kern  :alert : Register r9 information: non=
-slab/vmalloc memory
    2021-06-16T22:27:13.927924  kern  :alert : Register r10 information: no=
n-paged memory
    2021-06-16T22:27:13.928303  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (85 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78ba3482670c3341326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78ba3482670c33413=
26e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/60ca782791cc6d46894132ab

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60ca782791cc6d4=
6894132af
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615)
        17 lines

    2021-06-16T22:15:40.382374  kern  :alert : 8<--- cut here ---
    2021-06-16T22:15:40.382701  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000034
    2021-06-16T22:15:40.383226  kern  :alert : pgd =3D (ptrval)<8>[   47.64=
0164] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D17>
    2021-06-16T22:15:40.383497  =

    2021-06-16T22:15:40.383754  kern  :alert : [00000034] *pgd=3Db91a9831
    2021-06-16T22:15:40.384041  kern  :alert : Register r0 information: NUL=
L pointer
    2021-06-16T22:15:40.384282  kern  :alert : Register r1 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ca782791cc6d4=
6894132b0
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615)
        88 lines

    2021-06-16T22:15:40.385667  kern  :alert : Register r2 information: non=
-paged memory
    2021-06-16T22:15:40.425397  kern  :alert : Register r3 information: non=
-paged memory
    2021-06-16T22:15:40.425954  kern  :alert : Register r4 information: NUL=
L pointer
    2021-06-16T22:15:40.426234  kern  :alert : Register r5 information: NUL=
L pointer
    2021-06-16T22:15:40.426487  kern  :alert : Register r6 information: sla=
b kmalloc-192 start c6cca0c0 pointer offset 0 size 192
    2021-06-16T22:15:40.426736  kern  :alert : Register r7 information: NUL=
L pointer
    2021-06-16T22:15:40.426976  kern  :alert : Register r8 information: non=
-paged memory
    2021-06-16T22:15:40.427211  kern  :alert : Register r9 information: NUL=
L pointer
    2021-06-16T22:15:40.427689  kern  :alert : Register r10 information: NU=
LL pointer
    2021-06-16T22:15:40.468423  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory =

    ... (82 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/60ca79e397d454a587413292

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60ca79e397d454a=
587413296
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615)
        17 lines

    2021-06-16T22:23:12.607539  kern  :alert : 8<--- cut here ---
    2021-06-16T22:23:12.607839  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000034
    2021-06-16T22:23:12.608291  kern  :alert : pgd =3D (ptrval)<8>[   51.29=
1505] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dline=
s MEASUREMENT=3D17>
    2021-06-16T22:23:12.608479  =

    2021-06-16T22:23:12.608651  kern  :alert : [00000034] *pgd=3Db9190831
    2021-06-16T22:23:12.608816  kern  :alert : Register r0 information: NUL=
L pointer
    2021-06-16T22:23:12.608973  kern  :alert : Register r1 information: non=
-paged memory
    2021-06-16T22:23:12.609124  kern  :alert : Register r2 information: non=
-paged memory   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60ca79e397d454a=
587413297
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615)
        88 lines

    2021-06-16T22:23:12.610059  kern  :alert : Register r3 information: non=
-paged memory
    2021-06-16T22:23:12.650854  kern  :alert : Register r4 information: NUL=
L pointer
    2021-06-16T22:23:12.651291  kern  :alert : Register r5 information: NUL=
L pointer
    2021-06-16T22:23:12.651533  kern  :alert : Register r6 information: sla=
b kmalloc-128 start c3f70000 pointer offset 0 size 128
    2021-06-16T22:23:12.652002  kern  :alert : Register r7 information: NUL=
L pointer
    2021-06-16T22:23:12.652216  kern  :alert : Register r8 information: non=
-paged memory
    2021-06-16T22:23:12.652412  kern  :alert : Register r9 information: NUL=
L pointer
    2021-06-16T22:23:12.652587  kern  :alert : Register r10 information: no=
n-paged memory
    2021-06-16T22:23:12.693667  kern  :alert : Register r11 information: no=
n-slab/vmalloc memory
    2021-06-16T22:23:12.694021  kern  :alert : Register r12 information: NU=
LL pointer =

    ... (83 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca80acd878bc17c2413275

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca80acd878bc17c2413=
276
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7e60c1b1eadfc0413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7e60c1b1eadfc0413=
279
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7a6aee7887805341329f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7a6aee78878053413=
2a0
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78f0b97fddc4274132e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78f0b97fddc427413=
2e9
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c93a9c48a1edf413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c93a9c48a1edf413=
272
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ull-14x14-evk            | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f8cf79e89a98d41327f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f8cf79e89a98d413=
280
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ull-14x14-evk            | arm   | lab-nxp         | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7e23ba797e5d524132e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7e23ba797e5d52413=
2e3
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ull-14x14-evk            | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7a02514fc6eb02413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7a02514fc6eb02413=
274
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ull-14x14-evk            | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78f6b97fddc42741330e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78f6b97fddc427413=
30f
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ull-14x14-evk            | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7bcd9af81e2602413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7bcd9af81e2602413=
272
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca80f3f72b793cd9413282

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca80f3f72b793cd9413=
283
        failing since 5 days (last pass: next-20210610, first fail: next-20=
210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7877769c32c794413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7877769c32c794413=
269
        new failure (last pass: next-20210615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7aa2b0262ee7974132cb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7aa2b0262ee797413=
2cc
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7dbc6088cf83fc413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7dbc6088cf83fc413=
272
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c671a7c6464c7413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c671a7c6464c7413=
27a
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d587fd2cffcac41327a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d587fd2cffcac413=
27b
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7537ab6120e237413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7537ab6120e237413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca778fda231f36fa41328d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca778fda231f36fa413=
28e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78581cfe031f9b413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78581cfe031f9b413=
267
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7df848da057a7f413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7df848da057a7f413=
26a
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c54c159e927b6413299

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c54c159e927b6413=
29a
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d30e6e6c14c8d41328e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d30e6e6c14c8d413=
28f
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca75c244bad1ed8c41329e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca75c244bad1ed8c413=
29f
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7790fe6ef66105413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7790fe6ef66105413=
275
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca787f1a5f49df9f413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca787f1a5f49df9f413=
274
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d946088cf83fc413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d946088cf83fc413=
268
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7bb53a9adcccd441327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7bb53a9adcccd4413=
27d
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d07e6e6c14c8d413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d07e6e6c14c8d413=
267
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca75d6a180b4ccac41326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca75d6a180b4ccac413=
26e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca777bda231f36fa413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-sl=
28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca777bda231f36fa413=
268
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca786a1cfe031f9b41326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca786a1cfe031f9b413=
26d
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca76bf78d6d16d38413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca76bf78d6d16d38413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca77261ea60339b441326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca77261ea60339b4413=
26c
        failing since 210 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca8d741ec711c70a413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca8d741ec711c70a413=
267
        failing since 210 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7387ad88016ace41326f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7387ad88016ace413=
270
        failing since 210 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9f86742ff0b547413295

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9f86742ff0b547413=
296
        failing since 210 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7a47107281c7d8413285

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7a47107281c7d8413=
286
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9134d2459dac89413297

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9134d2459dac89413=
298
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-cip         | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca76a76e1574473141328c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca76a76e15744731413=
28d
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60caa21a1e9a4dbd404132d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caa21a1e9a4dbd40413=
2d7
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7a5bee7887805341328b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7a5bee78878053413=
28c
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9149b602a5863c413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9149b602a5863c413=
271
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-cip         | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca76cf94921ad8c74132b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca76cf94921ad8c7413=
2ba
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-8    | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60caa218cd9f5a6060413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caa218cd9f5a6060413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca8128bfe579d50a413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca8128bfe579d50a413=
269
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9beb8dc5493c4c413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9beb8dc5493c4c413=
271
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f5677fe173319413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f5677fe173319413=
285
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f34e4b167134a413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f34e4b167134a413=
26a
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca98a283d6e25b57413292

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca98a283d6e25b57413=
293
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d8aa6bc92b99f41326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d8aa6bc92b99f413=
26d
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cab1181f543afe0a41327b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cab1181f543afe0a413=
27c
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c8ca9c48a1edf413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c8ca9c48a1edf413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7dcb7a15f773b4413286

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7dcb7a15f773b4413=
287
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca95a9823829439c413286

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca95a9823829439c413=
287
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca96d6b9189484be413276

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca96d6b9189484be413=
277
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7adbc58cf7213641327d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7adbc58cf72136413=
27e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c1bbe1cc61dd7413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c1bbe1cc61dd7413=
272
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60caad5b9b2d90cfb4413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caad5b9b2d90cfb4413=
26a
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60caad5d86bcafe5e54132de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caad5d86bcafe5e5413=
2df
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca8153795fa7c593413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca8153795fa7c593413=
284
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9c6324574e90fb41328e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9c6324574e90fb413=
28f
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7fdc6e6d8a69f1413277

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7fdc6e6d8a69f1413=
278
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f20bf783cf677413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f20bf783cf677413=
285
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca983e9e3fab4b8c41326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca983e9e3fab4b8c413=
26c
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d83060ec9686c413276

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d83060ec9686c413=
277
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60caafbd74688b18b441329b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caafbd74688b18b4413=
29c
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c7702851a96464132a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c7702851a9646413=
2aa
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7df4b1ec4354f0413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7df4b1ec4354f0413=
274
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9559240a5f99b341328b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9559240a5f99b3413=
28c
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca976259186f086f413277

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca976259186f086f413=
278
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7a8f8509bf1ec341326b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7a8f8509bf1ec3413=
26c
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c841a7c6464c7413289

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c841a7c6464c7413=
28a
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60caaaf9ee720e7eae41327b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caaaf9ee720e7eae413=
27c
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60caaec3649ae08617413287

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caaec3649ae08617413=
288
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca813cbfe579d50a413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca813cbfe579d50a413=
285
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9bec11565425eb4132df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9bec11565425eb413=
2e0
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f85f79e89a98d413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f85f79e89a98d413=
273
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f21bf783cf677413288

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f21bf783cf677413=
289
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca98669662c5abd6413279

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca98669662c5abd6413=
27a
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d91977c2b661b413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d91977c2b661b413=
26a
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cab1111f543afe0a413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cab1111f543afe0a413=
279
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c8b7b07d0080641328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c8b7b07d00806413=
28b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7de1b1ec4354f041326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7de1b1ec4354f0413=
26b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9595611ff5b097413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9595611ff5b097413=
274
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca97266d900bc606413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca97266d900bc606413=
274
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7ac187cc642de4413272

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7ac187cc642de4413=
273
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c43bba5798b404132c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c43bba5798b40413=
2c2
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60caac8bc14cb6c0c241328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caac8bc14cb6c0c2413=
28b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60caaec553c4269420413270

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caaec553c4269420413=
271
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca8152b9645d7165413286

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca8152b9645d7165413=
287
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9c275af4094a77413297

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9c275af4094a77413=
298
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7fdb87a7fce608413290

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7fdb87a7fce608413=
291
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f4877fe173319413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f4877fe173319413=
267
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca991ae2ceda91d4413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca991ae2ceda91d4413=
269
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7de89be7d9bd6441327d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7de89be7d9bd64413=
27e
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60cab15145d7fbb5ed413285

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60cab15145d7fbb5ed413=
286
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c7802851a96464132b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c7802851a9646413=
2b6
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7dcc6088cf83fc413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-qemu_arm-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7dcc6088cf83fc413=
285
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca956e240a5f99b34132a2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca956e240a5f99b3413=
2a3
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca96fe3cc423ca2e41327e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-broonie/baseline-qemu_arm-virt-=
gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca96fe3cc423ca2e413=
27f
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7ab387cc642de4413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7ab387cc642de4413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-cip         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c29181cbfd0d0413293

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline-qemu_arm-virt-gicv=
3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c29181cbfd0d0413=
294
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60caab85da5a4389c9413289

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caab85da5a4389c9413=
28a
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60caade8c16e369978413268

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caade8c16e369978413=
269
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca81782695335fab41327a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca81792695335fab413=
27b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9c9f304783a6aa413281

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9c9f304783a6aa413=
282
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7fb7cc9dcb20dd413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7fb7cc9dcb20dd413=
268
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7fc387a7fce608413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7fc387a7fce608413=
275
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7fd56e6d8a69f1413271

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7fd56e6d8a69f1413=
272
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9a1fad95f707d1413281

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9a1fad95f707d1413=
282
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9a33062d0ec890413276

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9a33062d0ec890413=
277
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7dffc0931dbfa1413276

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7dffc0931dbfa1413=
277
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7e1cba797e5d524132dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7e1cba797e5d52413=
2dd
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78b63482670c33413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78b63482670c33413=
268
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7aac76e2324881413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7aac76e2324881413=
274
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7ac087cc642de441326d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7ac087cc642de4413=
26e
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca8fa4f88d498a2c413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca8fa4f88d498a2c413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca929dc360b812004132b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca929dc360b81200413=
2b4
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca92eded156d4f66413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca92eded156d4f66413=
279
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca753f96c2a5eef9413281

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca753f96c2a5eef9413=
282
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca77e4e31a7a6d77413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca77e4e31a7a6d77413=
279
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca780d91cc6d4689413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca780d91cc6d4689413=
267
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9feb875a40f544413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9feb875a40f544413=
281
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60caa59d5c132e20134132b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caa59d5c132e2013413=
2b5
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60caa7a8827e438ef9413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caa7a8827e438ef9413=
267
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca81662695335fab413277

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca81662695335fab413=
278
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9c50696cd3fdba4132b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9c50696cd3fdba413=
2b1
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7f536ec338e7d0413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7f536ec338e7d0413=
284
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7fd487a7fce60841328a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-qemu_=
arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7fd487a7fce608413=
28b
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7ffeee8a96e8a0413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7ffeee8a96e8a0413=
275
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9a21ad95f707d1413284

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-broonie/baseline-qemu_a=
rm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9a21ad95f707d1413=
285
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9a98f3262a990241328c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9a98f3262a9902413=
28d
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-cip         | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7e0fc0931dbfa141327c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-cip/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7e0fc0931dbfa1413=
27d
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-cip         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7e4cc1b1eadfc041326c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7e4cc1b1eadfc0413=
26d
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78f3b97fddc4274132f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78f3b97fddc427413=
2f5
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7a998509bf1ec3413277

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7a998509bf1ec3413=
278
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7abf76e232488141327a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7abf76e2324881413=
27b
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca8fcc5b767a6f8841326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca8fcc5b767a6f88413=
26b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca928ac360b81200413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-broonie/baseline-qemu_arm64=
-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca928ac360b81200413=
279
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-broonie     | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca92d9db8db9de95413287

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-broonie/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca92d9db8db9de95413=
288
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7520b792044720413269

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7520b792044720413=
26a
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca77bcddcc37dba1413267

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca77bcddcc37dba1413=
268
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca781991cc6d468941329c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-cip/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca781991cc6d4689413=
29d
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca9fee875a40f544413283

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-qemu_ar=
m64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca9fee875a40f544413=
284
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60caa59b6ad939b39e413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caa59b6ad939b39e413=
267
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3        | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60caa67fe61b9471324132dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-qemu_arm64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60caa67fe61b947132413=
2dd
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c9da9c48a1edf413277

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c9da9c48a1edf413=
278
        new failure (last pass: next-20210615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7d6323fee9ea1f41326a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7d6323fee9ea1f413=
26b
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7b84d6a3ad209d4132d3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-rk332=
8-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-rk332=
8-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7b84d6a3ad209d413=
2d4
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7bc03a9adcccd441328e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7bc03a9adcccd4413=
28f
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7506a512bffcf6413273

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7506a512bffcf6413=
274
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca76aafab0fea7444132ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca76aafab0fea744413=
2ad
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca76e6183d7f764b413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca76e6183d7f764b413=
267
        new failure (last pass: next-20210611) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7e5f90e6a8eb67413274

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7e5f90e6a8eb67413=
275
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-12 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7c2cac1c063993413266

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7c2cac1c063993413=
267
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7ca4be79b51558413278

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210604112545+6279f=
d114acb-1~exp1~20210604213255.101)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/clang-12/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7ca4be79b51558413=
279
        failing since 1 day (last pass: next-20210610, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca754396c2a5eef941328d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca754396c2a5eef9413=
28e
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca78dc6c156e19ab413280

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca78dc6c156e19ab413=
281
        failing since 1 day (last pass: next-20210611, first fail: next-202=
10615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60ca7a1f514fc6eb02413291

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210616/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ca7a1f514fc6eb02413=
292
        new failure (last pass: next-20210611) =

 =20
