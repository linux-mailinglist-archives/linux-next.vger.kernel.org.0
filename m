Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913E62C4D8B
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 03:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732613AbgKZCrZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 21:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729649AbgKZCrZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 21:47:25 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DA16C0613D4
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 18:47:23 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id w6so326092pfu.1
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 18:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fKWgzUIXPm6XjOLJBqVEzJqsY/1lCceCRRcTkCGa0eY=;
        b=PYNQPwR8BKOF2dL4KOUuQ0Fwl5NriPXjEQuNv4jZim2hQSXWO7itZQLmXymU/FWpqV
         1ABIFUs4gjuDG3udxXOIph86vtE4cNyF28CUZq7sz/bmub/F+5wsRHpMFp3dUOFr1rde
         UcEIi9MBbyTllfqAj6+T6lI2rTCW80a2bPGh2HrBS85L25+JXQAYTGKspXrlgQ+HbxtE
         dRnJZdctMYGGvbx576UKUrr4sMBEUw7Yf3A4JTEty4Rgfpug7q/2jtuJCBq8E06UtKny
         yrVbye3bUdqvUi3wcqE0Dlkd3sBAzyAZhloy0rg27wXl0nKFZYIXXNJlkHbsIjJ4wdHJ
         4JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fKWgzUIXPm6XjOLJBqVEzJqsY/1lCceCRRcTkCGa0eY=;
        b=Pf02QTT9uE9wC3uz4V0EXFaOGHVNnlKmpx7mFQx4L7RdmB+Yz1Cl7dqz3zTUme1hIk
         LqWRb+YxucyCTMMcMqCrT8lMxsudOsssHcsU5KV1Oncmm1rTLVlSptn0wsUf+aXMBcJy
         y+9EBvsxFngFq6dgjCGqlOX2/M9vAvTkMnONBCjuCnz5oUZ8DP0B3YEqHfQ7Wfx2Msz2
         BA31llRWAoEasKx/VGnVsAyTFPhTzX9UwmDh2T/1YlF3ZTesUew2/GV+8oQjIfpxe7WB
         mh8iwjs45MhbotTh0ux0EbsRcmDS9wo65Lu2ZHo+dbrzZvi4E0Pc8TYegyAQr0we2Z+0
         v83A==
X-Gm-Message-State: AOAM5305wJmq+g/vlacxy7fStYXQ0iG/5d84KAKPvPPzOb7lbnody6E7
        3OjJCNg/+itJeV3d0o9PTWO1Oa/y+kvdZw==
X-Google-Smtp-Source: ABdhPJz71kmghhWtR1B4Ai+JRuSVjlY6UJsqcREkkbuLPD32Vyu/1G+XsLI862TwbmoOnICYNxOaNA==
X-Received: by 2002:a17:90a:db0a:: with SMTP id g10mr990544pjv.225.1606358842673;
        Wed, 25 Nov 2020 18:47:22 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q19sm3129185pff.101.2020.11.25.18.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 18:47:22 -0800 (PST)
Message-ID: <5fbf173a.1c69fb81.b0e03.8d4e@mx.google.com>
Date:   Wed, 25 Nov 2020 18:47:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-rc5-316-g030ec55420bc7
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 391 runs,
 16 regressions (v5.10-rc5-316-g030ec55420bc7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 391 runs, 16 regressions (v5.10-rc5-316-g030ec=
55420bc7)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-8    | sama5_defco=
nfig              | 1          =

bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

beagle-xm                | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =

kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-8    | defconfig  =
                  | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc5-316-g030ec55420bc7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc5-316-g030ec55420bc7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      030ec55420bc7644025d4eca81f25fb3d451b858 =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
at91-sama5d4_xplained    | arm   | lab-baylibre    | gcc-8    | sama5_defco=
nfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee1e9adb8986accc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee1e9adb8986accc94=
ccf
        failing since 204 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
bcm2837-rpi-3-b          | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbedf9255c4bd8480c94cb9

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fbedf9255c4bd84=
80c94cbc
        failing since 0 day (last pass: v5.10-rc5-256-gea2235a03b2c, first =
fail: v5.10-rc5-280-gbbd73b6892345)
        1 lines

    2020-11-25 22:47:32.502000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-25 22:47:32.502000+00:00  (user:khilman) is already connected
    2020-11-25 22:47:48.475000+00:00  =00
    2020-11-25 22:47:48.476000+00:00  =

    2020-11-25 22:47:48.491000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-25 22:47:48.492000+00:00  =

    2020-11-25 22:47:48.492000+00:00  DRAM:  948 MiB
    2020-11-25 22:47:48.508000+00:00  RPI 3 Model B (0xa02082)
    2020-11-25 22:47:48.596000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-25 22:47:48.628000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (380 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
beagle-xm                | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee66cca43e07a9dc94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee66cca43e07a9dc94=
cca
        new failure (last pass: v5.10-rc5-280-gbbd73b6892345) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-sabresd            | arm   | lab-nxp         | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee643021a094dc2c94ce8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee643021a094dc2c94=
ce9
        failing since 31 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee72b4d7ac021a6c94ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/=
baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee72b4d7ac021a6c94=
ce4
        failing since 1 day (last pass: v5.10-rc4-615-gd0b6b0cb24dad, first=
 fail: v5.10-rc5-256-gea2235a03b2c) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6ul-pico-hobbit       | arm   | lab-pengutronix | gcc-8    | imx_v6_v7_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee5732aef3b0b69c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-im=
x6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee5732aef3b0b69c94=
cba
        new failure (last pass: v5.10-rc5-280-gbbd73b6892345) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee09374b8334d62c94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee09374b8334d62c94=
ce1
        new failure (last pass: v5.10-rc5-280-gbbd73b6892345) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee2c01e7da333a5c94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee2c01e7da333a5c94=
cc5
        failing since 12 days (last pass: v5.10-rc3-337-ge83d2e1f2d190, fir=
st fail: v5.10-rc3-420-g5364e201065c) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
kontron-sl28-var3-ads2   | arm64 | lab-kontron     | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee09dce77723373c94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-v=
ar3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee09dce77723373c94=
cbf
        new failure (last pass: v5.10-rc5-280-gbbd73b6892345) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbedf3e64b01cc758c94d12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbedf3e64b01cc758c94=
d13
        new failure (last pass: v5.10-rc5-280-gbbd73b6892345) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee0098ee87e9dc6c94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee0098ee87e9dc6c94=
cc2
        new failure (last pass: v5.10-rc5-280-gbbd73b6892345) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee27c804f5f9596c94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee27c804f5f9596c94=
cc8
        failing since 9 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee338a94edd6724c94ce6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee338a94edd6724c94=
ce7
        failing since 9 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee1cddab4d11a7fc94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee1cddab4d11a7fc94=
cd8
        failing since 9 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee1dd576710e999c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee1dd576710e999c94=
cbb
        failing since 9 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fbee17d686d4e7667c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc5-3=
16-g030ec55420bc7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fbee17d686d4e7667c94=
cc0
        failing since 9 days (last pass: v5.10-rc3-420-g5364e201065c, first=
 fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
