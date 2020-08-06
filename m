Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6747023E434
	for <lists+linux-next@lfdr.de>; Fri,  7 Aug 2020 00:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgHFW7a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 18:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgHFW73 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2020 18:59:29 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67667C061574
        for <linux-next@vger.kernel.org>; Thu,  6 Aug 2020 15:59:29 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id g19so157324plq.0
        for <linux-next@vger.kernel.org>; Thu, 06 Aug 2020 15:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MuiUrZV+WfQ2SXFeW/guP1TKU22sHhBlhjiIS7ky32M=;
        b=GrYhLgP+380NzVZOjyo9oad/Usm57qK5dYRJwAEElAT31tCCxnGaG8FaVuT1awWSEr
         95ouuL3bPblPqaBLZcQ9lnK9ecFEJ+Sct1con+xPFpPSURGBL1rHHYov/B4Nd2sqJrPa
         cXJISbf5mKT157+bikL2Zy2Zld6v+4et90QfuXiaXYvxwAgZ60uOd3f6rPzAbbQTd1Wm
         XU8ZnylbVNbF7C2bYCx5hR8CBHFGyqXoOPw1Xk4OkvIq23NdEHDRwgFwrKHW9jvgG75o
         4WoOwthXH5BJTLt+QzAdvKC8xynBiJMti/XwBY+XBUgR449QRfxJMwlA9qed4FTVPoMh
         ls9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MuiUrZV+WfQ2SXFeW/guP1TKU22sHhBlhjiIS7ky32M=;
        b=FJoiJJU0GBypYAB6mXY/LMBwHKtaq/i11jdjxIdI2yTvS6M/MoBGhkA3DeHEm/lsyp
         EJaZMxHz3/874uM+3avHdK9c0PJABTXfAqlrAZq64ZJ5h9E32FlVfKgVXmWnHJSK4VsF
         F1Ec6qQDF1NRP5oQb81GzmKyORTWDlmNXNEM8uhub9rvrdX6c9tgJD54Id1qqrmkq8N4
         ooWuDtSlICD3wOFLwOD8FJBBOY5cYiwLGCNSLMj4cuohlEBpTPlDAv77T3UuF6igVaYg
         rvqPaTkjXrC1QP3Zu3+vk97VBPzJPmsRj9HjNOhjpDgT7aKmiIupHFabCnPD1xV1SVIS
         c62Q==
X-Gm-Message-State: AOAM531MEycPOYT6lYM4ykfwAJYoWytSR7ZtslkThgie3PiuXXAVtB+q
        WRU7uguAQVu9mWG6ldQrOxGkbvg+iW0=
X-Google-Smtp-Source: ABdhPJwd5OY/G2QVh6FKKsiXOy095cyLc5tEbbzxFtzzTqLmdaxYIT+AfiMhkreiZ3KNXJjILNhJAQ==
X-Received: by 2002:a17:90a:bc45:: with SMTP id t5mr10466751pjv.139.1596754768167;
        Thu, 06 Aug 2020 15:59:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t19sm9849762pfq.179.2020.08.06.15.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 15:59:27 -0700 (PDT)
Message-ID: <5f2c8b4f.1c69fb81.3c879.7b47@mx.google.com>
Date:   Thu, 06 Aug 2020 15:59:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-4809-g03280255a294
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 104 runs,
 6 regressions (v5.8-4809-g03280255a294)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 104 runs, 6 regressions (v5.8-4809-g03280255a2=
94)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | exynos_defconfig =
            | 0/1    =

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =

omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =

omap4-panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-4809-g03280255a294/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-4809-g03280255a294
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      03280255a29457ea550aeffac7fcca8516baf067 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2c535d96a28f1ad952c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2c535d96a28f1ad952c=
1a7
      failing since 93 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | exynos_defconfig =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2c555c710ed2337752c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2c555c710ed2337752c=
1ad
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2c5b1dc5adb0991a52c1a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422=
-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422=
-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2c5b1dc5adb0991a52c=
1a9
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2c5db3f19f1fa7ea52c1c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2c5db3f19f1fa7ea52c=
1c5
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2c560f31440a450f52c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pand=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pand=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2c560f31440a4=
50f52c1aa
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35)
      60 lines =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2c55a352af1fe43352c1b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-4809-g=
03280255a294/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2c55a352af1fe43352c=
1b5
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =20
