Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5521241AB1
	for <lists+linux-next@lfdr.de>; Tue, 11 Aug 2020 13:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgHKL5U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Aug 2020 07:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728469AbgHKL5U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Aug 2020 07:57:20 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D90CC06174A
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2020 04:57:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id mw10so1761221pjb.2
        for <linux-next@vger.kernel.org>; Tue, 11 Aug 2020 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=OyjgbwNAqjF3wNsHyZU+JMWgcIOIgWs2H+X4eOitHmM=;
        b=R2+OxbcBaiJkdT4hwtJIxL5OHcQgNV9w3gSkgHCazuUZhYSk4o9Yhk3KkVHhHLcYCs
         L+o7dcwn+S6oyQPQnNtEisXBu/MSGdywX7FPojdPPAdsyoZRik1cgQuDjZk2UMdXVLIK
         3RnRxmWBZ79KKIat9jR33CQpWzjemWUuRjdauNSa8bM7WiB3UKYFVf174EUnmnwLv7pv
         pWoaDlHxpdpXjSKetGWAPveuJebmBdIlM2t1VkU1LAeysYqh6OfjlRhu+L2PuuWihwG5
         a9NPqPpRiDlWogjNoDpi2U51/6k/SpJNYtIQXKHd3kaEc52C/UFTuqgva053TXFXfEto
         N1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=OyjgbwNAqjF3wNsHyZU+JMWgcIOIgWs2H+X4eOitHmM=;
        b=eEjO8HYl2gVO8rr+irX/LSbVvFozWq1XolnX1kzMNARFnvjvRtUdVe/Z7zAd+8Es4j
         zxgQgUoOJUMNrbK09yWe3y5brgyBsSrrJgGg4jbSmJfAmpmOOz75zdlchstsYtGTGK5i
         380krKhT7NCvvf0iM02zkgkNd1iAYx2Kw7hjtfFdTcyQfxecS+ZzS1/cgQlDip9wIxUZ
         KTYfjQTxHA3JxY19UrNLkexzAJpPY5pisGhtQ89y7fccctZ3wwdw5IFlKmo3LzZbozAl
         CYNt5h3Sdboc5NSljdrQucH5nuvvA6ToUy/Y8zgrLyhQycXyyudc3GyCUqve3ZG0D+bz
         lrqw==
X-Gm-Message-State: AOAM531lvBxOkW7tQR3czbx1XxM2PqYmgEYucp6VpijfIr3umEQwJl0X
        2XLrXUnKfjNxLCqmQGxglPKCaVut9sc=
X-Google-Smtp-Source: ABdhPJzJHYt6onaQam8EYpj9N2FmkwsfNhwLLofj2bWNfh97yymPgoRJ8KIa5H7OeMZIFUleJyH0Sw==
X-Received: by 2002:a17:902:d206:: with SMTP id t6mr544637ply.131.1597147037460;
        Tue, 11 Aug 2020 04:57:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u1sm7139638pgf.69.2020.08.11.04.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 04:57:16 -0700 (PDT)
Message-ID: <5f32879c.1c69fb81.408e6.c0a1@mx.google.com>
Date:   Tue, 11 Aug 2020 04:57:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-12146-gc063c7b30ed0
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 294 runs,
 15 regressions (v5.8-12146-gc063c7b30ed0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 294 runs, 15 regressions (v5.8-12146-gc063c7b3=
0ed0)

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

omap4-panda           | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 4/5    =

omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =

rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-12146-gc063c7b30ed0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-12146-gc063c7b30ed0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c063c7b30ed0fc4824bcde48afa5902e1e5b13d3 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
at91-sama5d4_xplained | arm   | lab-baylibre  | gcc-8    | sama5_defconfig =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f324de474a782a07e52c1ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_=
xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f324de474a782a07e52c=
1af
      failing since 98 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig       =
             | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f324db0e0aedba97752c1ad

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f324db0e0aedba9=
7752c1b0
      failing since 7 days (last pass: v5.8-54-gefd7bdec601b, first fail: v=
5.8-1558-g0359180fcb42)
      2 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | exynos_defconfig=
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3255135f49047fbe52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-=
odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-=
odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3255135f49047fbe52c=
1a8
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f32564dec90b53a1c52c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f32564dec90b53a1c52c=
1a8
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defconf=
ig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f32599cea1ed602e452c1a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f32599cea1ed602e452c=
1a8
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
exynos5422-odroidxu3  | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f325d6aa2f1c3f91152c1c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc=
-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f325d6aa2f1c3f91152c=
1c6
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f324e74b3924c888152c1ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f324e74b3924c888152c=
1af
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-12062-g26dee840e516) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
mt8173-elm-hana       | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f324fb2158a0bf99f52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f324fb2158a0bf99f52c=
1a7
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-12062-g26dee840e516) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-baylibre  | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3250868aba45774452c1cf

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3250868aba457=
74452c1d3
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-baylibre  | gcc-8    | multi_v7_defconf=
ig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f325265ed01af269352c1bf

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pand=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pand=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f325265ed01af2=
69352c1c3
      new failure (last pass: v5.8-rc7-210-gb684091a3d8c)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f32505f2827e6596752c1e5

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/bas=
eline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f32505f2827e65=
96752c1e9
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35)
      60 lines =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-baylibre  | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3251e5a54005e44152c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3251e5a54005e44152c=
1a7
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
omap4-panda           | arm   | lab-collabora | gcc-8    | omap2plus_defcon=
fig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f32519df0f265b48752c1d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f32519df0f265b48752c=
1d6
      failing since 6 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-3221-g983112062f35) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig       =
             | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f324d9d3f5a60b6f152c1ee

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f324d9d3f5a60b6f152c22e
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-12062-g26dee840e516) =



platform              | arch  | lab           | compiler | defconfig       =
             | results
----------------------+-------+---------------+----------+-----------------=
-------------+--------
rk3399-gru-kevin      | arm64 | lab-collabora | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f324e2cdd8fd8744852c1a6

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-12146-=
gc063c7b30ed0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora=
/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f324e2cdd8fd8744852c1e6
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-12062-g26dee840e516) =20
