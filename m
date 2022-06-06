Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2DC53DFD8
	for <lists+linux-next@lfdr.de>; Mon,  6 Jun 2022 04:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244920AbiFFCwx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jun 2022 22:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbiFFCww (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Jun 2022 22:52:52 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644D017AA5
        for <linux-next@vger.kernel.org>; Sun,  5 Jun 2022 19:52:49 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 187so11658477pfu.9
        for <linux-next@vger.kernel.org>; Sun, 05 Jun 2022 19:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QV3IoY46Oq1LsqgtBbKQH0Rg6u4pbTT0w+rl2MTg+YE=;
        b=UY7n3jgpNlYLSXl9AkJYL8Rkxmc7Mpe2ZqlUMSn6KLHd35qLMPE/vf3SlyPHrMqwu+
         0xMlsU+zJIcZB2YBqcIy/CSAiplR/MKZ2MnAGDt3GIu7TZZ7p+x8SkNocCxUpWxQ5CAd
         4PjNCoAaEBjLxe5OxelIPJBkr4sN2O+WoeCTM14EWKAyq+btChcSn13DQsRQAA+fgDF/
         R/Cqh6V0Qj8cHxviFzY7v38jPzPmx/2KZ340Ner2cgZrJZiyUvYmrwxywKlgUwxijuRn
         8lWeXOlkl8agGCl3IjGVIJh/bwKo3aUx6nXJi2GQIOL9IZDKE5ldpURZTl8XPjBrJrFB
         8VHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QV3IoY46Oq1LsqgtBbKQH0Rg6u4pbTT0w+rl2MTg+YE=;
        b=MUuh917MW/o0/Q1M+a1ESEgTGgWF0mVpyit329UT9DeLaicoq0498E/Rg4Q6bYSLON
         F83bL1F8ubo5WSkiYBphlGpQKRReO6SxYIXX4S9x1OejQzO6oNAOBjk/wH4W9yA+oMwQ
         Ppklbn4Fx2KOIUpLWlQaJ/1Ai+syumK6aJPJfB5Ic+x2TOqGXZxadgcTXRwW+VMlG5B2
         7F9ST6/mA7GdAde0r1KFOZ2dQy/sfZoAVe8E+gcDmSmKSW9HviLMtbgy+0VLhSrjQEpy
         0F85wI85o5yy75YeWrPEJfZKYNgGpZ6+WIkHgJqKwODJbGNIgwrCr7Vb+LDWZHchEouU
         C62w==
X-Gm-Message-State: AOAM530QfPuikJ0qsH09M2fN7zxpTiJmYVewSdaktGGt/PXQfStzCutd
        96M50kQD4kU6JIKsDm/pKv7ZYArd4DUOoubZ
X-Google-Smtp-Source: ABdhPJxmG4KUhF1XM3+SRiDox0+xhHh2ZMUZrRFxJlGhR5G9/mGzId5MagQK9swuf7b2UjyScJmmpQ==
X-Received: by 2002:a05:6a00:ac3:b0:51b:9803:dc01 with SMTP id c3-20020a056a000ac300b0051b9803dc01mr22236125pfl.8.1654483968152;
        Sun, 05 Jun 2022 19:52:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902edca00b0015e8d4eb22csm9256692plk.118.2022.06.05.19.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 19:52:46 -0700 (PDT)
Message-ID: <629d6bfe.1c69fb81.c12b0.5160@mx.google.com>
Date:   Sun, 05 Jun 2022 19:52:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.18-14068-g9e633753407a5
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 402 runs,
 36 regressions (v5.18-14068-g9e633753407a5)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 402 runs, 36 regressions (v5.18-14068-g9e63375=
3407a5)

Regressions Summary
-------------------

platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained       | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

at91-sama5d4_xplained       | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                  | arm    | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

hp-x360-14-G1-sona          | x86_64 | lab-collabora   | gcc-10   | x86_64_=
defcon...6-chromebook | 1          =

imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =

kontron-pitx-imx8m          | arm64  | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 1          =

odroid-xu3                  | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =

r8a77950-salvator-x         | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

rk3288-veyron-jaq           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-a64-pine64-plus      | arm64  | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =

sun50i-h5-nanopi-neo-plus2  | arm64  | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =

sun50i-h6-pine-h64          | arm64  | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h6-pine-h64          | arm64  | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun8i-a33-olinuxino         | arm    | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a33-olinuxino         | arm    | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

sun8i-h2-plus-orangepi-zero | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-14068-g9e633753407a5/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-14068-g9e633753407a5
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9e633753407a54bfeb8098de94ce22b1c1f5b8fa =



Test Regressions
---------------- =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained       | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d36adfd552a1c89a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d36adfd552a1c89a39=
bd1
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
at91-sama5d4_xplained       | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d36fbe320881b22a39bff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d36fbe320881b22a39=
c00
        new failure (last pass: v5.18-12139-gb5db4eaa8649) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                  | arm    | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3646be08b53e25a39bf3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/629d3646be08b53=
e25a39bfb
        failing since 133 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-06-05T23:03:08.421889  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-06-05T23:03:08.422128  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-06-05T23:03:08.424864  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-06-05T23:03:08.470662  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
hp-x360-14-G1-sona          | x86_64 | lab-collabora   | gcc-10   | x86_64_=
defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3548dbe346b5a1a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora=
/baseline-hp-x360-14-G1-sona.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3548dbe346b5a1a39=
bd3
        new failure (last pass: v5.18-12248-g882f1d1979b5) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/629d360c491dc1d097a39bee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d360c491dc1d097a39=
bef
        failing since 5 days (last pass: v5.16-rc4-241-g3e464b455df7, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d380000196312cfa39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-pengutronix/baseli=
ne-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d380000196312cfa39=
bdb
        failing since 5 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3b5cf9fbf6e046a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3b5cf9fbf6e046a39=
bdf
        failing since 5 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit          | arm    | lab-pengutronix | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3be8bb078995d5a39bf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutroni=
x/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3be8bb078995d5a39=
bf9
        failing since 5 days (last pass: v5.16-rc4-356-ga119cd39dcbf, first=
 fail: v5.18-11575-gceccc06b624ed) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d38e59b17154befa39c06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d38e59b17154befa39=
c07
        failing since 13 days (last pass: v5.18-rc7-251-g195d7f7a62c6, firs=
t fail: v5.18-155-gb82692513a38) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3a4c14b9bf09b5a39bdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3a4c14b9bf09b5a39=
bde
        failing since 37 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fir=
st fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3fc4fa38328f07a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3fc4fa38328f07a39=
bd3
        failing since 16 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-rc7-251-g195d7f7a62c6) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                  | arm    | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3cd8c5b84aa7eaa39bda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3cd8c5b84aa7eaa39=
bdb
        new failure (last pass: v5.18-12139-gb5db4eaa8649) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls       | arm64  | lab-kontron     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d39cb42379f247fa39bdb

  Results:     94 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/62=
9d39cb42379f247fa39be4
        failing since 5 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed)

    2022-06-05T23:17:58.767878  /lava-124687/1/../bin/lava-test-case
    2022-06-05T23:17:58.855825  <8>[   40.432717][  T318] <LAVA_SIGNAL_TEST=
CASE TEST_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>   =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m          | arm64  | lab-kontron     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3bd28d68844dbaa39be8

  Results:     50 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/629=
d3bd28d68844dbaa39bfb
        new failure (last pass: v5.18-12139-gb5db4eaa8649)

    2022-06-05T23:26:59.469195  /lava-124691/1/../bin/lava-test-case
    2022-06-05T23:26:59.469579  <8>[   20.958876] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-06-05T23:26:59.469822  /lava-124691/1/../bin/lava-test-case   =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
odroid-xu3                  | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d391d61a46649d8a39bf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d391d61a46649d8a39=
bf6
        new failure (last pass: v5.18-12139-gb5db4eaa8649) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d39b25d071142f6a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d39b25d071142f6a39=
bce
        failing since 25 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv2-uefi  | arm64  | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d39a2afd3dd3b51a39c75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d39a2afd3dd3b51a39=
c76
        failing since 25 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d39b45d071142f6a39bd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d39b45d071142f6a39=
bd1
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3       | arm64  | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d39a5ad1f74bc2fa39bf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d39a5ad1f74bc2fa39=
bf5
        new failure (last pass: v5.18-11819-gfcd5217077654) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d39b55d071142f6a39bd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d39b55d071142f6a39=
bd4
        failing since 25 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
qemu_arm64-virt-gicv3-uefi  | arm64  | lab-broonie     | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d39a7ad1f74bc2fa39c01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d39a7ad1f74bc2fa39=
c02
        failing since 25 days (last pass: v5.18-rc5-178-g63184bc90d435, fir=
st fail: v5.18-rc6-217-gd854612e01df) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x         | arm64  | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d387050b6299a17a39bcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d387050b6299a17a39=
bd0
        new failure (last pass: v5.18-12139-gb5db4eaa8649) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3ab515180af27ca39bd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3ab515180af27ca39=
bd7
        failing since 3 days (last pass: v5.18-11819-gfcd5217077654, first =
fail: v5.18-12139-gb5db4eaa8649) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-pine64-plus      | arm64  | lab-broonie     | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3b4adc43b7c521a39bd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+crypto/gcc-10/lab-broonie/baseline-sun50i-a=
64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3b4bdc43b7c521a39=
bd6
        failing since 10 days (last pass: v5.18-1222-g391cf5a1244f, first f=
ail: v5.18-5613-ge079cf8f6817) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2  | arm64  | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3533477cb36451a39bdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h5-nanopi=
-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-h5-nanopi=
-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3533477cb36451a39=
bdd
        failing since 3 days (last pass: v5.18-11575-gceccc06b624ed, first =
fail: v5.18-12139-gb5db4eaa8649) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64          | arm64  | lab-clabbe      | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d369ab3a2fad5c0a39c13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-clabbe=
/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d369ab3a2fad5c0a39=
c14
        failing since 5 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64          | arm64  | lab-collabora   | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d36a95530998307a39bd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collab=
ora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d36a95530998307a39=
bd3
        failing since 5 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-11575-gceccc06b624ed) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino         | arm    | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d388c585a368d79a39bde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d388c585a368d79a39=
bdf
        failing since 9 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-9954-g9e21d180a100) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun8i-a33-olinuxino         | arm    | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3648be08b53e25a39c01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-ol=
inuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a33-ol=
inuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3648be08b53e25a39=
c02
        new failure (last pass: v5.18-12248-g882f1d1979b5) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-zero | arm    | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d380baccfda1510a39bdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun8i-h2-plus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-sun8i-h2-plus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d380baccfda1510a39=
bdc
        new failure (last pass: v5.18-12139-gb5db4eaa8649) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3f319d4c0c1332a39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3f319d4c0c1332a39=
bce
        failing since 9 days (last pass: v5.18-5613-ge079cf8f6817, first fa=
il: v5.18-9954-g9e21d180a100) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3dddf8bfa7568ca39bcd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-r40-ba=
nanapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3dddf8bfa7568ca39=
bce
        new failure (last pass: v5.18-12248-g882f1d1979b5) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/629d375e2b7a40e802a39c1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline=
-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+crypto/gcc-10/lab-collabora/baseline=
-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d375e2b7a40e802a39=
c20
        failing since 9 days (last pass: v5.18-1222-g391cf5a1244f, first fa=
il: v5.18-5613-ge079cf8f6817) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d38d7d08f7fc0eaa39bd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d38d7d08f7fc0eaa39=
bda
        failing since 13 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-155-gb82692513a38) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/629d3b0cf81d9618e5a39be4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d3b0cf81d9618e5a39=
be5
        failing since 11 days (last pass: v5.18-rc7-165-g2424086909d29, fir=
st fail: v5.18-1222-g391cf5a1244f) =

 =



platform                    | arch   | lab             | compiler | defconf=
ig                    | regressions
----------------------------+--------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big           | arm    | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/629d399bad1f74bc2fa39bdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-=
nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-14068=
-g9e633753407a5/arm/tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-=
nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220527.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/629d399bad1f74bc2fa39=
bde
        failing since 3 days (last pass: v5.18-11819-gfcd5217077654, first =
fail: v5.18-12139-gb5db4eaa8649) =

 =20
