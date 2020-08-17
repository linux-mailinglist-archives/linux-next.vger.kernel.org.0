Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B952468BA
	for <lists+linux-next@lfdr.de>; Mon, 17 Aug 2020 16:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgHQOvi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Aug 2020 10:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgHQOvg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Aug 2020 10:51:36 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED174C061389
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2020 07:51:35 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id mt12so7937928pjb.4
        for <linux-next@vger.kernel.org>; Mon, 17 Aug 2020 07:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5dkMHJf0QxZ9WOYkGtBHUr9/vVc7i+uOzfCE+mf1gu8=;
        b=wkeo3BT1uh5lJp4ZtafuZ1rUNwtv+UNbeFmONLap/BfaKgDqhJMVffzymBKgMFLugl
         xiFzjy17IdKWOLKZptaPCiLF8vEKKx4T6gU6V6Ahud/vzdpRWz6d0oi7DfAdopjaGJyA
         Qo63M9ypxrw0Q1j9MZtw/zOMDuBE1wIpZRiQHrgNfE9rQOmoYo4jdmoi4qdv7FP/dVPB
         KJJMAwDYniTu9SVcacm4m16zpKB2GOjmFkpSJU/zEnZZ8xSBaSP+FMu3WEJCs4t6+wBp
         2L1hIT8fRWvoiWKrxBjObqtcSY4npPs3xbXPTHqVaWUwMF9JdvArB2nMu4oIYf/0duUF
         etLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5dkMHJf0QxZ9WOYkGtBHUr9/vVc7i+uOzfCE+mf1gu8=;
        b=oHkm5Eet8jjpMq+sZvKBijeoaOv9SkgZRbnMjsd3OWlP3/m5PDaWtVzRG2vDDrCIVD
         r3Jkm5fIKDUgppSWl5ZpeOGkL1YOv4J2KcNO5hv0PsAXXSUjAPGwLp1VPNMyz1bdJYQs
         VhC3XvmsVJzV4OUpBFlIZSZ/vDC0MD9xyCpZjBZ3crAJtnogKxBxnkYJXcj39/ofVb+L
         2y20/m209pGgNgj/TXsBX5iVq+Tfrl4rOKi1LNsjWGJlLtRc/bUFDH6I7HhkqXW4/eAt
         UrY8hIru2zz+LY/odxYYUYO24WJOd2QN6qbrtRzRGtHOM0tlUeL4jwtTx5sGG32Cfq1z
         daVA==
X-Gm-Message-State: AOAM531S+sjscnN3SqU3eZXDS6W0WEZOj+TIV8rBwAOyGexdmtnPgJwh
        F2IemXpVNqsjuufyd7OVj6YNKPVVoPsPzg==
X-Google-Smtp-Source: ABdhPJwxRrUQpbY2ksgcG8haYu+G11gzRskhB7vtQRxep3v1AXaPBDzfGVm5bnWkXmoCIeOnvQ1dag==
X-Received: by 2002:a17:90a:cb08:: with SMTP id z8mr12832816pjt.41.1597675890640;
        Mon, 17 Aug 2020 07:51:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 202sm20170855pfy.6.2020.08.17.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 07:51:29 -0700 (PDT)
Message-ID: <5f3a9971.1c69fb81.a1179.1ad6@mx.google.com>
Date:   Mon, 17 Aug 2020 07:51:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.9-rc1-137-ga49f4f3ccd1d
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 317 runs,
 23 regressions (v5.9-rc1-137-ga49f4f3ccd1d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 317 runs, 23 regressions (v5.9-rc1-137-ga49f4f=
3ccd1d)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained  | arm   | lab-baylibre  | gcc-8    | sama5_defconfig=
              | 0/1    =

exynos5422-odroidxu3   | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3   | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
              | 0/1    =

mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =

omap4-panda            | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig           | 4/5    =

omap4-panda            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 4/5    =

omap4-panda            | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig           | 4/5    =

omap4-panda            | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 4/5    =

omap4-panda            | arm   | lab-baylibre  | gcc-8    | omap2plus_defco=
nfig          | 0/1    =

omap4-panda            | arm   | lab-collabora | gcc-8    | omap2plus_defco=
nfig          | 0/1    =

rk3288-veyron-jaq      | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 68/69  =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
              | 84/88  =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 84/88  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
              | 0/1    =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig           | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-clabbe    | gcc-8    | multi_v7_defcon=
fig           | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-clabbe    | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig=
              | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-clabbe    | gcc-8    | sunxi_defconfig=
              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc1-137-ga49f4f3ccd1d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc1-137-ga49f4f3ccd1d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      a49f4f3ccd1d25f1a7ef96cadef5a2b070f225ad =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
at91-sama5d4_xplained  | arm   | lab-baylibre  | gcc-8    | sama5_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a66b881f75e0d17d99a5f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a66b881f75e0d17d99=
a60
      failing since 104 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
exynos5422-odroidxu3   | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6d427fc1ed4089d99a40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6d427fc1ed4089d99=
a41
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
exynos5422-odroidxu3   | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6e82834a11ed52d99a3c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6e82834a11ed52d99=
a3d
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a65e2e672eb0b18d99a3f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a65e2e672eb0b18d99=
a40
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6655b04ef6a497d99a6b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6655b04ef6a497d99=
a6c
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
omap4-panda            | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a662420578d2ab9d99a3e

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a662420578d2=
ab9d99a42
      failing since 6 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-17 11:12:26.790000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-17 11:12:26.796000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-17 11:12:26.799000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-17 11:12:26.805000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-17 11:12:26.810000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-17 11:12:26.816000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-17 11:12:26.825000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-17 11:12:26.831000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-17 11:12:26.836000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-17 11:12:26.840000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (52 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
omap4-panda            | arm   | lab-baylibre  | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a6a0957fcb5189dd99a51

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a6a0957fcb51=
89dd99a55
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-17 11:29:03.879000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-17 11:29:03.885000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-17 11:29:03.892000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-17 11:29:03.896000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-17 11:29:03.902000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-17 11:29:03.907000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-17 11:29:03.909000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-17 11:29:03.915000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-17 11:29:03.920000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-17 11:29:03.930000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
omap4-panda            | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a64f3f9bd55d11ed99a79

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a64f3f9bd55d=
11ed99a7d
      failing since 6 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-17 11:07:25.243000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-17 11:07:25.249000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-17 11:07:25.255000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-17 11:07:25.261000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-17 11:07:25.266000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-17 11:07:25.272000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-17 11:07:25.278000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-17 11:07:25.284000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-17 11:07:25.290000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-17 11:07:25.296000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
omap4-panda            | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3a68c3f5f020087dd99a3a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3a68c3f5f0200=
87dd99a3e
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-17 11:23:42.533000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-17 11:23:42.539000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-17 11:23:42.545000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-17 11:23:42.551000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-17 11:23:42.556000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-17 11:23:42.562000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-17 11:23:42.568000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-17 11:23:42.574000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-17 11:23:42.579000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-17 11:23:42.585000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
omap4-panda            | arm   | lab-baylibre  | gcc-8    | omap2plus_defco=
nfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a697428dfeaf000d99a46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a697428dfeaf000d99=
a47
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
omap4-panda            | arm   | lab-collabora | gcc-8    | omap2plus_defco=
nfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6648b63747ab8fd99a5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6648b63747ab8fd99=
a5b
      failing since 12 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
rk3288-veyron-jaq      | arm   | lab-collabora | gcc-8    | multi_v7_defc..=
.G_ARM_LPAE=3Dy | 68/69  =


  Details:     https://kernelci.org/test/plan/id/5f3a82b77a0f117b6ed99a39

  Results:     68 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
5f3a82b77a0f117b6ed99a46
      new failure (last pass: v5.8-13251-g8d2ac1ce7b76)

    2020-08-17 13:14:26.643000  /lava-2548411/1/../bin/lava-test-case
    2020-08-17 13:14:26.667000  <8>[   18.084730] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>
      =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
              | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3a63f98dea93371cd99a43

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3a63fa8dea93371cd99a83
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)

    2020-08-17 11:03:16.846000  <8>[   52.461895] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-driver-present RESULT=3Dpass>
    2020-08-17 11:03:17.868000  /lava-2548305/1/../bin/lava-test-case
      =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3a6554a562140cead99a8f

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3a6555a562140cead99acf
      failing since 7 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)

    2020-08-17 11:09:05.032000  /lava-2548329/1/../bin/lava-test-case
    2020-08-17 11:09:05.044000  <8>[   53.464833] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a7a220ad42a8e2ed99a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a7a220ad42a8e2ed99=
a44
      new failure (last pass: v5.8-13316-g31a0e28a656f)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a7baada056b13a2d99a5a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a7baada056b13a2d99=
a5b
      new failure (last pass: v5.8-13316-g31a0e28a656f)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a7e1cce75f98e33d99a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a7e1cce75f98e33d99=
a44
      new failure (last pass: v5.8-13316-g31a0e28a656f)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6664e61574596cd99a51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6664e61574596cd99=
a52
      new failure (last pass: v5.8-13316-g31a0e28a656f)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a696628dfeaf000d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a696628dfeaf000d99=
a3a
      new failure (last pass: v5.8-13316-g31a0e28a656f)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun7i-a20-cubieboard2  | arm   | lab-clabbe    | gcc-8    | multi_v7_defcon=
fig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a666dd1f1dc5bf1d99a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-=
cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a666dd1f1dc5bf1d99=
a44
      new failure (last pass: v5.8-13316-g31a0e28a656f)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun7i-a20-cubieboard2  | arm   | lab-clabbe    | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a6a1957fcb5189dd99a76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/base=
line-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/base=
line-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a6a1957fcb5189dd99=
a77
      new failure (last pass: v5.8-13316-g31a0e28a656f)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | sunxi_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a632f8cc518883cd99a49

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a632f8cc518883cd99=
a4a
      new failure (last pass: v5.8-13251-g8d2ac1ce7b76)  =



platform               | arch  | lab           | compiler | defconfig      =
              | results
-----------------------+-------+---------------+----------+----------------=
--------------+--------
sun7i-a20-cubieboard2  | arm   | lab-clabbe    | gcc-8    | sunxi_defconfig=
              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3a62bd473b73bad6d99a57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-13=
7-ga49f4f3ccd1d/arm/sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3a62bd473b73bad6d99=
a58
      new failure (last pass: v5.8-13251-g8d2ac1ce7b76)  =20
