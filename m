Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2204648D5A6
	for <lists+linux-next@lfdr.de>; Thu, 13 Jan 2022 11:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbiAMKYi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Jan 2022 05:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiAMKYg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Jan 2022 05:24:36 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497AAC06173F
        for <linux-next@vger.kernel.org>; Thu, 13 Jan 2022 02:24:36 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id e19so8937082plc.10
        for <linux-next@vger.kernel.org>; Thu, 13 Jan 2022 02:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gjDPsoaF+/AnsHbbOezrCFBGlxkhixZNorMGinQDCds=;
        b=C0jErwgQEyNcwDMNrM4qMT7uRQMaU4URSfeIWEfefC+a/Lsw7Txur0ktzzj+jlgO51
         PV0DwNm4nYApX9rI8YJ4sP+LL25ssAU4N1LpdUtFdBb6/wfQoeAaFdPvGC9/xXwkfqZ/
         DoVbNKlAaTDG1+ekozB1yPigFafbiQorV2DEsf/G7IurfyECzf9eDYunvYgFulone2NR
         Svh5K7zoKtyKcor45xaMOR5pemfp0aX9RbmPDz1EyvyQkOhiZBXArOqAKmy0HUgs7+Qs
         TUB9J3yVyc/+485/Zs6sk6Wz/jkXwNxTMmqBzDrPoGxnmicNlzs6PwrvIMNXzsxnF8kf
         d9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gjDPsoaF+/AnsHbbOezrCFBGlxkhixZNorMGinQDCds=;
        b=UrtehdLo8H2DOEtFwYDIQCu/bG+XuPydQswPvqjgFG5Gj4aux/OgtkYWI2xLZd8EJc
         298ohOZlFlDH7GSCuhR0QkrrNJ4A9Kd/OAr3fMFU7sewXobHi+6SRVJqjG41vG/3TSmS
         80a1uUaLd2Kz/rl3W/8Iqdg9kCzxmxzhfcSvF56Hu8gwvpP5SzWRs/lt4aIt5IVoccsL
         tzbMJDyxbd/WSn7iPQ4h9r5Kx0mlmCXnQHVq45W4cYAlhupE+ThknU7e6XkMYdR2CrJn
         cB09AFQqFDsjaT/BLrGZwwxBKNaBsoPWJF0b/bjmfOF4WxEfOExW6xjpBQBLHLlC20wz
         s62A==
X-Gm-Message-State: AOAM5310D+GT9UC5tb5h32MOjOv7TqAxUq6R29wCobMTQg7/fZMwhowC
        fZhM1+t4nqz0JYp9TSAGQ4tdCltMq2ihAoUDllM=
X-Google-Smtp-Source: ABdhPJzkZUzt3cQsWC7iHBfw8cZhW1J50ELZffVA0GzI3ZB8Nfjuqz6OmSnhKI+diOjIIHOzgiGvzA==
X-Received: by 2002:a17:90a:8808:: with SMTP id s8mr13716605pjn.9.1642069474928;
        Thu, 13 Jan 2022 02:24:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m6sm2405963pfh.204.2022.01.13.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 02:24:34 -0800 (PST)
Message-ID: <61dffde2.1c69fb81.79cf7.6bba@mx.google.com>
Date:   Thu, 13 Jan 2022 02:24:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20220113
X-Kernelci-Branch: master
Subject: next/master baseline: 747 runs, 55 regressions (next-20220113)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 747 runs, 55 regressions (next-20220113)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =

fsl-ls1043a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+ima                | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+ima                | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 2          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+ima                | 2          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig           | 1          =

tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | tegra_de=
fconfig              | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+ima                | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220113/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220113
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      27c9d5b3c24af29de643533984f1ba3e650c7c78 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc8f12f1f53bdc2ef6753

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc8f12f1f53bdc2ef6=
754
        failing since 19 days (last pass: next-20211223, first fail: next-2=
0211224) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfbc6e01669fa530ef674e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfbc6e01669fa530ef6=
74f
        failing since 0 day (last pass: next-20220106, first fail: next-202=
20112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
fsl-ls1043a-rdb              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfcc75e026b1f945ef6764

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfcc75e026b1f945ef6=
765
        failing since 0 day (last pass: next-20211224, first fail: next-202=
20112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp       | gcc-10   | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc0fa875c0a76faef6752

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc0fa875c0a76faef6=
753
        failing since 20 days (last pass: next-20211221, first fail: next-2=
0211223) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk              | arm64  | lab-nxp       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc96bab96009a5bef674f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc96bab96009a5bef6=
750
        failing since 21 days (last pass: next-20211221, first fail: next-2=
0211222) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc05b01a03b3f6cef6769

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfc05c01a03b3f6cef67ae
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:01:41.383135  /lava-77633/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fc05c01a03b3f6cef67af
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:01:41.387126  <8>[   16.750759] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T06:01:42.431517  /lava-77633/1/../bin/lava-test-case
    2022-01-13T06:01:42.431904  <8>[   17.769958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T06:01:42.432145  /lava-77633/1/../bin/lava-test-case
    2022-01-13T06:01:42.432369  <8>[   17.785915] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc82bdce989a3adef674d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfc82bdce989a3adef6792
        failing since 22 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-13T06:35:05.288666  /lava-77652/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fc82bdce989a3adef6793
        failing since 22 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-13T06:35:05.291814  <8>[   16.297489] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T06:35:06.343368  /lava-77652/1/../bin/lava-test-case
    2022-01-13T06:35:06.343713  <8>[   17.317262] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T06:35:06.343917  /lava-77652/1/../bin/lava-test-case
    2022-01-13T06:35:06.344108  <8>[   17.332569] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-13T06:35:06.344298  /lava-77652/1/../bin/lava-test-case
    2022-01-13T06:35:06.344482  <8>[   17.350177] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-13T06:35:06.344669  /lava-77652/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfcbc7f274defdfaef673d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfcbc7f274defdfaef6782
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:50:10.216074  /lava-77661/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fcbc7f274defdfaef6783
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:50:10.219263  <8>[   19.753881] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T06:50:11.266105  /lava-77661/1/../bin/lava-test-case
    2022-01-13T06:50:11.266749  <8>[   20.772679] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T06:50:11.266997  /lava-77661/1/../bin/lava-test-case
    2022-01-13T06:50:11.267248  <8>[   20.788777] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-13T06:50:11.267471  /lava-77661/1/../bin/lava-test-case
    2022-01-13T06:50:11.267684  <8>[   20.804781] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-13T06:50:11.267898  /lava-77661/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfcd14e4bf90e585ef673d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfcd14e4bf90e585ef6782
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-13T06:55:53.173882  /lava-77671/1/../bin/lava-test-case
    2022-01-13T06:55:53.194723  <8>[   14.234150] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fcd14e4bf90e585ef6783
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-13T06:55:54.243217  /lava-77671/1/../bin/lava-test-case
    2022-01-13T06:55:54.243861  <8>[   15.252748] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T06:55:54.244106  /lava-77671/1/../bin/lava-test-case
    2022-01-13T06:55:54.244327  <8>[   15.268426] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-13T06:55:54.244547  /lava-77671/1/../bin/lava-test-case
    2022-01-13T06:55:54.244759  <8>[   15.284650] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-13T06:55:54.244972  /lava-77671/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc059720b7e8313ef6762

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfc059720b7e8313ef67ae
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:01:36.978183  /lava-77631/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fc059720b7e8313ef67af
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:01:36.991294  <8>[   13.471365] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T06:01:38.031159  /lava-77631/1/../bin/lava-test-case
    2022-01-13T06:01:38.031476  <8>[   14.489971] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T06:01:38.031629  /lava-77631/1/../bin/lava-test-case
    2022-01-13T06:01:38.031773  <8>[   14.507051] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-13T06:01:38.031917  /lava-77631/1/../bin/lava-test-case
    2022-01-13T06:01:38.032055  <8>[   14.524157] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-13T06:01:38.032192  /lava-77631/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc765979271ae2fef6758

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfc765979271ae2fef67a4
        failing since 22 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-13T06:30:57.915362  /lava-77651/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fc765979271ae2fef67a5
        failing since 22 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-13T06:30:57.918523  <8>[   13.526726] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T06:30:58.966086  /lava-77651/1/../bin/lava-test-case
    2022-01-13T06:30:58.966494  <8>[   14.546077] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfcc9b0f7b99130eef67a0

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfcc9c0f7b99130eef67ec
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:54:14.016125  /lava-77665/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fcc9c0f7b99130eef67ed
        failing since 26 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-13T06:54:14.019302  <8>[   13.575156] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T06:54:15.066555  /lava-77665/1/../bin/lava-test-case
    2022-01-13T06:54:15.066956  <8>[   14.594409] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T06:54:15.067275  /lava-77665/1/../bin/lava-test-case
    2022-01-13T06:54:15.067507  <8>[   14.610347] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfce171b0ffac916ef6740

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61dfce181b0ffac916ef678c
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-13T07:00:32.485372  <8>[   12.982065] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drcpm-probed RESULT=3Dpass>
    2022-01-13T07:00:33.501667  /lava-77672/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61d=
fce181b0ffac916ef678d
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-13T07:00:33.504833  <8>[   13.999788] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-13T07:00:34.553977  /lava-77672/1/../bin/lava-test-case
    2022-01-13T07:00:34.554381  <8>[   15.019267] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-13T07:00:34.554620  /lava-77672/1/../bin/lava-test-case
    2022-01-13T07:00:34.554840  <8>[   15.035917] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-sei510            | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc94c090155fe87ef6762

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc94c090155fe87ef6=
763
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-u200              | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc9a551727581deef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc9a551727581deef6=
73e
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfca489380d3244eef674d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfca489380d3244eef6=
74e
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfcb382b23e6cb11ef675d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfcb382b23e6cb11ef6=
75e
        failing since 7 days (last pass: next-20211224, first fail: next-20=
220105) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc96202220becbeef6757

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc96202220becbeef6=
758
        failing since 7 days (last pass: next-20211224, first fail: next-20=
220105) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc93ac88e282ca8ef676a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc93ac88e282ca8ef6=
76b
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc63ea01904df8fef6773

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
l-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/61dfc63ea01904df=
8fef6776
        new failure (last pass: next-20220112)
        1 lines

    2022-01-13T06:26:29.438086  / # #
    2022-01-13T06:26:29.562197  #
    2022-01-13T06:26:29.565804  =

    2022-01-13T06:26:29.567180  / # =

    2022-01-13T06:26:29.672943  / # #export SHELL=3D/bin/sh
    2022-01-13T06:26:29.777071  . /lava-1393251/environment
    2022-01-13T06:26:29.779403  =

    2022-01-13T06:26:29.780702  / # export SHELL=3D/bin/sh
    2022-01-13T06:26:29.884975  / # . /lava-1393251/environment/lava-139325=
1/bin/lava-test-runner /lava-1393251/0
    2022-01-13T06:26:29.891864   =

    ... (10 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61dfc63ea01904d=
f8fef6778
        new failure (last pass: next-20220112)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfceafbc985aa8b2ef6746

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfceafbc985aa8b2ef6=
747
        failing since 8 days (last pass: next-20211118, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc950090155fe87ef6765

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc950090155fe87ef6=
766
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-clabbe    | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc9c22bfe2e7950ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc9c22bfe2e7950ef6=
73e
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc56bb3c4745a06ef6761

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-baylibre/baseline-meson-sm=
1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc56bb3c4745a06ef6=
762
        new failure (last pass: next-20220112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc97f635ed8712bef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc97f635ed8712bef6=
73e
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-sm1-sei610             | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc957a98c191a20ef6759

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc957a98c191a20ef6=
75a
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc31d1713fc02acef67d8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc31d1713fc02acef6=
7d9
        new failure (last pass: next-20220112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfcab6764190209def675a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfcab6764190209def6=
75b
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfcaa1dee57d03ffef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfcaa1dee57d03ffef6=
73e
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc1f9224d3ae330ef6746

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61dfc1f9224d3ae=
330ef6749
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104)
        2 lines

    2022-01-13T06:08:33.560099  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T06:08:33.560203  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T06:08:33.560287  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T06:08:33.560367  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T06:08:33.560446  kern  :alert : Data abort info:
    2022-01-13T06:08:33.602513  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T06:08:33.602624  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T06:08:33.602715  kern  :alert : user pgtable: 4k pages, 48-b=
it<8>[   15.849124] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>
    2022-01-13T06:08:33.602801   VAs, pgdp=3D000000007fa22000
    2022-01-13T06:08:33.602883  kern  :aler<8>[   15.861562] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 598027_1.5.2.4.1> =

    ... (2 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61dfc1f9224d3ae=
330ef674a
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104)
        12 lines

    2022-01-13T06:08:33.559185  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T06:08:33.559317  kern  :alert : Mem abort info:
    2022-01-13T06:08:33.559415  ker<8>[   15.807854] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T06:08:33.559501  n  :alert :   ESR =3D 0x96000006   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc43d0c49a738b0ef6755

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61dfc43d0c49a73=
8b0ef6758
        failing since 8 days (last pass: next-20211223, first fail: next-20=
220104)
        2 lines

    2022-01-13T06:17:52.263838  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T06:17:52.264009  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T06:17:52.264130  kern  :alert : user pgtable: 4k pages<8>[  =
 15.621145] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-13T06:17:52.264221  , 48-bit VAs, pgdp=3D000000007f874000
    2022-01-13T06:17:52.264303  ker<8>[   15.633552] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 598071_1.5.2.4.1>
    2022-01-13T06:17:52.264527  n  :alert : [0000000000000000] pgd=3D080000=
007f8e0003, p4d=3D080000007f8e0003, pud=3D080000004a711003, pmd=3D000000000=
0000000
    2022-01-13T06:17:52.264649  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61dfc43d0c49a73=
8b0ef6759
        failing since 8 days (last pass: next-20211223, first fail: next-20=
220104)
        12 lines

    2022-01-13T06:17:52.169733  <8>[   15.541124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-13T06:17:52.220280  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T06:17:52.220415  kern  :alert : Mem abort info:
    2022-01-13T06:17:52.220535  ker<8>[   15.580502] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T06:17:52.220626  n  :alert :   ESR =3D 0x96000006
    2022-01-13T06:17:52.220710  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T06:17:52.220792  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T06:17:52.220871  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T06:17:52.220971  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T06:17:52.221053  kern  :alert : Data abort info:   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfc916137218fccdef6765

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61dfc916137218f=
ccdef6768
        failing since 8 days (last pass: next-20211223, first fail: next-20=
220104)
        2 lines

    2022-01-13T06:38:52.918213  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T06:38:52.918303  kern  :alert : Data abort info:
    2022-01-13T06:38:52.960266  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T06:38:52.960388  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T06:38:52.960499  kern  :alert : user pgtable: 4k pages, 48-b=
it<8>[   15.888919] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfai=
l UNITS=3Dlines MEASUREMENT=3D2>
    2022-01-13T06:38:52.960607   VAs, pgdp=3D000000007f9dd000
    2022-01-13T06:38:52.960690  kern  :aler<8>[   15.900800] <LAVA_SIGNAL_E=
NDRUN 0_dmesg 598156_1.5.2.4.1>
    2022-01-13T06:38:52.960773  t : [0000000000000000] pgd=3D080000007f9de0=
03, p4d=3D080000007f9de003, pud=3D080000007f9df003, pmd=3D0000000000000000
    2022-01-13T06:38:52.960856  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61dfc916137218f=
ccdef6769
        failing since 8 days (last pass: next-20211223, first fail: next-20=
220104)
        12 lines

    2022-01-13T06:38:52.917039  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T06:38:52.917219  kern  :alert : Mem abort info:
    2022-01-13T06:38:52.917310  ker<8>[   15.847256] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T06:38:52.917393  n  :alert :   ESR =3D 0x96000006
    2022-01-13T06:38:52.917475  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T06:38:52.917553  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T06:38:52.917630  kern  :alert :   EA =3D 0, S1PTW =3D 0   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61dfce65630055782eef6753

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61dfce656300557=
82eef6756
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104)
        2 lines

    2022-01-13T07:01:28.995195  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-13T07:01:28.995352  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-13T07:01:28.995444  kern  :alert : user pgtable: 4k pages<8>[  =
 16.474438] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-13T07:01:28.995532  , 48-bit VAs, pgdp=3D000000007f838000
    2022-01-13T07:01:28.995614  ker<8>[   16.486528] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 598213_1.5.2.4.1>
    2022-01-13T07:01:28.995705  n  :alert : [0000000000000000] pgd=3D080000=
004f9f6003, p4d=3D080000004f9f6003, pud=3D080000004f1d9003, pmd=3D000000000=
0000000
    2022-01-13T07:01:28.995787  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61dfce656300557=
82eef6757
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104)
        12 lines

    2022-01-13T07:01:28.951823  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-13T07:01:28.951941  kern  :alert : Mem abort info:
    2022-01-13T07:01:28.952032  ker<8>[   16.433730] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-13T07:01:28.952117  n  :alert :   ESR =3D 0x96000006
    2022-01-13T07:01:28.952220  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-13T07:01:28.952300  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-13T07:01:28.952377  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-13T07:01:28.952454  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-13T07:01:28.952530  kern  :alert : Data abort info:   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfcedebc985aa8b2ef674e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfcedebc985aa8b2ef6=
74f
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc84b6400004e8eef674a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig+config_efi=3Dy+config_arm_lpae=3Dy/gcc-10/lab-collabora/=
baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc84b6400004e8eef6=
74b
        failing since 7 days (last pass: next-20211223, first fail: next-20=
220105) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | multi_v7=
_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfce60bc985aa8b2ef6741

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-t=
egra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfce60bc985aa8b2ef6=
742
        failing since 7 days (last pass: next-20211223, first fail: next-20=
220105) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfd188447eded99eef6747

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm/=
multi_v7_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfd188447eded99eef6=
748
        failing since 7 days (last pass: next-20211222, first fail: next-20=
220105) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
tegra124-nyan-big            | arm    | lab-collabora | gcc-10   | tegra_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc7abe337c7b306ef6756

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc7abe337c7b306ef6=
757
        failing since 7 days (last pass: next-20211223, first fail: next-20=
220105) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc16874096f537eef67a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc16874096f537eef6=
7a6
        failing since 50 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc820dce989a3adef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc820dce989a3adef6=
73e
        failing since 50 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfc974ab96009a5bef6761

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfc974ab96009a5bef6=
762
        failing since 50 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61dfca3c9380d3244eef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220113/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61dfca3c9380d3244eef6=
73e
        failing since 50 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
