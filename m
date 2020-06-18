Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7471FEF96
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 12:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgFRKW7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 06:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbgFRKWv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 06:22:51 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F86C06174E
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 03:22:51 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x11so2254148plo.7
        for <linux-next@vger.kernel.org>; Thu, 18 Jun 2020 03:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yJ5sMCxeqS/DnIqL98PjP0UgB7lgDDoNjw/c/IiJiHU=;
        b=c0jHwu29sCSAd9qo+nopxv8IKxmnWKW+KraCZwkHdBbYJyP1FX5ALSOLIBhQewVavK
         WScUIK3OQXPAUuL5InKN1veqqfQUbLOI/Ue0rhcUcQzqMFibaFm0CZKZOUatfdzR9Uu7
         cr9h9vZuiqcIBpvtIH+WYkr8tXyKYqCoMzrt67bS26bIcx+7jR00og/O2OWEVa/33TAr
         wg5z7CcEgX5JlDXQ5UIhQAlEsSjRJwwopovwVT1t7nsosfDcQTnrTCvHBmNYYYb7tVE3
         oVm6Er3n4ILUBG12Uoo4fockBpdBiyqx6OHwcK5/DEdLdsELeZsp0Eh6BTiyRVhWwPAq
         glZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yJ5sMCxeqS/DnIqL98PjP0UgB7lgDDoNjw/c/IiJiHU=;
        b=qZoTS6tF2v+bfv85DIKgsNQT2JnOaIJqBubsVs77FGcAASH1d9xz0/+syfhc3ZwEHY
         0iKwXFPm/mCzIQrNt6d0bO/q6HwQmZHtV2FgJ2WFG3d+sCMq/T9/BOdFqpsCIZ5zn97g
         FAj7MVlLdoGZZfnUOB9yi5O7sxgX4xco55JGT3cdhINIEkPDouneuag59VadEDc2Emh6
         4cSMWeqh3Pa+Q82Q+Z+h6FSnBW70zsJ2hLm5Dc502w7WNI9j6heZZjA5XCxIO+UYUd2w
         jwcoKVCTUwdWfBCmhkhh4I2KDWoTd4LnbWF5jCMAjHO9maZOwrf4WG09VL3D64+E7nLt
         XZvg==
X-Gm-Message-State: AOAM533Cl90PxYf4NShRJRTrq4tXvOII5NOXmCgDWdstfBALGaFnoNA9
        sQ1Zfy7WAGiREBd2IDvq+iyFX7LUq+w=
X-Google-Smtp-Source: ABdhPJzoICD8cUxsFIWMKTkj3fQ/6VF2IGShmdf/sSMaN9Kw0b8cl1OoafDjsoiLJjONkrhR5XtohQ==
X-Received: by 2002:a17:902:c30c:: with SMTP id k12mr3266708plx.130.1592475769458;
        Thu, 18 Jun 2020 03:22:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y7sm2076856pjy.21.2020.06.18.03.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 03:22:48 -0700 (PDT)
Message-ID: <5eeb4078.1c69fb81.d10df.69c8@mx.google.com>
Date:   Thu, 18 Jun 2020 03:22:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200618
Subject: next/master baseline: 151 runs, 5 regressions (next-20200618)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 151 runs, 5 regressions (next-20200618)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-8    | sama5_d=
efconfig              | 0/1    =

da850-lcdk                   | arm   | lab-baylibre    | gcc-8    | davinci=
_all_defconfig        | 3/5    =

imx27-phytec-phycard-s-rdk   | arm   | lab-pengutronix | gcc-8    | imx_v4_=
v5_defconfig          | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 4/5    =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200618/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200618
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ce2cc8efd7a40cbd17841add878cb691d0ce0bba =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre    | gcc-8    | sama5_d=
efconfig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeb07b7d71dff260497bf2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200618/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200618/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeb07b7d71dff260497b=
f2f
      failing since 50 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
da850-lcdk                   | arm   | lab-baylibre    | gcc-8    | davinci=
_all_defconfig        | 3/5    =


  Details:     https://kernelci.org/test/plan/id/5eeb00a667ed2b0cc397bf10

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200618/arm/=
davinci_all_defconfig/gcc-8/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200618/arm/=
davinci_all_defconfig/gcc-8/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5eeb00a667ed2b0=
cc397bf15
      failing since 1 day (last pass: next-20200614, first fail: next-20200=
616)
      33 lines =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
imx27-phytec-phycard-s-rdk   | arm   | lab-pengutronix | gcc-8    | imx_v4_=
v5_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeb06c3612b81b3b997bf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v4_v5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200618/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200618/arm/=
imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-r=
dk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeb06c3612b81b3b997b=
f11
      failing since 1 day (last pass: next-20200615, first fail: next-20200=
616) =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5eeb0a9b0a11c2454997bf27

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200618/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200618/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/arm64be/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5eeb0a9b0a11c24=
54997bf2c
      failing since 3 days (last pass: next-20200614, first fail: next-2020=
0615)
      2 lines =



platform                     | arch  | lab             | compiler | defconf=
ig                    | results
-----------------------------+-------+-----------------+----------+--------=
----------------------+--------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5eeb0009c68f4e9ba797bf10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200618/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200618/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2019=
.02-11-g17e793fa4728/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5eeb0009c68f4e9ba797b=
f11
      failing since 1 day (last pass: next-20200615, first fail: next-20200=
616) =20
