Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F69495BA7
	for <lists+linux-next@lfdr.de>; Fri, 21 Jan 2022 09:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349404AbiAUIRr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jan 2022 03:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349312AbiAUIRr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Jan 2022 03:17:47 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E735C061574
        for <linux-next@vger.kernel.org>; Fri, 21 Jan 2022 00:17:47 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d7so7684900plr.12
        for <linux-next@vger.kernel.org>; Fri, 21 Jan 2022 00:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Q1/p0dnoeBe8yUHzXsfQXyJgXmz/DfJpd/4iruALU5E=;
        b=J8C+WKd1Ena0aheSCs0vAMQ0ioShyYQ+3oFZ+IgefXzqDtLZXDpJgIYNHoqC/+3DTV
         L449kETxU0c/2meYGvKOZXpLUvbGZuKjqZmZj86UQ/uD1in8dlf6yj6UYxCniKdKaewL
         ql54ERtRzEkg9MPda40Y+0B3cxR0GNy+rj5Grl8zxUFmyQOj/0MIlUT+Qu35dQxelfdi
         tfzEz9tyN+vrtdV9ZE9jrEBzWtrlkhoUGBNyBDTT7q0oR2ek9W5hHv7CGnw1LBmhtQQz
         Vgyc37Wx4MAHlKuSyQxjWJ5x56/6CW+VcwHZHQyXuMo3eYJFPpamyS+MkBnZKrMNhwKM
         Ib5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Q1/p0dnoeBe8yUHzXsfQXyJgXmz/DfJpd/4iruALU5E=;
        b=pD6V68NV2Rps6Ms/b1ITLCMpok6KkCxCHBMk1Udvbvia0JL71eJv7P17mUX9ZLgSpk
         8Fd2wYohSyK65kfs/BrDrhYUQOKa9cw4QhJoXfWlbaLINnJau3+DKL6vq5UrO8bcxDEy
         jMrsgcdJ6ONcHC4aO6WiI7p5nsPDGkdoYpB07XP3EWm4SAIkWZ6+Bvc1MgqTT1mf1bjA
         KDe1LxOEEbsD0oSvRUmVkSVP4Q98xtiSY3KQz3i7XMrG/i2/7WWGnTaCPJbbtWEx3TGY
         /MxXO9hesJ0PllTSIjxZANL2yVyulWevI1VzekOe9kWiccIzxwIP+w/VfIi+Y0EVQWgC
         /oKw==
X-Gm-Message-State: AOAM533nTun0FiIpP5z5pUIpRP4ggHEanH0ToFKbU/I73sbq9qcL3/4R
        I8fxNkZuMiY6dJbjWvp8PFzmuwsioCPZPYaj
X-Google-Smtp-Source: ABdhPJwiA03TRQEpOVvFZvlel8OdoPKqm5S0sPYcakjEXN4U/MGQRUEr+X91p8qTYHsJmmkQnsQv5g==
X-Received: by 2002:a17:902:c411:b0:14b:1902:2a74 with SMTP id k17-20020a170902c41100b0014b19022a74mr2641976plk.133.1642753065389;
        Fri, 21 Jan 2022 00:17:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f13sm6167031pfc.70.2022.01.21.00.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 00:17:45 -0800 (PST)
Message-ID: <61ea6c29.1c69fb81.146d8.2209@mx.google.com>
Date:   Fri, 21 Jan 2022 00:17:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220121
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 807 runs, 56 regressions (next-20220121)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 807 runs, 56 regressions (next-20220121)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =

fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

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

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 2          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-14 | defconf=
ig                    | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 1          =

zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220121/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220121
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c94951012a748a0f8ed77cd8fc25640c6fe198f9 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2e7a73ab4d21e0abbd1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2e7b73ab4d21e0abb=
d1c
        new failure (last pass: next-20220120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1043a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea33e2973373827dabbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-fsl-ls1043a-=
rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea33e2973373827dabb=
d12
        failing since 8 days (last pass: next-20211224, first fail: next-20=
220112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-14x14-evk             | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea275cddb775ff5cabbd16

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea275cddb775ff5cabb=
d17
        failing since 28 days (last pass: next-20211221, first fail: next-2=
0211223) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2e408cbd83c74fabbd1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-=
evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2e408cbd83c74fabb=
d1d
        failing since 29 days (last pass: next-20211221, first fail: next-2=
0211222) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea297e474c62fcc5abbd84

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea297f474c62fcc5abbdc5
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T03:33:02.004597  /lava-81178/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a297f474c62fcc5abbdc6
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T03:33:02.007775  <8>[   18.724017] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T03:33:03.056482  /lava-81178/1/../bin/lava-test-case
    2022-01-21T03:33:03.056832  <8>[   19.742399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea2ef4a02b9179aaabbd65

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea2ef5a02b9179aaabbda6
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T03:55:58.848936  /lava-81191/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a2ef5a02b9179aaabbda7
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T03:55:58.853106  <8>[   17.366778] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T03:55:59.898638  /lava-81191/1/../bin/lava-test-case
    2022-01-21T03:55:59.899058  <8>[   18.385398] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-21T03:55:59.899303  /lava-81191/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea2f6e00b89a252fabbd22

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea2f6e00b89a252fabbd63
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T03:58:15.929549  /lava-81193/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a2f6e00b89a252fabbd64
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T03:58:15.932718  <8>[   16.558862] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T03:58:16.980118  /lava-81193/1/../bin/lava-test-case
    2022-01-21T03:58:16.980414  <8>[   17.578107] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-21T03:58:16.980564  /lava-81193/1/../bin/lava-test-case
    2022-01-21T03:58:16.980705  <8>[   17.594125] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-21T03:58:16.980846  /lava-81193/1/../bin/lava-test-case
    2022-01-21T03:58:16.980981  <8>[   17.610148] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-21T03:58:16.981116  /lava-81193/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea31891b6fa2a00aabbd12

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea31891b6fa2a00aabbd56
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T04:07:30.658586  /lava-81201/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a31891b6fa2a00aabbd57
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T04:07:30.661427  <8>[   17.959795] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T04:07:31.707859  /lava-81201/1/../bin/lava-test-case
    2022-01-21T04:07:31.708263  <8>[   18.978534] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea337ed5d9f042e0abbd43

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea337ed5d9f042e0abbd84
        failing since 31 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-21T04:15:40.257209  /lava-81212/1/../bin/lava-test-case
    2022-01-21T04:15:40.279177  <8>[   16.886254] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a337ed5d9f042e0abbd85
        failing since 31 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-21T04:15:41.329382  /lava-81212/1/../bin/lava-test-case
    2022-01-21T04:15:41.329727  <8>[   17.906085] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-21T04:15:41.329932  /lava-81212/1/../bin/lava-test-case
    2022-01-21T04:15:41.330121  <8>[   17.922952] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-21T04:15:41.330298  /lava-81212/1/../bin/lava-test-case
    2022-01-21T04:15:41.330468  <8>[   17.940078] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-21T04:15:41.330639  /lava-81212/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea297d474c62fcc5abbd1e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea297d474c62fcc5abbd66
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T03:32:56.244452  /lava-81176/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a297d474c62fcc5abbd67
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T03:32:56.247763  <8>[   13.482664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T03:32:57.294713  /lava-81176/1/../bin/lava-test-case
    2022-01-21T03:32:57.295088  <8>[   14.502080] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea2e40f2fdbf98baabbd47

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea2e41f2fdbf98baabbd8f
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T03:53:13.861443  /lava-81186/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a2e41f2fdbf98baabbd90
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T03:53:13.864626  <8>[   13.618753] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T03:53:14.912441  /lava-81186/1/../bin/lava-test-case
    2022-01-21T03:53:14.912820  <8>[   14.638183] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea2fe72092e4b71fabbd1d

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea2fe72092e4b71fabbd65
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T04:00:31.597025  /lava-81197/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a2fe72092e4b71fabbd66
        failing since 30 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-21T04:00:31.600616  <8>[   13.459451] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T04:00:32.647020  /lava-81197/1/../bin/lava-test-case
    2022-01-21T04:00:32.647438  <8>[   14.478070] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea305e145cee92fcabbd20

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea305e145cee92fcabbd68
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T04:02:14.451110  /lava-81199/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a305e145cee92fcabbd69
        failing since 34 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-21T04:02:14.454482  <8>[   13.486537] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T04:02:15.500507  /lava-81199/1/../bin/lava-test-case
    2022-01-21T04:02:15.500776  <8>[   14.505221] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-21T04:02:15.500932  /lava-81199/1/../bin/lava-test-case
    2022-01-21T04:02:15.501077  <8>[   14.520662] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea337f53eb062157abbd11

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61ea338053eb062157abbd59
        failing since 31 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-21T04:15:37.893281  /lava-81216/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
a338053eb062157abbd5a
        failing since 31 days (last pass: next-20211216, first fail: next-2=
0211220)

    2022-01-21T04:15:37.896746  <8>[   14.125304] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-21T04:15:38.945531  /lava-81216/1/../bin/lava-test-case
    2022-01-21T04:15:38.945895  <8>[   15.144567] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2d8cf26773d6c0abbd52

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2d8cf26773d6c0abb=
d53
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-u200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2ddc547d5e1850abbd48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-u200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2ddc547d5e1850abb=
d49
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2d78f26773d6c0abbd14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2d78f26773d6c0abb=
d15
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2ee1a02b9179aaabbd5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2ee1a02b9179aaabb=
d5b
        failing since 15 days (last pass: next-20211224, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2db204195e5cc4abbd21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-meson-=
g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2db204195e5cc4abb=
d22
        failing since 15 days (last pass: next-20211224, first fail: next-2=
0220105) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-odroid-n2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2da27e03c48046abbd38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2da27e03c48046abb=
d39
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea31b9b1b195ddfaabbd1e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea31b9b1b195ddfaabb=
d1f
        failing since 16 days (last pass: next-20211118, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2da57e03c48046abbd3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2da57e03c48046abb=
d3f
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2dfa8ac7181f0babbd75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-clabbe/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2dfa8ac7181f0babb=
d76
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2d85f26773d6c0abbd38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2d85f26773d6c0abb=
d39
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2df18ac7181f0babbd57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-baylibre/baseline-meson-s=
m1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2df18ac7181f0babb=
d58
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea338d53eb062157abbd80

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea338d53eb062157abb=
d81
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea5d6de1e33d592cabbd14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea5d6de1e33d592cabb=
d15
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea338f53eb062157abbd8d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-collabora/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea338f53eb062157abb=
d8e
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64 | lab-linaro-lkft | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea5d70e1e33d592cabbd1a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-linaro-lkft/baseline-qemu=
_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea5d70e1e33d592cabb=
d1b
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea28453a61f7e750abbd2f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea28453a61f7e=
750abbd35
        failing since 16 days (last pass: next-20211223, first fail: next-2=
0220104)
        2 lines

    2022-01-21T03:27:34.605496  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-21T03:27:34.605622  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-21T03:27:34.605735  kern  :alert : user pgtable: 4k pages<8>[  =
 16.327814] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-21T03:27:34.605844  , 48-bit VAs, pgdp=3D000000007f91c000
    2022-01-21T03:27:34.605949  ker<8>[   16.339832] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 606526_1.5.2.4.1>
    2022-01-21T03:27:34.606033  n  :alert : [0000000000000000] pgd=3D080000=
007f9aa003, p4d=3D080000007f9aa003, pud=3D080000007f9ab003, pmd=3D000000000=
0000000
    2022-01-21T03:27:34.606117  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea28453a61f7e=
750abbd36
        failing since 16 days (last pass: next-20211223, first fail: next-2=
0220104)
        12 lines

    2022-01-21T03:27:34.562569  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-21T03:27:34.562703  kern  :alert : Mem abort info:
    2022-01-21T03:27:34.562802  ker<8>[   16.286866] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-21T03:27:34.562897  n  :alert :   ESR =3D 0x96000006
    2022-01-21T03:27:34.562988  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T03:27:34.563067  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-21T03:27:34.563146  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-21T03:27:34.563222  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-21T03:27:34.563298  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea2b291d2a4852dbabbd59

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea2b291d2a485=
2dbabbd5f
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-21T03:40:10.687224  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-21T03:40:10.687364  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-21T03:40:10.687457  kern  :alert : user pgtable: 4k pages<8>[  =
 15.685199] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-21T03:40:10.687545  , 48-bit VAs, pgdp=3D000000007f8f4000
    2022-01-21T03:40:10.687627  ker<8>[   15.697891] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 606552_1.5.2.4.1>
    2022-01-21T03:40:10.687708  n  :alert : [0000000000000000] pgd=3D080000=
007f857003, p4d=3D080000007f857003, pud=3D080000004f84d003, pmd=3D000000000=
0000000
    2022-01-21T03:40:10.687790  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea2b291d2a485=
2dbabbd60
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-21T03:40:10.644013  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-21T03:40:10.644126  kern  :alert : Mem abort info:
    2022-01-21T03:40:10.644217  ker<8>[   15.644577] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-21T03:40:10.644304  n  :alert :   ESR =3D 0x96000006
    2022-01-21T03:40:10.645385  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T03:40:10.645484  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-21T03:40:10.645572  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-21T03:40:10.645654  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-21T03:40:10.645734  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea31063bd84d6f5cabbd74

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea31063bd84d6=
f5cabbd7a
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-21T04:04:54.308716  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-21T04:04:54.308825  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-21T04:04:54.308912  kern  :alert : user pgtable: 4k pages<8>[  =
 16.785638] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-21T04:04:54.308996  , 48-bit VAs, pgdp=3D000000007f9ab000
    2022-01-21T04:04:54.309074  ker<8>[   16.797750] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 606588_1.5.2.4.1>
    2022-01-21T04:04:54.309199  n  :alert : [0000000000000000] pgd=3D080000=
007f9ae003, p4d=3D080000007f9ae003, pud=3D080000007f9af003, pmd=3D000000000=
0000000
    2022-01-21T04:04:54.309298  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea31063bd84d6=
f5cabbd7b
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-21T04:04:54.215848  <8>[   16.705338] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-21T04:04:54.265449  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-21T04:04:54.265585  kern  :alert : Mem abort info:
    2022-01-21T04:04:54.265674  ker<8>[   16.744509] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-21T04:04:54.265757  n  :alert :   ESR =3D 0x96000006
    2022-01-21T04:04:54.265837  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T04:04:54.265915  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-21T04:04:54.265991  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-21T04:04:54.266085  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-21T04:04:54.266179  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea328247a7d2456babbd24

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea328247a7d24=
56babbd2a
        failing since 16 days (last pass: next-20211223, first fail: next-2=
0220104)
        2 lines

    2022-01-21T04:11:21.228393  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-21T04:11:21.228533  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-21T04:11:21.228621  kern  :alert : user pgtable: 4k pages<8>[  =
 16.328998] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-21T04:11:21.228704  , 48-bit VAs, pgdp=3D000000007f8f7000
    2022-01-21T04:11:21.228783  ker<8>[   16.340968] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 606609_1.5.2.4.1>
    2022-01-21T04:11:21.228860  n  :alert : [0000000000000000] pgd=3D080000=
007f8b4003, p4d=3D080000007f8b4003, pud=3D080000007f8b6003, pmd=3D000000000=
0000000
    2022-01-21T04:11:21.228939  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea328247a7d24=
56babbd2b
        failing since 16 days (last pass: next-20211223, first fail: next-2=
0220104)
        12 lines

    2022-01-21T04:11:21.185058  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-21T04:11:21.185173  kern  :alert : Mem abort info:
    2022-01-21T04:11:21.185261  ker<8>[   16.288172] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-21T04:11:21.185344  n  :alert :   ESR =3D 0x96000006
    2022-01-21T04:11:21.185424  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T04:11:21.185502  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-21T04:11:21.185578  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-21T04:11:21.185706  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-21T04:11:21.185782  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/61ea3439036db6cdb1abbd19

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61ea3439036db6c=
db1abbd1f
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104)
        2 lines

    2022-01-21T04:18:41.774707  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-21T04:18:41.774899  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-21T04:18:41.775015  kern  :alert : user pgtable: 4k pages<8>[  =
 16.001543] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-21T04:18:41.775116  , 48-bit VAs, pgdp=3D000000007f8dd000
    2022-01-21T04:18:41.775216  ker<8>[   16.013704] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 606629_1.5.2.4.1>
    2022-01-21T04:18:41.775306  n  :alert : [0000000000000000] pgd=3D080000=
007f8df003, p4d=3D080000007f8df003, pud=3D080000007f8e0003, pmd=3D000000000=
0000000
    2022-01-21T04:18:41.775396  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61ea3439036db6c=
db1abbd20
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104)
        12 lines

    2022-01-21T04:18:41.731344  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-21T04:18:41.731542  kern  :alert : Mem abort info:
    2022-01-21T04:18:41.731659  ker<8>[   15.961068] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-21T04:18:41.731761  n  :alert :   ESR =3D 0x96000006
    2022-01-21T04:18:41.731856  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-21T04:18:41.731947  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-21T04:18:41.732035  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-21T04:18:41.732119  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-21T04:18:41.732202  kern  :alert : Data abort info:   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea36e1aac9209d68abbd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek8=
74.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea36e1aac9209d68abb=
d12
        failing since 16 days (last pass: next-20211224, first fail: next-2=
0220104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-14 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea34bcf1c3b545c3abbd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220117071848+9c429=
2a59da2-1~exp1~20220117071948.123)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea34bcf1c3b545c3abb=
d16
        new failure (last pass: next-20220117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2a7ec32fd7b70fabbd3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2a7ec32fd7b70fabb=
d3e
        failing since 58 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2be7a3daae3d05abbd1c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2be7a3daae3d05abb=
d1d
        failing since 58 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2d3ac3ae643396abbd27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2d3ac3ae643396abb=
d28
        failing since 58 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2d4f136b216d1eabbd12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2d4f136b216d1eabb=
d13
        failing since 58 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
zynqmp-zcu102                | arm64 | lab-cip         | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61ea2ea345c5c9049cabbd1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220121/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220115.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61ea2ea345c5c9049cabb=
d20
        failing since 58 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
