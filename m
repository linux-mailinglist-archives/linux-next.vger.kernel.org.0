Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34B62401C8
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 07:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgHJFro (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Aug 2020 01:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJFrn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2020 01:47:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF2AC061756
        for <linux-next@vger.kernel.org>; Sun,  9 Aug 2020 22:47:43 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 2so4186312pjx.5
        for <linux-next@vger.kernel.org>; Sun, 09 Aug 2020 22:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=FNx0/WRX7TYmruAZt1A+1+QxacUGXmKgZ/I8IF0iQ8k=;
        b=CVrH1YO8Fur9WDvDbd6c26xy6N4AmLRsO3T70DBfRJNZaA93+ZQ0Wxhf1XDNdR8e1k
         MHhhzCtupOxfbvrm2TVdNV2eZIxUMQaxDRxDJ1O1eygcM5UYxUft91cEVAEArrPyZ9Hb
         eUdoNI78/d7qJFx9qf/HwFmdW+KY2MsJq3hPnJQm5XHdxTTV5+kGm9aYD0sfzQ0N1uDE
         Wx+HaXc99FLc5hFhtyM4F6rxa6xPJR0gd36xfnl5eza199TT2553h8y5KKi+MYx3/JP6
         nf7tRyI9zT/c55j3+RoOYXriHZ2tPRl7yGTE7miBmaWPuWKdGXhL2MSZiSillqB+bIy2
         29IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=FNx0/WRX7TYmruAZt1A+1+QxacUGXmKgZ/I8IF0iQ8k=;
        b=RufqXEKAmSYqIznsWFWBXlkTQ+SUkX+e/UiNKu/2TtqhIoOIMNM2vN/nWBpJnYt1CC
         i9t70V3pXck7IEk/J04DzuGY1cdlNLuHxGo6ckXWSzrec1ZYDF0MPv3HEhki1CUHYKpT
         +ViR13umtkUTVtYKmU5OMtE5+eRf9s616y9oZMY6cq6+pV77x8pCar55GB1EYTSitSke
         MzXlKbR68bwMO0v3kBXk48kUzBgaWEzMAUTCJqi4Wnh9zk8v3I6/LqR3mLAzvXc6zfrS
         kVK9w50BjKPyfH+wr5vzxQhNBqC1crrM8q+jV8Wra01q4yYXlYg1Xi928DeRP/YzBS4V
         DEdg==
X-Gm-Message-State: AOAM531af5KJS+jZmrbHr5scUy4l+BJl1fPbEeAunyH8SPtQ09D8OtCB
        d8+Fp/k9sAo+aghrs3uDM+oNGepQrDs=
X-Google-Smtp-Source: ABdhPJwqTpjpZEhLFCpl6OIbYy5V4sFO06YL10CEU5YZmdf/U9yPdcZ9pn6u+P+gY6PsV0pDb2SEdQ==
X-Received: by 2002:a17:90a:a511:: with SMTP id a17mr25918211pjq.23.1597038461812;
        Sun, 09 Aug 2020 22:47:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u29sm23103066pfl.180.2020.08.09.22.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 22:47:41 -0700 (PDT)
Message-ID: <5f30df7d.1c69fb81.5b565.d336@mx.google.com>
Date:   Sun, 09 Aug 2020 22:47:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-12062-g26dee840e516
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 224 runs,
 13 regressions (v5.8-12062-g26dee840e516)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 224 runs, 13 regressions (v5.8-12062-g26dee840=
e516)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 4/5    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =

exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =

mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =

mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-12062-g26dee840e516/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-12062-g26dee840e516
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      26dee840e516ea716ea4f327f8aa3c35596c6e67 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30a904c0ea7767ec52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30a904c0ea7767ec52c=
1a7
      failing since 96 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f30a6f985dc65dd9552c1c6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f30a6f985dc65dd=
9552c1c9
      failing since 5 days (last pass: v5.8-54-gefd7bdec601b, first fail: v=
5.8-1558-g0359180fcb42)
      2 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30aad74adb6ee85552c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-=
odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-=
odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30aad74adb6ee85552c=
1ad
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30a9931603349e3e52c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30a9931603349e3e52c=
1b0
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30afe77ca8bbf7d252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30afe77ca8bbf7d252c=
1a7
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30b33412cd0e420852c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30b33412cd0e420852c=
1a7
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30a7ae4e1649c3fe52c2ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30a7ae4e1649c3fe52c=
2ac
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30a900fcaceba35c52c1e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30a900fcaceba35c52c=
1e2
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f30a8d68f2c91f33852c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f30a8d68f2c91f=
33852c1aa
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f30aa9c8bb0d8121652c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f30aa9c8bb0d81=
21652c1aa
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f30aa1a3f678e3cf552c1c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f30aa1a3f678e3cf552c=
1c3
      failing since 4 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f30a6d5d5fb198cd652c1ae

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f30a6d5d5fb198cd652c1ee
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f30a79e6f4e8ce5d852c1c3

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12062-=
g26dee840e516/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f30a79e6f4e8ce5d852c203
      new failure (last pass: v5.8-1558-g0359180fcb42) =20
