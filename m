Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6511B68D861
	for <lists+linux-next@lfdr.de>; Tue,  7 Feb 2023 14:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbjBGNJJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Feb 2023 08:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbjBGNJI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Feb 2023 08:09:08 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5F55B8F
        for <linux-next@vger.kernel.org>; Tue,  7 Feb 2023 05:08:28 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id bg10-20020a17090b0d8a00b00230c7f312d4so5495843pjb.3
        for <linux-next@vger.kernel.org>; Tue, 07 Feb 2023 05:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j0BfCVbyLMjAB3dF9QpH7cfXvr0Fm/Rgg/6+7aQ1zdo=;
        b=UBaDO4ZlASodNe0gozR1QJ9PFehVfTIhQaT9YITaUdgLKpx31Kfya9Bb8CUu2/tVg/
         H/is5gsVfMhs42cDEu1ta+/0tVI92Ga+IiFIFRn9lifTFKScNHJfQD4ul6awv5nwnCXa
         8WZdAVs23PBYmuC5OD0ONSzZOsnG/lCIsmsNeZr/id9oXkpSW22MyXICpV1EuvSjG+25
         4FK43fRkcTWIFRlRso1mnrkyo0pQd31dOhHR4c9IGbaDO5lMl+Zs0EqG003lsH2D+9bv
         b2mjoKsRNCI50deRxbZro5efwn38pJZx+Xa0p8AO8EqWpRDKPAPP2e8OQmpDjby6++eB
         rGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0BfCVbyLMjAB3dF9QpH7cfXvr0Fm/Rgg/6+7aQ1zdo=;
        b=3FjuAACBVV7aNk8/Q5Wo0R5TBgx8WrVStsJv9tZ9DNUdHbjUXYYyv8LrzwcX1CoP+a
         eOWkHDGkCOO9pggHT6XU8CehP8KAVlmUuBP4SW6P95BDvx26mwWNE75WdlH92MQQWZRx
         C/UvordYyPjFpHJmjyZ8ztZWk2jruu97HjwnQELjtK2UX+Y/WDg7UPAW6KqtZl1Ezc6E
         GY2FRVUHB3bLhOxg5PlR6SaZfUv/HyQYsxTa78qifbCPEYzrku4FuNmT+euknjZ29/Re
         QPkeZ/zIoaoMfYnUd2Zpst+UqZUxd/bXW3slPkMfjJMNAhk/3GnHmxbhwVtQNSXKw3iw
         QEkA==
X-Gm-Message-State: AO0yUKWP4z005SJN/RT70oufJRtLXQQcFwdX61urievEDtUhDTVDdjl9
        191oGGpMwgLe8g+L5WwPzc0chxupx3qOdJTnUGk=
X-Google-Smtp-Source: AK7set/vVLunBAP+KKelLTcZOYt/5wusn3OzDj8ofD4yc8y5K/IclAohgctXVcSLYecT/NOMuwdvHA==
X-Received: by 2002:a17:902:8c8d:b0:198:e8ca:fad3 with SMTP id t13-20020a1709028c8d00b00198e8cafad3mr7094090plo.17.1675775304227;
        Tue, 07 Feb 2023 05:08:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902ed1300b001963bc7bdb8sm8701187pld.274.2023.02.07.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:08:23 -0800 (PST)
Message-ID: <63e24d47.170a0220.8e1d5.e0f3@mx.google.com>
Date:   Tue, 07 Feb 2023 05:08:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230207
X-Kernelci-Report-Type: test
Subject: next/master baseline: 795 runs, 137 regressions (next-20230207)
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

next/master baseline: 795 runs, 137 regressions (next-20230207)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =

jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =

lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

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

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

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

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =

mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =

ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =

qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 2          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =

rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =

sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
230207/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20230207
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      49a8133221c71b935f36a7c340c0271c2a9ee2db =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2128038833451298c86e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2128038833451298c8=
6e3
        failing since 143 days (last pass: next-20220915, first fail: next-=
20220916) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e215603a15be2fe18c8670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e215603a15be2fe18c8=
671
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214054e6cb9f69f8c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e214054e6cb9f69f8c8=
657
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
at91-sama5d4_xplained        | arm    | lab-baylibre    | gcc-10   | sama5_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2110c6a681170a88c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
sama5_defconfig/gcc-10/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2110c6a681170a88c8=
63a
        failing since 6 days (last pass: next-20230125, first fail: next-20=
230131) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2123c14e7156cb48c864e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-rpi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2123c14e7156cb48c8657
        new failure (last pass: next-20230206)

    2023-02-07T08:56:11.419528  + set +x
    2023-02-07T08:56:11.424193  <8>[   17.552990] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 266825_1.5.2.4.1>
    2023-02-07T08:56:11.558253  / # #
    2023-02-07T08:56:11.661756  export SHELL=3D/bin/sh
    2023-02-07T08:56:11.662517  #
    2023-02-07T08:56:11.764675  / # export SHELL=3D/bin/sh. /lava-266825/en=
vironment
    2023-02-07T08:56:11.765507  =

    2023-02-07T08:56:11.867399  / # . /lava-266825/environment/lava-266825/=
bin/lava-test-runner /lava-266825/1
    2023-02-07T08:56:11.868667  =

    2023-02-07T08:56:11.874647  / # /lava-266825/bin/lava-test-runner /lava=
-266825/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214b7b21d82f82a8c8639

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e214b7b21d82f82a8c8=
63a
        failing since 13 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e213c843c09032288c865b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e213c843c09032288c8664
        failing since 19 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-07T09:02:50.554221  <8>[   14.855521] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3300166_1.5.2.4.1>
    2023-02-07T09:02:50.663357  / # #
    2023-02-07T09:02:50.764863  export SHELL=3D/bin/sh
    2023-02-07T09:02:50.765193  #
    2023-02-07T09:02:50.866298  / # export SHELL=3D/bin/sh. /lava-3300166/e=
nvironment
    2023-02-07T09:02:50.866717  =

    2023-02-07T09:02:50.968011  / # . /lava-3300166/environment/lava-330016=
6/bin/lava-test-runner /lava-3300166/1
    2023-02-07T09:02:50.968564  =

    2023-02-07T09:02:50.968721  / # <3>[   15.219921] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-02-07T09:02:50.972984  /lava-3300166/bin/lava-test-runner /lava-33=
00166/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21352f8042a8d0e8c8655

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-cubietruck.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21352f8042a8d0e8c865e
        failing since 19 days (last pass: next-20221219, first fail: next-2=
0230118)

    2023-02-07T09:00:30.161766  <8>[   16.557825] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3300087_1.5.2.4.1>
    2023-02-07T09:00:30.268495  / # #
    2023-02-07T09:00:30.371114  export SHELL=3D/bin/sh
    2023-02-07T09:00:30.371869  #
    2023-02-07T09:00:30.473513  / # export SHELL=3D/bin/sh. /lava-3300087/e=
nvironment
    2023-02-07T09:00:30.475009  =

    2023-02-07T09:00:30.577335  / # . /lava-3300087/environment/lava-330008=
7/bin/lava-test-runner /lava-3300087/1
    2023-02-07T09:00:30.577900  =

    2023-02-07T09:00:30.582555  / # /lava-3300087/bin/lava-test-runner /lav=
a-3300087/1
    2023-02-07T09:00:30.666667  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21756eaa3a3aadd8c863b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21756eaa3a3aadd8c8644
        failing since 20 days (last pass: next-20221219, first fail: next-2=
0230117)

    2023-02-07T09:17:55.191219  <3>[   15.917269] Bluetooth: hci0: command =
0x0c03 tx timeout
    2023-02-07T09:17:55.191809  + set +x
    2023-02-07T09:17:55.203474  <8>[   15.925499] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3300459_1.5.2.4.1>
    2023-02-07T09:17:55.312081  / # #
    2023-02-07T09:17:55.413634  export SHELL=3D/bin/sh
    2023-02-07T09:17:55.414030  #
    2023-02-07T09:17:55.515140  / # export SHELL=3D/bin/sh. /lava-3300459/e=
nvironment
    2023-02-07T09:17:55.515596  =

    2023-02-07T09:17:55.616968  / # . /lava-3300459/environment/lava-330045=
9/bin/lava-test-runner /lava-3300459/1
    2023-02-07T09:17:55.617664   =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2199637823e3ee68c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2199637823e3ee68c8648
        failing since 32 days (last pass: next-20221124, first fail: next-2=
0230106)

    2023-02-07T09:27:40.144599  [   19.704034] <LAVA_SIGNAL_ENDRUN 0_dmesg =
1153597_1.5.2.4.1>
    2023-02-07T09:27:40.251969  / # #
    2023-02-07T09:27:40.353730  export SHELL=3D/bin/sh
    2023-02-07T09:27:40.354179  #
    2023-02-07T09:27:40.455534  / # export SHELL=3D/bin/sh. /lava-1153597/e=
nvironment
    2023-02-07T09:27:40.455996  =

    2023-02-07T09:27:40.557367  / # . /lava-1153597/environment/lava-115359=
7/bin/lava-test-runner /lava-1153597/1
    2023-02-07T09:27:40.558092  =

    2023-02-07T09:27:40.560023  / # /lava-1153597/bin/lava-test-runner /lav=
a-1153597/1
    2023-02-07T09:27:40.580517  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
fsl-ls1088a-rdb              | arm64  | lab-nxp         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2165cd0644420a28c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2165cd0644420a28c8=
63f
        failing since 15 days (last pass: next-20230120, first fail: next-2=
0230123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214014e6cb9f69f8c8649

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e214014e6cb9f69f8c8652
        failing since 8 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-07T09:03:41.311486  + set +x
    2023-02-07T09:03:41.311691  [   13.190470] <LAVA_SIGNAL_ENDRUN 0_dmesg =
899991_1.5.2.3.1>
    2023-02-07T09:03:41.419661  / # #
    2023-02-07T09:03:41.521406  export SHELL=3D/bin/sh
    2023-02-07T09:03:41.521880  #
    2023-02-07T09:03:41.623266  / # export SHELL=3D/bin/sh. /lava-899991/en=
vironment
    2023-02-07T09:03:41.624007  =

    2023-02-07T09:03:41.725552  / # . /lava-899991/environment/lava-899991/=
bin/lava-test-runner /lava-899991/1
    2023-02-07T09:03:41.726500  =

    2023-02-07T09:03:41.729743  / # /lava-899991/bin/lava-test-runner /lava=
-899991/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2136119f5a4c08d8c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx53-qsr=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2136119f5a4c08d8c8643
        failing since 8 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-07T09:00:59.373464  + set +x
    2023-02-07T09:00:59.373631  [   12.131105] <LAVA_SIGNAL_ENDRUN 0_dmesg =
899978_1.5.2.3.1>
    2023-02-07T09:00:59.480700  / # #
    2023-02-07T09:00:59.582146  export SHELL=3D/bin/sh
    2023-02-07T09:00:59.582479  #
    2023-02-07T09:00:59.683748  / # export SHELL=3D/bin/sh. /lava-899978/en=
vironment
    2023-02-07T09:00:59.684189  =

    2023-02-07T09:00:59.785436  / # . /lava-899978/environment/lava-899978/=
bin/lava-test-runner /lava-899978/1
    2023-02-07T09:00:59.785972  =

    2023-02-07T09:00:59.789542  / # /lava-899978/bin/lava-test-runner /lava=
-899978/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx53-qsrb                   | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21735492ac3f6cf8c8636

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx53-qsrb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21735492ac3f6cf8c863f
        failing since 8 days (last pass: next-20221206, first fail: next-20=
230130)

    2023-02-07T09:17:21.545628  + set +x
    2023-02-07T09:17:21.545808  [   13.069226] <LAVA_SIGNAL_ENDRUN 0_dmesg =
900009_1.5.2.3.1>
    2023-02-07T09:17:21.654102  / # #
    2023-02-07T09:17:21.755767  export SHELL=3D/bin/sh
    2023-02-07T09:17:21.756347  #
    2023-02-07T09:17:21.857572  / # export SHELL=3D/bin/sh. /lava-900009/en=
vironment
    2023-02-07T09:17:21.858077  =

    2023-02-07T09:17:21.959312  / # . /lava-900009/environment/lava-900009/=
bin/lava-test-runner /lava-900009/1
    2023-02-07T09:17:21.960014  =

    2023-02-07T09:17:21.963177  / # /lava-900009/bin/lava-test-runner /lava=
-900009/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6dl-riotboard             | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21736492ac3f6cf8c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21736492ac3f6cf8c864a
        new failure (last pass: next-20230206)

    2023-02-07T09:17:24.928404  + set[   15.061077] <LAVA_SIGNAL_ENDRUN 0_d=
mesg 900011_1.5.2.3.1>
    2023-02-07T09:17:24.928676   +x
    2023-02-07T09:17:25.034971  / # #
    2023-02-07T09:17:25.136720  export SHELL=3D/bin/sh
    2023-02-07T09:17:25.137235  #
    2023-02-07T09:17:25.238285  / # export SHELL=3D/bin/sh. /lava-900011/en=
vironment
    2023-02-07T09:17:25.238750  =

    2023-02-07T09:17:25.340176  / # . /lava-900011/environment/lava-900011/=
bin/lava-test-runner /lava-900011/1
    2023-02-07T09:17:25.340940  =

    2023-02-07T09:17:25.343677  / # /lava-900011/bin/lava-test-runner /lava=
-900011/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21c4ce9e09a8a208c8664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21c4ce9e09a8a208c8=
665
        failing since 33 days (last pass: next-20221124, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214a2a8e5c627228c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e214a2a8e5c627228c8=
632
        failing since 33 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e217af7243ea79528c8649

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-nxp/baseline-imx8mp-evk.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e217af7243ea79528c8=
64a
        failing since 33 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21930f82af56ed28c8648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21930f82af56ed28c8=
649
        failing since 33 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21e9665e80436fd8c8697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21e9665e80436fd8c8=
698
        failing since 33 days (last pass: next-20221226, first fail: next-2=
0230105) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214e1816c21978c8c8664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e214e1816c21978c8c8=
665
        failing since 167 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e211fa3ab31a55558c867a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e211fa3ab31a55558c8=
67b
        failing since 301 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e215500bb2fd9f548c8690

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/risc=
v/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100-starfive-visionfive=
-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e215500bb2fd9f548c8=
691
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63e216e0f511c3660d8c8641

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e216e0f511c3660d8c8648
        new failure (last pass: next-20230206)

    2023-02-07T09:15:51.276462  / # #
    2023-02-07T09:15:51.378456  export SHELL=3D/bin/sh
    2023-02-07T09:15:51.378880  #
    2023-02-07T09:15:51.480325  / # export SHELL=3D/bin/sh. /lava-267605/en=
vironment
    2023-02-07T09:15:51.480791  =

    2023-02-07T09:15:51.582328  / # . /lava-267605/environment/lava-267605/=
bin/lava-test-runner /lava-267605/1
    2023-02-07T09:15:51.583053  =

    2023-02-07T09:15:51.588390  / # /lava-267605/bin/lava-test-runner /lava=
-267605/1
    2023-02-07T09:15:51.655294  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T09:15:51.655602  + <8>[   22.418260] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 267605_1.5.2.4.5> =

    ... (14 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e216e0f511c3660d8c864c
        new failure (last pass: next-20230206)

    2023-02-07T09:15:52.719131  <8>[   23.506384] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-driver-present RESULT=3Dpass>
    2023-02-07T09:15:53.778923  /lava-267605/1/../bin/lava-test-case
    2023-02-07T09:15:53.779198  <8>[   24.528460] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-07T09:15:53.779350  /lava-267605/1/../bin/lava-test-case
    2023-02-07T09:15:53.779492  <8>[   24.545791] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e216e0f511c3660d8c864e
        new failure (last pass: next-20230206)

    2023-02-07T09:15:54.816564  /lava-267605/1/../bin/lava-test-case
    2023-02-07T09:15:54.816949  <8>[   25.568107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e216e0f511c3660d8c8653
        new failure (last pass: next-20230206)

    2023-02-07T09:15:55.892601  /lava-267605/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e216e0f511c3660d8c8654
        new failure (last pass: next-20230206)

    2023-02-07T09:15:55.895856  <8>[   26.683871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-07T09:15:56.953685  /lava-267605/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 5          =


  Details:     https://kernelci.org/test/plan/id/63e211f3a1f9085ab88c8659

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e211f3a1f9085ab88c8660
        new failure (last pass: next-20230206)

    2023-02-07T08:55:00.502966  / # #
    2023-02-07T08:55:00.604921  export SHELL=3D/bin/sh
    2023-02-07T08:55:00.605431  #
    2023-02-07T08:55:00.706858  / # export SHELL=3D/bin/sh. /lava-267531/en=
vironment
    2023-02-07T08:55:00.707375  =

    2023-02-07T08:55:00.808875  / # . /lava-267531/environment/lava-267531/=
bin/lava-test-runner /lava-267531/1
    2023-02-07T08:55:00.809733  =

    2023-02-07T08:55:00.814773  / # /lava-267531/bin/lava-test-runner /lava=
-267531/1
    2023-02-07T08:55:00.881861  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T08:55:00.882236  + <8>[   22.439829] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 267531_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e211f3a1f9085ab88c8664
        new failure (last pass: next-20230206)

    2023-02-07T08:55:02.976997  /lava-267531/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e211f3a1f9085ab88c8666
        new failure (last pass: next-20230206)

    2023-02-07T08:55:04.037104  /lava-267531/1/../bin/lava-test-case
    2023-02-07T08:55:04.037484  <8>[   25.584528] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e211f3a1f9085ab88c866b
        new failure (last pass: next-20230206)

    2023-02-07T08:55:05.113097  /lava-267531/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e211f3a1f9085ab88c866c
        new failure (last pass: next-20230206)

    2023-02-07T08:55:05.116269  <8>[   26.699200] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-07T08:55:06.171152  /lava-267531/1/../bin/lava-test-case
    2023-02-07T08:55:06.171591  <8>[   27.719477] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-07T08:55:06.171857  /lava-267531/1/../bin/lava-test-case
    2023-02-07T08:55:06.172094  <8>[   27.738514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-07T08:55:06.172338  /lava-267531/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e2126d38833451298c8632

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2126d38833451298c8639
        new failure (last pass: next-20230206)

    2023-02-07T08:57:01.613028  / # #
    2023-02-07T08:57:01.715025  export SHELL=3D/bin/sh
    2023-02-07T08:57:01.715471  #
    2023-02-07T08:57:01.816927  / # export SHELL=3D/bin/sh. /lava-267543/en=
vironment
    2023-02-07T08:57:01.817367  =

    2023-02-07T08:57:01.918794  / # . /lava-267543/environment/lava-267543/=
bin/lava-test-runner /lava-267543/1
    2023-02-07T08:57:01.919504  =

    2023-02-07T08:57:01.938490  / # /lava-267543/bin/lava-test-runner /lava=
-267543/1
    2023-02-07T08:57:01.991446  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T08:57:01.991748  + <8>[   22.394350] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 267543_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e2126d38833451298c863d
        new failure (last pass: next-20230206)

    2023-02-07T08:57:04.084681  /lava-267543/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e2126d38833451298c863f
        new failure (last pass: next-20230206)

    2023-02-07T08:57:05.142416  /lava-267543/1/../bin/lava-test-case
    2023-02-07T08:57:05.142760  <8>[   25.536864] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-07T08:57:05.143063  /lava-267543/1/../bin/lava-test-case
    2023-02-07T08:57:05.143317  <8>[   25.555119] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-07T08:57:05.143470  /lava-267543/1/../bin/lava-test-case
    2023-02-07T08:57:05.143619  <8>[   25.573631] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-07T08:57:05.143767  /lava-267543/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e2126d38833451298c8644
        new failure (last pass: next-20230206)

    2023-02-07T08:57:06.216608  /lava-267543/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e2126d38833451298c8645
        new failure (last pass: next-20230206)

    2023-02-07T08:57:06.218724  <8>[   26.647841] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-07T08:57:07.277545  /lava-267543/1/../bin/lava-test-case
    2023-02-07T08:57:07.277991  <8>[   27.668882] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-07T08:57:07.278230  /lava-267543/1/../bin/lava-test-case
    2023-02-07T08:57:07.278454  <8>[   27.686135] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-07T08:57:07.278676  /lava-267543/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+debug              | 5          =


  Details:     https://kernelci.org/test/plan/id/63e21347829cc86ed28c8669

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21347829cc86ed28c8670
        new failure (last pass: next-20230206)

    2023-02-07T09:00:09.093875  + set +x
    2023-02-07T09:00:09.097045  <8>[   45.839125][  T187] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 267553_1.5.2.4.1>
    2023-02-07T09:00:09.216408  #
    2023-02-07T09:00:09.318769  / # #export SHELL=3D/bin/sh
    2023-02-07T09:00:09.319320  =

    2023-02-07T09:00:09.421390  / # export SHELL=3D/bin/sh. /lava-267553/en=
vironment
    2023-02-07T09:00:09.422020  =

    2023-02-07T09:00:09.523583  / # . /lava-267553/environment/lava-267553/=
bin/lava-test-runner /lava-267553/1
    2023-02-07T09:00:09.525118  =

    2023-02-07T09:00:09.544820  / # /lava-267553/bin/lava-test-runner /lava=
-267553/1 =

    ... (16 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e21347829cc86ed28c8674
        new failure (last pass: next-20230206)

    2023-02-07T09:00:13.880983  /lava-267553/1/../bin/lava-test-case
    2023-02-07T09:00:13.972936  <8>[   50.714455][  T256] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e21347829cc86ed28c867e
        new failure (last pass: next-20230206)

    2023-02-07T09:00:15.473445  /lava-267553/1/../bin/lava-test-case
    2023-02-07T09:00:15.576516  <8>[   52.318523][  T266] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e21347829cc86ed28c8682
        new failure (last pass: next-20230206)

    2023-02-07T09:00:18.301466  /lava-267553/1/../bin/lava-test-case
    2023-02-07T09:00:18.418358  <8>[   55.157481][  T297] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e21347829cc86ed28c8683
        new failure (last pass: next-20230206)

    2023-02-07T09:00:19.666000  /lava-267553/1/../bin/lava-test-case
    2023-02-07T09:00:19.783998  <8>[   56.525321][  T303] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 5          =


  Details:     https://kernelci.org/test/plan/id/63e213c1f8a67794388c8631

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e213c1f8a67794388c8638
        new failure (last pass: next-20230206)

    2023-02-07T09:02:39.812293  / # #
    2023-02-07T09:02:39.914368  export SHELL=3D/bin/sh
    2023-02-07T09:02:39.915055  #
    2023-02-07T09:02:40.016149  / # export SHELL=3D/bin/sh. /lava-267566/en=
vironment
    2023-02-07T09:02:40.016842  =

    2023-02-07T09:02:40.118214  / # . /lava-267566/environment/lava-267566/=
bin/lava-test-runner /lava-267566/1
    2023-02-07T09:02:40.119064  =

    2023-02-07T09:02:40.122960  / # /lava-267566/bin/lava-test-runner /lava=
-267566/1
    2023-02-07T09:02:40.191084  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T09:02:40.191390  + <8>[   22.338048] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 267566_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e213c1f8a67794388c863c
        new failure (last pass: next-20230206)

    2023-02-07T09:02:42.285165  /lava-267566/1/../bin/lava-test-case
    2023-02-07T09:02:42.285467  <8>[   24.443429] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-07T09:02:42.285627  /lava-267566/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e213c1f8a67794388c863e
        new failure (last pass: next-20230206)

    2023-02-07T09:02:43.343517  /lava-267566/1/../bin/lava-test-case
    2023-02-07T09:02:43.343819  <8>[   25.482886] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-02-07T09:02:43.343969  /lava-267566/1/../bin/lava-test-case
    2023-02-07T09:02:43.344108  <8>[   25.500248] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>
    2023-02-07T09:02:43.344245  /lava-267566/1/../bin/lava-test-case
    2023-02-07T09:02:43.344379  <8>[   25.518796] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-probed RESULT=3Dpass>
    2023-02-07T09:02:43.344511  /lava-267566/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e213c1f8a67794388c8643
        new failure (last pass: next-20230206)

    2023-02-07T09:02:44.417448  /lava-267566/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e213c1f8a67794388c8644
        new failure (last pass: next-20230206)

    2023-02-07T09:02:44.420511  <8>[   26.592327] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-07T09:02:45.474115  /lava-267566/1/../bin/lava-test-case
    2023-02-07T09:02:45.474390  <8>[   27.612449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-07T09:02:45.474538  /lava-267566/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 5          =


  Details:     https://kernelci.org/test/plan/id/63e2144d6292d3ca7e8c8664

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2144d6292d3ca7e8c866b
        new failure (last pass: next-20230206)

    2023-02-07T09:04:47.843431  / # #
    2023-02-07T09:04:47.945533  export SHELL=3D/bin/sh
    2023-02-07T09:04:47.946100  #
    2023-02-07T09:04:48.047536  / # export SHELL=3D/bin/sh. /lava-267573/en=
vironment
    2023-02-07T09:04:48.048104  =

    2023-02-07T09:04:48.149547  / # . /lava-267573/environment/lava-267573/=
bin/lava-test-runner /lava-267573/1
    2023-02-07T09:04:48.150464  =

    2023-02-07T09:04:48.156323  / # /lava-267573/bin/lava-test-runner /lava=
-267573/1
    2023-02-07T09:04:48.224273  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T09:04:48.224675  + <8>[   22.419359] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 267573_1.5.2.4.5> =

    ... (17 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e2144d6292d3ca7e8c866f
        new failure (last pass: next-20230206)

    2023-02-07T09:04:50.317412  /lava-267573/1/../bin/lava-test-case
    2023-02-07T09:04:50.317890  <8>[   24.523956] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-07T09:04:50.318133  /lava-267573/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e2144d6292d3ca7e8c8671
        new failure (last pass: next-20230206)

    2023-02-07T09:04:51.372245  /lava-267573/1/../bin/lava-test-case
    2023-02-07T09:04:51.372651  <8>[   25.560611] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e2144d6292d3ca7e8c8676
        new failure (last pass: next-20230206)

    2023-02-07T09:04:52.445510  /lava-267573/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e2144d6292d3ca7e8c8677
        new failure (last pass: next-20230206)

    2023-02-07T09:04:52.448749  <8>[   26.668708] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-07T09:04:53.506348  /lava-267573/1/../bin/lava-test-case
    2023-02-07T09:04:53.506621  <8>[   27.689352] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-07T09:04:53.506773  /lava-267573/1/../bin/lava-test-case
    2023-02-07T09:04:53.506916  <8>[   27.706574] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-driver-present RESULT=3Dpass>
    2023-02-07T09:04:53.507058  /lava-267573/1/../bin/lava-test-case
    2023-02-07T09:04:53.507192  <8>[   27.726768] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc_mdio-probed RESULT=3Dpass>
    2023-02-07T09:04:53.507327  /lava-267573/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+crypto             | 5          =


  Details:     https://kernelci.org/test/plan/id/63e214d716939994c28c8631

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e214d716939994c28c8638
        new failure (last pass: next-20230206)

    2023-02-07T09:07:24.332069  / # #
    2023-02-07T09:07:24.434082  export SHELL=3D/bin/sh
    2023-02-07T09:07:24.434731  #
    2023-02-07T09:07:24.536022  / # export SHELL=3D/bin/sh. /lava-267581/en=
vironment
    2023-02-07T09:07:24.536721  =

    2023-02-07T09:07:24.638125  / # . /lava-267581/environment/lava-267581/=
bin/lava-test-runner /lava-267581/1
    2023-02-07T09:07:24.639045  =

    2023-02-07T09:07:24.644277  / # /lava-267581/bin/lava-test-runner /lava=
-267581/1
    2023-02-07T09:07:24.711240  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T09:07:24.711557  + <8>[   43.247570] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 267581_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e214d716939994c28c863c
        new failure (last pass: next-20230206)

    2023-02-07T09:07:26.805326  /lava-267581/1/../bin/lava-test-case
    2023-02-07T09:07:26.805733  <8>[   45.353887] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-07T09:07:26.806036  /lava-267581/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e214d716939994c28c863e
        new failure (last pass: next-20230206)

    2023-02-07T09:07:27.862346  /lava-267581/1/../bin/lava-test-case
    2023-02-07T09:07:27.862729  <8>[   46.391624] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e214d716939994c28c8643
        new failure (last pass: next-20230206)

    2023-02-07T09:07:28.935530  /lava-267581/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e214d716939994c28c8644
        new failure (last pass: next-20230206)

    2023-02-07T09:07:28.938668  <8>[   47.500486] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-07T09:07:29.994748  /lava-267581/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2185b156046c2dd8c865e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2185b156046c2dd8c8=
65f
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron     | gcc-10   | defcon=
fig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/63e218d4a1f67fa11d8c8665

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e218d4a1f67fa11d8c866c
        new failure (last pass: next-20230206)

    2023-02-07T09:24:21.626956  / # #
    2023-02-07T09:24:21.728826  export SHELL=3D/bin/sh
    2023-02-07T09:24:21.729252  #
    2023-02-07T09:24:21.830685  / # export SHELL=3D/bin/sh. /lava-267618/en=
vironment
    2023-02-07T09:24:21.831172  =

    2023-02-07T09:24:21.932617  / # . /lava-267618/environment/lava-267618/=
bin/lava-test-runner /lava-267618/1
    2023-02-07T09:24:21.933505  =

    2023-02-07T09:24:21.938982  / # /lava-267618/bin/lava-test-runner /lava=
-267618/1
    2023-02-07T09:24:22.006029  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T09:24:22.006446  + <8>[   22.486477] <LAVA_SIGNAL_STARTRUN 1=
_bootrr 267618_1.5.2.4.5> =

    ... (15 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/63e218d4a1f67fa11d8c8670
        new failure (last pass: next-20230206)

    2023-02-07T09:24:24.102999  /lava-267618/1/../bin/lava-test-case
    2023-02-07T09:24:24.103627  <8>[   24.595650] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-02-07T09:24:24.103900  /lava-267618/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/63=
e218d4a1f67fa11d8c8672
        new failure (last pass: next-20230206)

    2023-02-07T09:24:25.162363  /lava-267618/1/../bin/lava-test-case
    2023-02-07T09:24:25.162758  <8>[   25.633380] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/63e218d5a1f67fa11d8c8677
        new failure (last pass: next-20230206)

    2023-02-07T09:24:26.238216  /lava-267618/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/63e218d5a1f67fa11d8c8678
        new failure (last pass: next-20230206)

    2023-02-07T09:24:26.241434  <8>[   26.747382] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-02-07T09:24:27.294014  /lava-267618/1/../bin/lava-test-case
    2023-02-07T09:24:27.294412  <8>[   27.768674] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc1-probed RESULT=3Dfail>
    2023-02-07T09:24:27.294653  /lava-267618/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | clang-16 | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63e219b6e18f311ae28c8637

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e219b6e18f311ae28c8648
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:27:56.710763  /lava-267602/1/../bin/lava-test-case
    2023-02-07T09:27:56.713942  <8>[   17.186772] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
219b6e18f311ae28c864a
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:27:58.717961  /lava-267602/1/../bin/lava-test-case
    2023-02-07T09:27:58.718337  <8>[   19.261299] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+videodec           | 2          =


  Details:     https://kernelci.org/test/plan/id/63e2136f19f5a4c08d8c865b

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e2136f19f5a4c08d8c866c
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:01:25.602943  /lava-267535/1/../bin/lava-test-case
    2023-02-07T09:01:25.606081  <8>[   18.156404] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
2136f19f5a4c08d8c866e
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:01:27.615089  /lava-267535/1/../bin/lava-test-case
    2023-02-07T09:01:27.615456  <8>[   20.230358] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/63e213e7766904e6908c86b8

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-p=
itx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e213e7766904e6908c86c9
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:03:17.114277  /lava-267542/1/../bin/lava-test-case
    2023-02-07T09:03:17.117417  <8>[   17.997559] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
213e7766904e6908c86cb
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:03:18.126283  <8>[   19.043715] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-driver-present RESULT=3Dpass>
    2023-02-07T09:03:19.126659  /lava-267542/1/../bin/lava-test-case
    2023-02-07T09:03:19.127053  <8>[   20.071449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2023-02-07T09:03:19.127294  /lava-267542/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-pitx-imx8m           | arm64  | lab-kontron     | gcc-10   | defcon=
fig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/63e216405352e973028c8651

  Results:     50 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-driver-present: https://kernelci.org/test/ca=
se/id/63e216405352e973028c8662
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:13:11.373971  /lava-267568/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/63e=
216405352e973028c8664
        failing since 19 days (last pass: next-20230118, first fail: next-2=
0230119)

    2023-02-07T09:13:13.379345  /lava-267568/1/../bin/lava-test-case
    2023-02-07T09:13:13.379725  <8>[   20.104680] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e212d2f6e8ef28bb8c864f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-lenovo-TPa=
d-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e212d2f6e8ef28bb8c8=
650
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
lenovo-TPad-C13-Yoga-zork    | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21574db4776d23c8c863e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/x86_=
64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab-collabora/baseline-=
lenovo-TPad-C13-Yoga-zork.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21574db4776d23c8c8=
63f
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2164452d77b99668c8680

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2164452d77b99668c8689
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:13:21.117243  <8>[   17.865639] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3300477_1.5.2.4.1>
    2023-02-07T09:13:21.221023  / # #
    2023-02-07T09:13:21.323691  export SHELL=3D/bin/sh
    2023-02-07T09:13:21.324076  #
    2023-02-07T09:13:21.425394  / # export SHELL=3D/bin/sh. /lava-3300477/e=
nvironment
    2023-02-07T09:13:21.425774  <3>[   18.097195] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:13:21.426006  =

    2023-02-07T09:13:21.527516  / # . /lava-3300477/environment/lava-330047=
7/bin/lava-test-runner /lava-3300477/1
    2023-02-07T09:13:21.528220  =

    2023-02-07T09:13:21.537823  / # /lava-3300477/bin/lava-test-runner /lav=
a-3300477/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e211bba9d113e6f48c8685

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e211bba9d113e6f48c868e
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T08:54:11.041610  <8>[   18.152010] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3300002_1.5.2.4.1>
    2023-02-07T08:54:11.145750  / # #
    2023-02-07T08:54:11.248519  export SHELL=3D/bin/sh
    2023-02-07T08:54:11.248912  #
    2023-02-07T08:54:11.350305  / # export SHELL=3D/bin/sh. /lava-3300002/e=
nvironment
    2023-02-07T08:54:11.350693  =

    2023-02-07T08:54:11.350934  / # <3>[   18.391416] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T08:54:11.452346  . /lava-3300002/environment/lava-3300002/bi=
n/lava-test-runner /lava-3300002/1
    2023-02-07T08:54:11.453319  =

    2023-02-07T08:54:11.466820  / # /lava-3300002/bin/lava-test-runner /lav=
a-3300002/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2121f14e7156cb48c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-g1=
2a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2121f14e7156cb48c863b
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T08:55:54.153579  / # #
    2023-02-07T08:55:54.255358  export SHELL=3D/bin/sh
    2023-02-07T08:55:54.255768  #
    2023-02-07T08:55:54.357160  / # export SHELL=3D/bin/sh. /lava-3300025/e=
nvironment
    2023-02-07T08:55:54.357974  =

    2023-02-07T08:55:54.358686  / # <3>[   18.518788] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T08:55:54.461156  . /lava-3300025/environment/lava-3300025/bi=
n/lava-test-runner /lava-3300025/1
    2023-02-07T08:55:54.462470  =

    2023-02-07T08:55:54.465944  / # /lava-3300025/bin/lava-test-runner /lav=
a-3300025/1
    2023-02-07T08:55:54.507181  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2137425854965e38c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2137425854965e38c864e
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:01:29.487366  / # #
    2023-02-07T09:01:29.589663  export SHELL=3D/bin/sh
    2023-02-07T09:01:29.590093  #
    2023-02-07T09:01:29.691434  / # export SHELL=3D/bin/sh. /lava-3300246/e=
nvironment
    2023-02-07T09:01:29.691855  <3>[   18.403485] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:01:29.692310  =

    2023-02-07T09:01:29.794299  / # . /lava-3300246/environment/lava-330024=
6/bin/lava-test-runner /lava-3300246/1
    2023-02-07T09:01:29.795938  =

    2023-02-07T09:01:29.804224  / # /lava-3300246/bin/lava-test-runner /lav=
a-3300246/1
    2023-02-07T09:01:29.868179  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e213eb04ad70cd1b8c863b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e213eb04ad70cd1b8c8644
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:03:16.116579  / # #
    2023-02-07T09:03:16.219390  export SHELL=3D/bin/sh
    2023-02-07T09:03:16.219781  #
    2023-02-07T09:03:16.321208  / # export SHELL=3D/bin/sh. /lava-3300302/e=
nvironment
    2023-02-07T09:03:16.321781  <3>[   18.168135] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:03:16.322132  =

    2023-02-07T09:03:16.423820  / # . /lava-3300302/environment/lava-330030=
2/bin/lava-test-runner /lava-3300302/1
    2023-02-07T09:03:16.424526  =

    2023-02-07T09:03:16.434737  / # /lava-3300302/bin/lava-test-runner /lav=
a-3300302/1
    2023-02-07T09:03:16.499647  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2148beb6b9f562d8c8687

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2148ceb6b9f562d8c8690
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:06:13.752147  #
    2023-02-07T09:06:13.854897  / # #export SHELL=3D/bin/sh
    2023-02-07T09:06:13.856042  =

    2023-02-07T09:06:13.957483  / # export SHELL=3D/bin/sh. /lava-3300336/e=
nvironment
    2023-02-07T09:06:13.958259  =

    2023-02-07T09:06:13.958705  / # <3>[  103.002320] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:06:14.060715  . /lava-3300336/environment/lava-3300336/bi=
n/lava-test-runner /lava-3300336/1
    2023-02-07T09:06:14.062104  =

    2023-02-07T09:06:14.075812  / # /lava-3300336/bin/lava-test-runner /lav=
a-3300336/1
    2023-02-07T09:06:14.132668  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e217e8bac3a7d18f8c8642

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e217e8bac3a7d18f8c864b
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:20:30.267542  / # #
    2023-02-07T09:20:30.369800  export SHELL=3D/bin/sh
    2023-02-07T09:20:30.370257  #
    2023-02-07T09:20:30.471773  / # export SHELL=3D/bin/sh. /lava-3300610/e=
nvironment
    2023-02-07T09:20:30.472225  =

    2023-02-07T09:20:30.472540  / # <3>[   18.512220] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:20:30.574163  . /lava-3300610/environment/lava-3300610/bi=
n/lava-test-runner /lava-3300610/1
    2023-02-07T09:20:30.575381  =

    2023-02-07T09:20:30.587024  / # /lava-3300610/bin/lava-test-runner /lav=
a-3300610/1
    2023-02-07T09:20:30.644892  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (13 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e219a9573ef656528c8705

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e219a9573ef656528c8=
706
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21aafb5ffa841588c8640

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21aafb5ffa841588c8=
641
        failing since 13 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21778eaa3a3aadd8c866d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-=
vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21778eaa3a3aadd8c8=
66e
        failing since 13 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21751eaa3a3aadd8c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-meson-g12b-a311d-khadas=
-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21751eaa3a3aadd8c8=
633
        failing since 13 days (last pass: next-20230124, first fail: next-2=
0230125) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21824598fd4a2438c8729

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21824598fd4a2438c8=
72a
        failing since 1 day (last pass: next-20230203, first fail: next-202=
30206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2174a2db9f5193b8c8635

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2174a2db9f5193b8c863e
        failing since 20 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-07T09:17:39.690832  / # #
    2023-02-07T09:17:39.793398  export SHELL=3D/bin/sh
    2023-02-07T09:17:39.794131  #<3>[   18.879679] brcmfmac: brcmf_sdio_htc=
lk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:17:39.794481  =

    2023-02-07T09:17:39.896011  / # export SHELL=3D/bin/sh. /lava-3300514/e=
nvironment
    2023-02-07T09:17:39.896723  =

    2023-02-07T09:17:39.998402  / # . /lava-3300514/environment/lava-330051=
4/bin/lava-test-runner /lava-3300514/1
    2023-02-07T09:17:39.999317  =

    2023-02-07T09:17:40.007582  / # /lava-3300514/bin/lava-test-runner /lav=
a-3300514/1
    2023-02-07T09:17:40.039533  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e211dfa1f9085ab88c8647

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e211dfa1f9085ab88c8650
        failing since 20 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-07T08:54:41.665282  + set +x<8>[   18.662093] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3299987_1.5.2.4.1>
    2023-02-07T08:54:41.770692  / # #
    2023-02-07T08:54:41.872654  export SHELL=3D/bin/sh
    2023-02-07T08:54:41.873167  #
    2023-02-07T08:54:41.974482  / # export SHELL=3D/bin/sh. /lava-3299987/e=
nvironment
    2023-02-07T08:54:41.974847  =

    2023-02-07T08:54:42.076211  / # . /lava-3299987/environment/lava-329998=
7/bin/lava-test-runner /lava-3299987/1
    2023-02-07T08:54:42.076881  =

    2023-02-07T08:54:42.081910  / # /lava-3299987/bin/lava-test-runner /lav=
a-3299987/1
    2023-02-07T08:54:42.153743  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21256fc03c4b2988c865c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21256fc03c4b2988c8665
        failing since 20 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-07T08:56:41.623456  <8>[   18.633925] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2023-02-07T08:56:41.625759  + set +x<8>[   18.637722] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3300031_1.5.2.4.1>
    2023-02-07T08:56:41.626049  =

    2023-02-07T08:56:41.731733  / # #
    2023-02-07T08:56:41.833607  export SHELL=3D/bin/sh
    2023-02-07T08:56:41.834104  #
    2023-02-07T08:56:41.935501  / # export SHELL=3D/bin/sh. /lava-3300031/e=
nvironment
    2023-02-07T08:56:41.935899  =

    2023-02-07T08:56:42.037363  / # . /lava-3300031/environment/lava-330003=
1/bin/lava-test-runner /lava-3300031/1
    2023-02-07T08:56:42.038040   =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21468c9ab9cb6538c865f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21468c9ab9cb6538c8668
        failing since 20 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-07T09:05:25.171776  / # #
    2023-02-07T09:05:25.273670  export SHELL=3D/bin/sh
    2023-02-07T09:05:25.274029  <3>[   18.298538] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:05:25.274269  #
    2023-02-07T09:05:25.375581  / # export SHELL=3D/bin/sh. /lava-3300240/e=
nvironment
    2023-02-07T09:05:25.376034  =

    2023-02-07T09:05:25.477464  / # . /lava-3300240/environment/lava-330024=
0/bin/lava-test-runner /lava-3300240/1
    2023-02-07T09:05:25.478290  =

    2023-02-07T09:05:25.496127  / # /lava-3300240/bin/lava-test-runner /lav=
a-3300240/1
    2023-02-07T09:05:25.555022  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214f3ffbfcc96c78c8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e214f3ffbfcc96c78c8659
        failing since 20 days (last pass: next-20221129, first fail: next-2=
0230118)

    2023-02-07T09:07:11.609740  / # #
    2023-02-07T09:07:11.711420  export SHELL=3D/bin/sh
    2023-02-07T09:07:11.711774  #
    2023-02-07T09:07:11.813088  / # export SHELL=3D/bin/sh. /lava-3300311/e=
nvironment
    2023-02-07T09:07:11.813446  =

    2023-02-07T09:07:11.914795  / # . /lava-3300311/environment/lava-330031=
1/bin/lava-test-runner /lava-3300311/1
    2023-02-07T09:07:11.915404  =

    2023-02-07T09:07:11.921159  / # /lava-3300311/bin/lava-test-runner /lav=
a-3300311/1
    2023-02-07T09:07:11.995978  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T09:07:11.996479  + cd /lava-3300311/1/tests/1_bootrr =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e215703a15be2fe18c86b6

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e215703a15be2fe18c86bf
        failing since 20 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-07T09:09:55.066154  / # #
    2023-02-07T09:09:55.168029  export SHELL=3D/bin/sh
    2023-02-07T09:09:55.168451  #
    2023-02-07T09:09:55.269871  / # export SHELL=3D/bin/sh. /lava-3300360/e=
nvironment
    2023-02-07T09:09:55.270394  =

    2023-02-07T09:09:55.371773  / # . /lava-3300360/environment/lava-330036=
0/bin/lava-test-runner /lava-3300360/1
    2023-02-07T09:09:55.372548  =

    2023-02-07T09:09:55.377347  / # /lava-3300360/bin/lava-test-runner /lav=
a-3300360/1
    2023-02-07T09:09:55.449193  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T09:09:55.449459  + cd /lava-3300360/1/tests/1_bootrr =

    ... (15 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e218b83e6686f14a8c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e218b83e6686f14a8c8=
657
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21920b278d29c688c8693

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21920b278d29c688c869c
        failing since 20 days (last pass: next-20221130, first fail: next-2=
0230118)

    2023-02-07T09:25:34.477829  / # #
    2023-02-07T09:25:34.579740  export SHELL=3D/bin/sh
    2023-02-07T09:25:34.580247  #<3>[   18.178354] brcmfmac: brcmf_sdio_htc=
lk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:25:34.580515  =

    2023-02-07T09:25:34.681894  / # export SHELL=3D/bin/sh. /lava-3300576/e=
nvironment
    2023-02-07T09:25:34.682399  =

    2023-02-07T09:25:34.783835  / # . /lava-3300576/environment/lava-330057=
6/bin/lava-test-runner /lava-3300576/1
    2023-02-07T09:25:34.784639  =

    2023-02-07T09:25:34.802816  / # /lava-3300576/bin/lava-test-runner /lav=
a-3300576/1
    2023-02-07T09:25:34.861704  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21fb687c7a047938c864d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21fb687c7a047938c8=
64e
        failing since 1 day (last pass: next-20230203, first fail: next-202=
30206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21a67d6e84a8ce38c8632

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21a67d6e84a8ce38c8=
633
        new failure (last pass: next-20230203) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2192f73b05102b48c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-khadas-v=
im.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2192f73b05102b48c8=
630
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e218b9421d5220548c865a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxl-s905x-libretec=
h-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e218b9421d5220548c8=
65b
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21ac0b5ffa841588c876c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-meson-gxl-s905x-libretech=
-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21ac0b5ffa841588c8=
76d
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21b16ca93a0c7e38c863c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-meson-gxl-s905x-libretech-=
cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21b16ca93a0c7e38c8=
63d
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21764eaa3a3aadd8c8656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21764eaa3a3aadd8c8=
657
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21804532188d80f8c869a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meson-gxm-khadas-vim2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21804532188d80f8c8=
69b
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2253c749c3fe8d68c8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2253c749c3fe8d68c8=
653
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | clang-16 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2163852d77b99668c866d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/clang-16/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2163852d77b99668c8676
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:13:15.791531  / # #
    2023-02-07T09:13:15.893036  export SHELL=3D/bin/sh
    2023-02-07T09:13:15.893395  #
    2023-02-07T09:13:15.994571  / # export SHELL=3D/bin/sh. /lava-3300508/e=
nvironment
    2023-02-07T09:13:15.995252  <3>[   18.149501] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:13:15.995585  =

    2023-02-07T09:13:16.097003  / # . /lava-3300508/environment/lava-330050=
8/bin/lava-test-runner /lava-3300508/1
    2023-02-07T09:13:16.097520  =

    2023-02-07T09:13:16.114535  / # /lava-3300508/bin/lava-test-runner /lav=
a-3300508/1
    2023-02-07T09:13:16.157855  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (16 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21233691b17eb248c8631

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21233691b17eb248c863a
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T08:56:09.490729  / # #
    2023-02-07T08:56:09.592519  export SHELL=3D/bin/sh
    2023-02-07T08:56:09.592917  #
    2023-02-07T08:56:09.694277  / # export SHELL=3D/bin/sh. /lava-3300050/e=
nvironment
    2023-02-07T08:56:09.694831  =

    2023-02-07T08:56:09.695204  / # <3>[   18.219040] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T08:56:09.796653  . /lava-3300050/environment/lava-3300050/bi=
n/lava-test-runner /lava-3300050/1
    2023-02-07T08:56:09.797926  =

    2023-02-07T08:56:09.804347  / # /lava-3300050/bin/lava-test-runner /lav=
a-3300050/1
    2023-02-07T08:56:09.867363  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/63e213a27f5a3511228c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e213a27f5a3511228c864a
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:02:09.061593  / # #
    2023-02-07T09:02:09.165072  export SHELL=3D/bin/sh
    2023-02-07T09:02:09.166332  #
    2023-02-07T09:02:09.268674  / # export SHELL=3D/bin/sh. /lava-3300214/e=
nvironment
    2023-02-07T09:02:09.269781  =

    2023-02-07T09:02:09.270347  / # <3>[   18.073428] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:02:09.372744  . /lava-3300214/environment/lava-3300214/bi=
n/lava-test-runner /lava-3300214/1
    2023-02-07T09:02:09.374338  =

    2023-02-07T09:02:09.386454  / # /lava-3300214/bin/lava-test-runner /lav=
a-3300214/1
    2023-02-07T09:02:09.444274  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e213eda1751742208c8647

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e213eda1751742208c8650
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:03:21.518928  / # #
    2023-02-07T09:03:21.620665  export SHELL=3D/bin/sh
    2023-02-07T09:03:21.621054  #
    2023-02-07T09:03:21.722431  / # export SHELL=3D/bin/sh. /lava-3300313/e=
nvironment
    2023-02-07T09:03:21.722872  =

    2023-02-07T09:03:21.723156  / # <3>[   18.084758] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:03:21.824481  . /lava-3300313/environment/lava-3300313/bi=
n/lava-test-runner /lava-3300313/1
    2023-02-07T09:03:21.825176  =

    2023-02-07T09:03:21.842781  / # /lava-3300313/bin/lava-test-runner /lav=
a-3300313/1
    2023-02-07T09:03:21.890709  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON..._16K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21463c9ab9cb6538c863b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_16K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+CONFIG_ARM64_16K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21463c9ab9cb6538c8644
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:05:24.850097  / # #
    2023-02-07T09:05:24.952471  export SHELL=3D/bin/sh
    2023-02-07T09:05:24.953292  #
    2023-02-07T09:05:25.054690  / # export SHELL=3D/bin/sh. /lava-3300405/e=
nvironment
    2023-02-07T09:05:25.055463  =

    2023-02-07T09:05:25.056005  / # . /lava-3300405/environment<3>[   18.19=
2570] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:05:25.157842  /lava-3300405/bin/lava-test-runner /lava-33=
00405/1
    2023-02-07T09:05:25.158755  =

    2023-02-07T09:05:25.164442  / # /lava-3300405/bin/lava-test-runner /lav=
a-3300405/1
    2023-02-07T09:05:25.222262  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214995d9e6ce6608c8645

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e214995d9e6ce6608c864e
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:05:51.227265  / # #
    2023-02-07T09:05:51.330292  export SHELL=3D/bin/sh
    2023-02-07T09:05:51.331777  #
    2023-02-07T09:05:51.434266  / # export SHELL=3D/bin/sh. /lava-3300352/e=
nvironment
    2023-02-07T09:05:51.435121  <3>[  102.004830] brcmfmac: brcmf_sdio_htcl=
k: HT Avail timeout (1000000): clkctl 0x50
    2023-02-07T09:05:51.435576  =

    2023-02-07T09:05:51.537438  / # . /lava-3300352/environment/lava-330035=
2/bin/lava-test-runner /lava-3300352/1
    2023-02-07T09:05:51.539245  =

    2023-02-07T09:05:51.546902  / # /lava-3300352/bin/lava-test-runner /lav=
a-3300352/1
    2023-02-07T09:05:51.607813  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (17 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/63e216f6313abb2b458c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e216f6313abb2b458c8638
        failing since 20 days (last pass: next-20230109, first fail: next-2=
0230118)

    2023-02-07T09:15:51.623465  <8>[   17.738971] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3300597_1.5.2.4.1>
    2023-02-07T09:15:51.732168  / # #
    2023-02-07T09:15:51.835245  export SHELL=3D/bin/sh
    2023-02-07T09:15:51.836042  #
    2023-02-07T09:15:51.938221  / # export SHELL=3D/bin/sh<3>[   17.972658]=
 brcmf. /lava-3300597/environment
    2023-02-07T09:15:51.938705  mac: brcmf_sdio_htclk: HT Avail timeout (10=
00000): clkctl 0x50
    2023-02-07T09:15:51.938937  =

    2023-02-07T09:15:52.040059  / # . /lava-3300597/environment/lava-330059=
7/bin/lava-test-runner /lava-3300597/1
    2023-02-07T09:15:52.040614  =

    2023-02-07T09:15:52.060005  / # /lava-3300597/bin/lava-test-runner /lav=
a-3300597/1 =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21d69ffd4d1ca0f8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21d69ffd4d1ca0f8c8=
632
        failing since 11 days (last pass: next-20230120, first fail: next-2=
0230127) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2178c66d7df92ae8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.confi=
g+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-mediatek.flavour.config+arm64-chrom=
ebook/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2178c66d7df92ae8c8=
630
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | clang-13 | defcon=
fig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63e219e4cf9ad75a388c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8192-asurada=
-spherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e219e4cf9ad75a388c8=
632
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
mt8192-asurada-spherion-r0   | arm64  | lab-collabora   | gcc-10   | defcon=
fig+arm64-chromebook   | 3          =


  Details:     https://kernelci.org/test/plan/id/63e2182e99c19fa7388c869a

  Results:     177 PASS, 9 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8192-asurada-s=
pherion-r0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8192-pericfg-probed: https://kernelci.org/test/ca=
se/id/63e2182f99c19fa7388c8750
        failing since 5 days (last pass: next-20230130, first fail: next-20=
230202)

    2023-02-07T09:21:13.618277  /lava-9047508/1/../bin/lava-test-case

    2023-02-07T09:21:13.625439  <8>[   22.535986] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-pericfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-infracfg-probed: https://kernelci.org/test/c=
ase/id/63e2182f99c19fa7388c8751
        failing since 5 days (last pass: next-20230130, first fail: next-20=
230202)

    2023-02-07T09:21:12.598990  /lava-9047508/1/../bin/lava-test-case

    2023-02-07T09:21:12.605161  <8>[   21.516423] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dclk-mt8192-infracfg-probed RESULT=3Dfail>
   =


  * baseline.bootrr.clk-mt8192-topckgen-probed: https://kernelci.org/test/c=
ase/id/63e2182f99c19fa7388c8752
        failing since 5 days (last pass: next-20230130, first fail: next-20=
230202)

    2023-02-07T09:21:10.571187  TPM2_CC_TestParms:

    2023-02-07T09:21:10.571644    value: 0x18A

    2023-02-07T09:21:10.574960    commandIndex: 0x18a

    2023-02-07T09:21:10.575417    reserved1:    0x0

    2023-02-07T09:21:10.578020    nv:           0

    2023-02-07T09:21:10.578511    extensive:    0

    2023-02-07T09:21:10.581287    flushed:      0

    2023-02-07T09:21:10.581832    cHandles:     0x0

    2023-02-07T09:21:10.584618    rHandle:      0

    2023-02-07T09:21:10.585077    V:            0
 =

    ... (49 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
ox820-clouden...lug-series-3 | arm    | lab-baylibre    | gcc-10   | oxnas_=
v6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e20fdb6548c05ad68c866a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e20fdb6548c05ad68c8=
66b
        failing since 168 days (last pass: next-20220822, first fail: next-=
20220823) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qcom-qdf2400                 | arm64  | lab-linaro-lkft | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e22308f61b9240968c8636

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e22308f61b9240968c8=
637
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21781efb432bef78c863d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21781efb432bef78c8=
63e
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e213a37f5a3511228c8657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e213a37f5a3511228c8=
658
        failing since 76 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2159f17d31794308c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-rock=
2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2159f17d31794308c8=
65c
        failing since 18 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-16 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2158a3a72dddf128c8687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0 (++20230205083021+66c1=
717f496d-1~exp1~20230205203128.15))
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/clang-16/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2158a3a72dddf128c8=
688
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2132de0943821db8c8630

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2132de0943821db8c8=
631
        failing since 76 days (last pass: next-20221121, first fail: next-2=
0221122) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63e214f9ffbfcc96c78c8669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-rk3288-veyr=
on-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e214f9ffbfcc96c78c8=
66a
        failing since 18 days (last pass: next-20230109, first fail: next-2=
0230118) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora   | clang-13 | cros:/=
/chrome...4-chromebook | 2          =


  Details:     https://kernelci.org/test/plan/id/63e21694652b87e49f8c863e

  Results:     75 PASS, 13 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.con=
fig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-rockchip64.flavour.config+arm64-chr=
omebook/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-driver-present: https://kernelci.org/te=
st/case/id/63e21694652b87e49f8c8686
        failing since 10 days (last pass: next-20230120, first fail: next-2=
0230127)

    2023-02-07T09:14:30.737011  /lava-9047273/1/../bin/lava-test-case

    2023-02-07T09:14:30.747101  <8>[   66.892294] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dfail>
   =


  * baseline.bootrr.cros-ec-rtc-probed: https://kernelci.org/test/case/id/6=
3e21694652b87e49f8c8687
        failing since 10 days (last pass: next-20230120, first fail: next-2=
0230127)

    2023-02-07T09:14:29.707028  /lava-9047273/1/../bin/lava-test-case

    2023-02-07T09:14:29.720295  <8>[   65.865669] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-rtc-probed RESULT=3Dfail>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e213ac576120b4eb8c8637

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e213ac576120b4eb8c8640
        failing since 33 days (last pass: next-20221130, first fail: next-2=
0230105)

    2023-02-07T09:02:08.824658  + set +x
    2023-02-07T09:02:08.826056  <8>[   68.311276][  T197] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 392811_1.5.2.4.1>
    2023-02-07T09:02:08.959535  #
    2023-02-07T09:02:09.062120  / # #export SHELL=3D/bin/sh
    2023-02-07T09:02:09.062948  =

    2023-02-07T09:02:09.164747  / # export SHELL=3D/bin/sh. /lava-392811/en=
vironment
    2023-02-07T09:02:09.165343  =

    2023-02-07T09:02:09.266929  / # . /lava-392811/environment/lava-392811/=
bin/lava-test-runner /lava-392811/1
    2023-02-07T09:02:09.267846  =

    2023-02-07T09:02:09.274575  / # /lava-392811/bin/lava-test-runner /lava=
-392811/1 =

    ... (42 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-roc-pc                | arm64  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e218711c337f25678c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e218711c337f25678c8=
652
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3399-rock-pi-4b            | arm64  | lab-collabora   | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2175deaa3a3aadd8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2175deaa3a3aadd8c8=
647
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-a64-pine64-plus       | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2192f285f7b420d8c867e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-a64-pine64-plus.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2192f285f7b420d8c8=
67f
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21382df5c82e5fe8c8651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-c=
c.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e21382df5c82e5fe8c8=
652
        failing since 110 days (last pass: next-20221011, first fail: next-=
20221019) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2179ffe67fc30a78c863a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-sun50i-h5-libretech-all-=
h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2179ffe67fc30a78c8=
63b
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-broonie     | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2179f0da509bd2c8c8631

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+kselftest/gcc-10/lab-broonie/baseline-sun50i-h5-libretech-all-h=
3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2179f0da509bd2c8c8=
632
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun5i-a13-olinuxino-micro    | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63e218b529ece70f828c86c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-sun5i-a13-olinuxino-micro.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e218b529ece70f828c8=
6c9
        new failure (last pass: next-20230206) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun8i-h3-libretech-all-h3-cc | arm    | lab-baylibre    | gcc-10   | sunxi_=
defconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2118e46f66c65b78c862f

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e2118e46f66c65b78c8638
        failing since 14 days (last pass: next-20230123, first fail: next-2=
0230124)

    2023-02-07T08:53:09.772735  / # #
    2023-02-07T08:53:09.874429  export SHELL=3D/bin/sh
    2023-02-07T08:53:09.874787  #
    2023-02-07T08:53:09.976087  / # export SHELL=3D/bin/sh. /lava-3299970/e=
nvironment
    2023-02-07T08:53:09.976447  =

    2023-02-07T08:53:10.077792  / # . /lava-3299970/environment/lava-329997=
0/bin/lava-test-runner /lava-3299970/1
    2023-02-07T08:53:10.078420  =

    2023-02-07T08:53:10.083959  / # /lava-3299970/bin/lava-test-runner /lav=
a-3299970/1
    2023-02-07T08:53:10.196851  + export 'TESTRUN_ID=3D1_bootrr'
    2023-02-07T08:53:10.197351  + cd /lava-3299970/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63e2128d4dde5ed9398c864a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63e2128d4dde5ed9398c8=
64b
        failing since 75 days (last pass: next-20221121, first fail: next-2=
0221123) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
zynqmp-zcu102                | arm64  | lab-cip         | gcc-10   | defcon=
fig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63e21330829cc86ed28c8632

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20230207/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230203.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63e21330829cc86ed28c8639
        failing since 33 days (last pass: next-20221207, first fail: next-2=
0230105)

    2023-02-07T09:00:13.897688  + set +x
    2023-02-07T09:00:13.906857  <8>[   43.440072][  T170] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 843169_1.5.2.4.1>
    2023-02-07T09:00:14.039253  #
    2023-02-07T09:00:14.141364  / # #export SHELL=3D/bin/sh
    2023-02-07T09:00:14.142054  =

    2023-02-07T09:00:14.243596  / # export SHELL=3D/bin/sh. /lava-843169/en=
vironment
    2023-02-07T09:00:14.243928  =

    2023-02-07T09:00:14.345137  / # . /lava-843169/environment/lava-843169/=
bin/lava-test-runner /lava-843169/1
    2023-02-07T09:00:14.346198  =

    2023-02-07T09:00:14.349593  / # /lava-843169/bin/lava-test-runner /lava=
-843169/1 =

    ... (18 line(s) more)  =

 =20
