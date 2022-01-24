Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1EC4978E3
	for <lists+linux-next@lfdr.de>; Mon, 24 Jan 2022 07:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241602AbiAXGYX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Jan 2022 01:24:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241551AbiAXGYW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jan 2022 01:24:22 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AB6C06173B
        for <linux-next@vger.kernel.org>; Sun, 23 Jan 2022 22:24:21 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so10697629pjb.1
        for <linux-next@vger.kernel.org>; Sun, 23 Jan 2022 22:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MraPC783etWtGsy8rH4qfCe3uY7FROjoa54dTbrU/cQ=;
        b=pwIX1HY1jYWbGuq4Qtpg7YgCCLNTE1iBC//Ms2F8yQ3OOMFFwzKfx8GAsYOMYD6czp
         eIJAf3s9uceygw5jRPQj+OGZCl8kaSdDQl6pNlR6HDdzAuKmYpEi5Qti0DoE6hBdGlOs
         D5SwCCipWxDxTWAUKMjVi+3H8pRO7KZf1uP2OlohA9YUCc9IMmc07qhVbiQr2ImA7g0I
         oOmWOpjmIflchxoUIXzlG6pSxVPy7iOIUbP5IzLtpYSrVP9aPB4WcskoxX0Pgi2V3vJ4
         7VQe9lpLd1h849fs4MDX9pIaz2gRQ4NBH9L/M8y0ZK5qjG3AewI1PbMoVu2g/rXU8iDF
         OqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MraPC783etWtGsy8rH4qfCe3uY7FROjoa54dTbrU/cQ=;
        b=ncDpVA5I6J7jwmeaV0kR4ImR+03zLKZiNkRJ5Xoinuab3Kw2y/0GjvLZAcPJ/V3HUB
         nIEmxNXPjz8iaV9bK0aiQQ/6FiEfaW3dRbTbqRGJBtHaRfsvJarJbqBr825E1ehjxERA
         naEZqIgMlMvapUt15a6DgdxM5zbjJPlSlygsjyhVQwokmouopRpWtRLGcyWiH/3ZaUvv
         +VC4G829QrzNBitDqAE0xbczofTy8B4llJ+Cgx3JcE3LPxlIXY/o+mwDIfc1ZWzI++VP
         2mEA2d5BPygzlz+LlPn39ezl3+i28gcD8Pq9un+uJ0taCGnFidnLLyXkMvm3dUdeG6su
         rjRg==
X-Gm-Message-State: AOAM533Y7ljxC3v3vNZwtEqebqJfvtPCvfn8I9PVqdI9NDLYohQoJfZg
        jGViBJHx5dMDdviLHLpkqC/donNuMrODt618
X-Google-Smtp-Source: ABdhPJx8IKgRm4oSrzXdlztQXs2tkhBYTyY+sNaHXIDJOEajJavvEZtJGsSLLXOscDg0saQd05tHeA==
X-Received: by 2002:a17:902:a70b:b0:14a:f815:a00a with SMTP id w11-20020a170902a70b00b0014af815a00amr13206489plq.168.1643005459708;
        Sun, 23 Jan 2022 22:24:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s13sm14457218pfu.0.2022.01.23.22.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 22:24:19 -0800 (PST)
Message-ID: <61ee4613.1c69fb81.26498.8277@mx.google.com>
Date:   Sun, 23 Jan 2022 22:24:19 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220124
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 911 runs, 69 regressions (next-20220124)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 911 runs, 69 regressions (next-20220124)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-linaro-lkft | clang-14 | defconf=
ig                    | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220124/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220124
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      74e5dee6a5b9683e4e78aad784c6c807833cb89b =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2711-rpi-4-b              | arm64 | lab-linaro-lkft | clang-14 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee1854918d12ffd8abbd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220117071848+9c429=
2a59da2-1~exp1~20220117071948.123)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/clang-14/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/clang-14/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee1854918d12ffd8abb=
d13
        new failure (last pass: next-20220121) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0af51f9bb2f2bbabbd29

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0af51f9bb2f2bbabb=
d2a
        new failure (last pass: next-20220121) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee19d6b812f7d2f9abbd13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee19d6b812f7d2f9abb=
d14
        failing since 11 days (last pass: next-20211224, first fail: next-2=
0220112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0cca5fdf26f3afabbd26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0cca5fdf26f3afabb=
d27
        failing since 31 days (last pass: next-20211221, first fail: next-2=
0211223) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0fc263a6e5a7ffabbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0fc263a6e5a7ffabb=
d12
        failing since 32 days (last pass: next-20211221, first fail: next-2=
0211222) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee11799fba851a55abbe11

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee11799fba851a55abbe52
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T02:39:29.251257  <8>[   17.264899] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-01-24T02:39:30.272518  /lava-82819/1/../bin/lava-test-case
    2022-01-24T02:39:30.272833  <8>[   18.281416] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e11799fba851a55abbe53
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T02:39:31.315998  /lava-82819/1/../bin/lava-test-case
    2022-01-24T02:39:31.316293  <8>[   19.300577] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T02:39:31.316445  /lava-82819/1/../bin/lava-test-case
    2022-01-24T02:39:31.316587  <8>[   19.316286] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-24T02:39:31.316728  /lava-82819/1/../bin/lava-test-case
    2022-01-24T02:39:31.316864  <8>[   19.332203] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-24T02:39:31.316999  /lava-82819/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee13096a629c7ff6abbd35

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee13096a629c7ff6abbd76
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:46:20.371659  /lava-82827/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e13096a629c7ff6abbd77
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:46:20.374811  <8>[   13.794442] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:46:21.422194  /lava-82827/1/../bin/lava-test-case
    2022-01-24T02:46:21.422599  <8>[   14.813770] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee136f8fb66657d4abbd1e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee13708fb66657d4abbd5f
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:48:00.916812  /lava-82831/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e13708fb66657d4abbd60
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:48:00.920892  <8>[   16.531305] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:48:01.966586  /lava-82831/1/../bin/lava-test-case
    2022-01-24T02:48:01.970305  <8>[   17.550502] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T02:48:01.970660  /lava-82831/1/../bin/lava-test-case
    2022-01-24T02:48:01.970899  <8>[   17.566307] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-24T02:48:01.971158  /lava-82831/1/../bin/lava-test-case
    2022-01-24T02:48:01.971386  <8>[   17.582323] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-24T02:48:01.971612  /lava-82831/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee1576dc0477cab5abbd5b

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee1576dc0477cab5abbd9c
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-24T02:56:30.011779  /lava-82842/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e1576dc0477cab5abbd9d
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-24T02:56:30.014913  <8>[   17.015725] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:56:31.064680  /lava-82842/1/../bin/lava-test-case
    2022-01-24T02:56:31.065028  <8>[   18.035041] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T02:56:31.065237  /lava-82842/1/../bin/lava-test-case
    2022-01-24T02:56:31.065434  <8>[   18.052609] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-24T02:56:31.065630  /lava-82842/1/../bin/lava-test-case
    2022-01-24T02:56:31.065818  <8>[   18.068877] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-24T02:56:31.066008  /lava-82842/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee16b6ba21a86edcabbd24

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee16b6ba21a86edcabbd65
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T03:01:56.846749  /lava-82848/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e16b6ba21a86edcabbd66
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T03:01:56.849903  <8>[   17.840674] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T03:01:57.897530  /lava-82848/1/../bin/lava-test-case
    2022-01-24T03:01:57.897920  <8>[   18.859475] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T03:01:57.898166  /lava-82848/1/../bin/lava-test-case
    2022-01-24T03:01:57.898396  <8>[   18.875976] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-24T03:01:57.898621  /lava-82848/1/../bin/lava-test-case
    2022-01-24T03:01:57.898839  <8>[   18.891968] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-24T03:01:57.899206  /lava-82848/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee0f98bf2780ac5fabbd27

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee0f98bf2780ac5fabbd6f
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T02:31:47.167106  /lava-82822/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e0f98bf2780ac5fabbd70
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T02:31:47.170411  <8>[   13.559182] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:31:48.217046  /lava-82822/1/../bin/lava-test-case
    2022-01-24T02:31:48.217448  <8>[   14.578442] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T02:31:48.217696  /lava-82822/1/../bin/lava-test-case
    2022-01-24T02:31:48.217927  <8>[   14.594406] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee0ffcdbf86886e1abbd1d

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee0ffddbf86886e1abbd65
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:33:09.668986  /lava-82823/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e0ffddbf86886e1abbd66
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:33:09.676304  <8>[   13.461391] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:33:10.719137  /lava-82823/1/../bin/lava-test-case
    2022-01-24T02:33:10.719505  <8>[   14.480468] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee1151b1d13677c2abbd30

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee1151b1d13677c2abbd78
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:38:52.054934  /lava-82830/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e1151b1d13677c2abbd79
        failing since 33 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-24T02:38:52.068492  <8>[   13.494705] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:38:53.105937  /lava-82830/1/../bin/lava-test-case
    2022-01-24T02:38:53.106229  <8>[   14.514255] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T02:38:53.106378  /lava-82830/1/../bin/lava-test-case
    2022-01-24T02:38:53.106515  <8>[   14.530144] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-24T02:38:53.106653  /lava-82830/1/../bin/lava-test-case
    2022-01-24T02:38:53.106786  <8>[   14.546010] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-24T02:38:53.106919  /lava-82830/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee11b82a4d5bb87aabbd30

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee11b82a4d5bb87aabbd78
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-24T02:40:39.619271  /lava-82839/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e11b82a4d5bb87aabbd79
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-24T02:40:39.622766  <8>[   14.030803] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:40:40.673048  /lava-82839/1/../bin/lava-test-case
    2022-01-24T02:40:40.673471  <8>[   15.050342] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-24T02:40:40.673715  /lava-82839/1/../bin/lava-test-case
    2022-01-24T02:40:40.673940  <8>[   15.067349] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee13205199e31ea4abbd17

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ee13205199e31ea4abbd5f
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T02:46:46.316015  /lava-82849/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
e13205199e31ea4abbd60
        failing since 37 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-24T02:46:46.319254  <8>[   13.443018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-24T02:46:47.367684  /lava-82849/1/../bin/lava-test-case
    2022-01-24T02:46:47.368087  <8>[   14.461650] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0e1485a1fd1710abbddd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0e1485a1fd1710abb=
dde
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0e5f2f34cd3c13abbd13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0e5f2f34cd3c13abb=
d14
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0d4b55c2801c82abbd3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0d4b55c2801c82abb=
d3c
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee125c24bfe3b4b4abbd2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee125c24bfe3b4b4abb=
d2e
        failing since 18 days (last pass: next-20211224, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0d5f396a1e0f25abbd48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0d5f396a1e0f25abb=
d49
        failing since 18 days (last pass: next-20211224, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0d70b6cb6d844dabbd1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0d70b6cb6d844dabb=
d1c
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0d8283d5fbe86cabbe02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0d8283d5fbe86cabb=
e03
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0ec45e32a02a8aabbd32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0ec45e32a02a8aabb=
d33
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0d53daa0bcc887abbd98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0d53daa0bcc887abb=
d99
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0e2347430d67c3abbd24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0e2347430d67c3abb=
d25
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0c6324246a5580abbd24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0c6324246a5580abb=
d25
        failing since 40 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0ec22e68652c93abbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0ec22e68652c93abb=
d17
        failing since 40 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0cecfddaed0ef1abbd33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0cecfddaed0ef1abb=
d34
        failing since 40 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0f4c2d9ab67129abbd2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0f4c2d9ab67129abb=
d2b
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee1e64f2bff26dfcabbd18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee1e64f2bff26dfcabb=
d19
        failing since 40 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee1f3fc15a3e3246abbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee1f3fc15a3e3246abb=
d12
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0c25bc9dd004b1abbd46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0c25bc9dd004b1abb=
d47
        failing since 39 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0cf0beb043bb11abbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0cf0beb043bb11abb=
d12
        failing since 39 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0f8cfb6af2303dabbd1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0f8cfb6af2303dabb=
d1b
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee1e62b2a55d180cabbd21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uef=
i.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee1e62b2a55d180cabb=
d22
        failing since 39 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee1f55c15a3e3246abbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee1f55c15a3e3246abb=
d17
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee14efdc0477cab5abbd13

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ee14efdc0477c=
ab5abbd19
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-24T02:54:20.098535  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-24T02:54:20.098652  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-24T02:54:20.098741  kern  :alert : user pgtable: 4k pages<8>[  =
 15.822531] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-24T02:54:20.098827  , 48-bit VAs, pgdp=3D000000007fa19000
    2022-01-24T02:54:20.098961  ker<8>[   15.834699] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 609995_1.5.2.4.1>
    2022-01-24T02:54:20.099042  n  :alert : [0000000000000000] pgd=3D080000=
007fa1a003, p4d=3D080000007fa1a003, pud=3D080000007fa1b003, pmd=3D000000000=
0000000
    2022-01-24T02:54:20.099122  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ee14efdc0477c=
ab5abbd1a
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-24T02:54:20.055265  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-24T02:54:20.055389  kern  :alert : Mem abort info:
    2022-01-24T02:54:20.055479  ker<8>[   15.782101] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-24T02:54:20.055564  n  :alert :   ESR =3D 0x96000006
    2022-01-24T02:54:20.055646  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-24T02:54:20.055726  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-24T02:54:20.055804  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-24T02:54:20.055880  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-24T02:54:20.055956  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee15a10e25be2fb9abbd15

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ee15a10e25be2=
fb9abbd1b
        failing since 19 days (last pass: next-20211223, first fail: next-2=
0220104)
        2 lines

    2022-01-24T02:57:24.995942  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-24T02:57:24.996155  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-24T02:57:24.996250  kern  :alert : user pgtable: 4k pages<8>[  =
 16.714872] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-24T02:57:24.996340  , 48-bit VAs, pgdp=3D000000007f9e8000
    2022-01-24T02:57:24.996424  ker<8>[   16.726752] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 610001_1.5.2.4.1>
    2022-01-24T02:57:24.996507  n  :alert : [0000000000000000] pgd=3D080000=
007f9e4003, p4d=3D080000007f9e4003, pud=3D080000007f9e2003, pmd=3D000000000=
0000000
    2022-01-24T02:57:24.996592  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ee15a10e25be2=
fb9abbd1c
        failing since 19 days (last pass: next-20211223, first fail: next-2=
0220104)
        12 lines

    2022-01-24T02:57:24.952766  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-24T02:57:24.952981  kern  :alert : Mem abort info:
    2022-01-24T02:57:24.953076  ker<8>[   16.673991] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-24T02:57:24.953180  n  :alert :   ESR =3D 0x96000006
    2022-01-24T02:57:24.953270  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-24T02:57:24.953380  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-24T02:57:24.953469  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-24T02:57:24.953551  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-24T02:57:24.953630  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee1836505187cc92abbd2f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ee1836505187c=
c92abbd35
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-24T03:08:17.799428  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-24T03:08:17.799553  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-24T03:08:17.799667  kern  :alert : user pgtable: 4k pages<8>[  =
 15.923473] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-24T03:08:17.799775  , 48-bit VAs, pgdp=3D000000007f81e000
    2022-01-24T03:08:17.799880  ker<8>[   15.935572] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 610037_1.5.2.4.1>
    2022-01-24T03:08:17.799964  n  :alert : [0000000000000000] pgd=3D080000=
004fb4a003, p4d=3D080000004fb4a003, pud=3D080000004fb4b003, pmd=3D000000000=
0000000
    2022-01-24T03:08:17.800050  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ee1836505187c=
c92abbd36
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-24T03:08:17.756125  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-24T03:08:17.756238  kern  :alert : Mem abort info:
    2022-01-24T03:08:17.756329  ker<8>[   15.882976] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-24T03:08:17.756415  n  :alert :   ESR =3D 0x96000006
    2022-01-24T03:08:17.756498  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-24T03:08:17.756579  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-24T03:08:17.756658  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-24T03:08:17.756735  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-24T03:08:17.756813  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee18c1ea6c7b95b5abbd24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee18c1ea6c7b95b5abb=
d25
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee1a02a835e1ff25abbd11

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ee1a02a835e1f=
f25abbd17
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-24T03:15:53.580353  kern  :alert : Data abort info:
    2022-01-24T03:15:53.622486  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-24T03:15:53.622633  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-24T03:15:53.622722  kern  :alert : user pgtable: 4k pages<8>[  =
 16.509609] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-24T03:15:53.622807  , 48-bit VAs, pgdp=3D000000004f21f000
    2022-01-24T03:15:53.622887  ker<8>[   16.521978] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 610095_1.5.2.4.1>
    2022-01-24T03:15:53.622965  n  :alert : [0000000000000000] pgd=3D080000=
007f97c003, p4d=3D080000007f97c003, pud=3D080000007f97d003, pmd=3D000000000=
0000000
    2022-01-24T03:15:53.623043  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ee1a02a835e1f=
f25abbd18
        failing since 19 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-24T03:15:53.579148  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-24T03:15:53.579295  kern  :alert : Mem abort info:
    2022-01-24T03:15:53.579385  ker<8>[   16.468887] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-24T03:15:53.579469  n  :alert :   ESR =3D 0x96000006
    2022-01-24T03:15:53.579550  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-24T03:15:53.579629  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-24T03:15:53.579706  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-24T03:15:53.579781  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61ee1d0d48e1bf394eabbd1f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ee1d0d48e1bf3=
94eabbd25
        failing since 19 days (last pass: next-20211223, first fail: next-2=
0220104)
        2 lines

    2022-01-24T03:28:53.475875  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-24T03:28:53.476001  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-24T03:28:53.476098  kern  :alert : user pgtable: 4k pages<8>[  =
 16.426009] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-24T03:28:53.476188  , 48-bit VAs, pgdp=3D000000007f8f3000
    2022-01-24T03:28:53.476273  ker<8>[   16.438211] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 610150_1.5.2.4.1>
    2022-01-24T03:28:53.476355  n  :alert : [0000000000000000] pgd=3D080000=
007f9a2003, p4d=3D080000007f9a2003, pud=3D080000007f94e003, pmd=3D000000000=
0000000
    2022-01-24T03:28:53.476438  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ee1d0d48e1bf3=
94eabbd26
        failing since 19 days (last pass: next-20211223, first fail: next-2=
0220104)
        12 lines

    2022-01-24T03:28:53.432593  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-24T03:28:53.432761  kern  :alert : Mem abort info:
    2022-01-24T03:28:53.432864  ker<8>[   16.385423] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-24T03:28:53.432962  n  :alert :   ESR =3D 0x96000006
    2022-01-24T03:28:53.433047  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-24T03:28:53.433130  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-24T03:28:53.433239  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-24T03:28:53.433326  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-24T03:28:53.433424  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee129a50957bc9edabbd1a

  Results:     88 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/61ee129a50957bc9edabbd3c
        new failure (last pass: next-20220121)

    2022-01-24T02:44:22.938777  <4>[   22.920560] cdn-dp fec00000.dp: Direc=
t firmware load for rockchip/dptx.bin failed with error -2
    2022-01-24T02:44:23.499410  /lava-5503303/1/../bin/lava-test-case
    2022-01-24T02:44:23.509610  <8>[   23.493357] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee13758fb66657d4abbd8a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee13758fb66657d4abb=
d8b
        failing since 18 days (last pass: next-20211223, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee14401c051c3e9aabbd36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_smp=3Dn/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_smp=3Dn/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee14401c051c3e9aabb=
d37
        new failure (last pass: next-20211203) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee15ba6c9b49412cabbd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee15ba6c9b49412cabb=
d16
        failing since 18 days (last pass: next-20211223, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee17723b61580167abbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee17723b61580167abb=
d12
        failing since 18 days (last pass: next-20211222, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee14f1dc0477cab5abbd21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee14f1dc0477cab5abb=
d22
        failing since 18 days (last pass: next-20211223, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0c1db089c3c58cabbd2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0c1db089c3c58cabb=
d2e
        failing since 61 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0d85b6cb6d844dabbdb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0d85b6cb6d844dabb=
dba
        failing since 61 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0e61ac80a9a916abbd86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0e61ac80a9a916abb=
d87
        failing since 61 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0eed5ada893526abbd36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0eed5ada893526abb=
d37
        failing since 61 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee0ff21ea90057c4abbdac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee0ff21ea90057c4abb=
dad
        failing since 61 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61ee1056d472ecc59aabbd42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220124/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ee1056d472ecc59aabb=
d43
        failing since 61 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
