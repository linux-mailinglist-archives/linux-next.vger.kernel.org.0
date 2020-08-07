Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4F423E67B
	for <lists+linux-next@lfdr.de>; Fri,  7 Aug 2020 06:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725265AbgHGEB7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 7 Aug 2020 00:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgHGEB7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2020 00:01:59 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9E3C061574
        for <linux-next@vger.kernel.org>; Thu,  6 Aug 2020 21:01:58 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v15so189129pgh.6
        for <linux-next@vger.kernel.org>; Thu, 06 Aug 2020 21:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yyjoUkm+tSu5v5NcUngvgnmp+OesfLoboKtpq8ZotJ4=;
        b=zxoXu40KlZVMlPBhm0zDLjGKuVeE/a95JtfryjSdvAahfGqE9yuWzVrj8AybfnGGUd
         E1xphjPD9VG5oVwNCFnRg0US89O+bFtzJ1P02SrYqEN3VJPG+30NESSZPWVLUfqevSF7
         qab8ojcijtY790jPJ2hCcYu81Ha282FQbFNLb/DPvPwkgeL8rIZiZ2EJXifSXq0LR+hL
         JA92FL+TZDWCVQdvwFiEjIo/Q7VO0OLjZThg2oMus5DJw+3p4B7XXzErbjyhMwoRohF3
         xxHiry3LGT1qPxJFQ1xSxqDm9ZOIqFwXxhJubM6irLm7/t6WZI1O5dhK96HuqP6Fz0d3
         nARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yyjoUkm+tSu5v5NcUngvgnmp+OesfLoboKtpq8ZotJ4=;
        b=a11JVjhT4kizVtNNZ46AqeKGOrt4Ruey5N0RvCvfj4Ckj8Jjk1qLwEQ0/IY9gn70rc
         Fx2tEtwe5wUPTw7YshAAkNKjwVGcYQer4giqX/o7JuIaUjnqefp86OeNwajbQ2vH6GhR
         6E0brkV7nZ6vWU65EeZAGMQlkFIDtDyslnkVkBrFqcKwVwL69rhBOpR72XPFXBT+GyyT
         dHpwAXlvYgWYDOBuHMS+Ddeczd/Uvq0DaSoFhYVPymONNYIMKzV5I8fpxvxwJ0Ate010
         Jl3G9JddDqNqWgk7HzcrzmdGX8HT1iXywfU2MCkLrANpC/WOoeCqW4IkwNTZfeBaZSXK
         08AQ==
X-Gm-Message-State: AOAM532vROv+n2XULAtNJ8WmOxF0moXjOATJ5JP1Xi6cD4KvSZO57V5x
        JSC9dD0NXhmTaF6PbJusMrfKyi7YMkE=
X-Google-Smtp-Source: ABdhPJznAktsVZyQ7PFt/KoYrbG4F8ndTfgyKugj1jcXDAFn0BKSn0xICwGuS72BI/0CXlv5BzRhEQ==
X-Received: by 2002:a63:c252:: with SMTP id l18mr5404006pgg.349.1596772917495;
        Thu, 06 Aug 2020 21:01:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a2sm11515420pfh.152.2020.08.06.21.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 21:01:56 -0700 (PDT)
Message-ID: <5f2cd234.1c69fb81.31ec0.cb15@mx.google.com>
Date:   Thu, 06 Aug 2020 21:01:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-9748-gd352d5e191c4
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 165 runs,
 8 regressions (v5.8-9748-gd352d5e191c4)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 165 runs, 8 regressions (v5.8-9748-gd352d5e191=
c4)

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

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =

omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-9748-gd352d5e191c4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-9748-gd352d5e191c4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      d352d5e191c41fa958cfe48960778f23bf3fbae4 =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2c9d285d88a2f30a52c1ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2c9d285d88a2f30a52c=
1ae
      failing since 93 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | exynos_defconfig =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2ca7bb6821dda61552c1ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2ca7bb6821dda61552c=
1ae
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2cab1c0379fc8b8a52c1c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422=
-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422=
-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2cab1c0379fc8b8a52c=
1ca
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2cada6cc8bc4040552c1af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2cada6cc8bc4040552c=
1b0
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2cb5404603a52f5152c1bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2cb5404603a52f5152c=
1bc
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2c9eba26cf91847552c1b3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pand=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pand=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2c9eba26cf918=
47552c1b7
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35)
      60 lines =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2ca17100c6ea722752c1d2

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2ca17100c6ea7=
22752c1d6
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35)
      60 lines =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2c9ffa7050d5146252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-9748-g=
d352d5e191c4/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2c9ffa7050d5146252c=
1a7
      failing since 1 day (last pass: v5.8-1558-g0359180fcb42, first fail: =
v5.8-3221-g983112062f35) =20
