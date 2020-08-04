Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7B823BEBC
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 19:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729510AbgHDRSK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 13:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbgHDRSJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 13:18:09 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97392C06174A
        for <linux-next@vger.kernel.org>; Tue,  4 Aug 2020 10:18:09 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l60so2679716pjb.3
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2020 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ndoD9ZLjdEoLAwVZFpcPGqvMvQzYrMhQegMrAX3kxUM=;
        b=xaTUYo47kbtgKlZELPWpOfYCvq0Xl85/TF+Tz1bgtfHgOkRY0LQBv3ddp0CSJFfTNS
         de97b8gz/QDnW61VymWXVK2l1a++BGSvzYLW8jvw26d6gel+ex/1OR3tminwa37o5YYd
         qERsKxWGB5jnb6u89UjkVPDjdN3vBecBL7WO0JysIX0oWJin7tMpmbGQaMV8XYdHY2vm
         3cF7wtDLA42m7XW6Ax9di5x02cj6/fMJH0hbQDRMDXJIEz9zq5s3UcRBwXWcVSv9tpUA
         JBIb5rmJs7fcy0rzUbyyrolOWCV30gnSss4x1YeYSWpezN3GX7eKFcUwPtFefW4cwB5a
         kvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ndoD9ZLjdEoLAwVZFpcPGqvMvQzYrMhQegMrAX3kxUM=;
        b=umvDTb51qU/JQLxYFqu2tSNkgum8BQIIgh3VFEjLwolI+t7QX9JJ6t5aH5yNhCTQ0k
         3ANPuAKAOi7PLGeQLZmCEMRP4Rj/RMP2pc6uMMe0RAFoodUQJo6wFCzVhco0U5PcZyhn
         J+BxLdvQlam44wFh46Z3KwMAedDbIg9VWRWT8qk+MbxkzW9r2tfatyuurNnqrUJrK9yZ
         0VpH6akKtuC8sDNTo9K3EUK36Y7pPSex7lnKyREbKibtHNBPMI9L5ijqxQV8vGmzJdiE
         8ybWKj3UMspECnxVuTLFx1p+C3uA2oeaAwJxD+skq34BxkimODfMJEbH1qYLDmEa5vuy
         G6kQ==
X-Gm-Message-State: AOAM531t/2IJUkAKwqVKCl7XxZDbHadfXmZb2C1y3pFqOld4FUr6px0X
        q+Yq6IyHIWouzr3N9ztANeLRZRKQfOI=
X-Google-Smtp-Source: ABdhPJw8nuxYsYVYXC7eKXZitNRSPuwKeNLR7mgo/1tP3zTGsRbjg/kj5vOhUI6Nj/8GbtJ7K0dwvA==
X-Received: by 2002:a17:902:768b:: with SMTP id m11mr18952423pll.97.1596561488346;
        Tue, 04 Aug 2020 10:18:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n13sm3419406pjb.20.2020.08.04.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 10:18:07 -0700 (PDT)
Message-ID: <5f29984f.1c69fb81.da903.807b@mx.google.com>
Date:   Tue, 04 Aug 2020 10:18:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200804
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 365 runs, 21 regressions (next-20200804)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 365 runs, 21 regressions (next-20200804)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 4/5    =

exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | exynos_defconf=
ig             | 0/1    =

exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 0/1    =

exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 0/1    =

mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig     =
               | 0/1    =

mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =

mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 0/1    =

rk3399-gru-kevin        | arm64 | lab-collabora | clang-10 | defconfig     =
               | 84/88  =

rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 84/88  =

rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 84/88  =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig     =
               | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =

sun7i-a20-cubieboard2   | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 0/1    =

sun7i-a20-cubieboard2   | arm   | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2   | arm   | lab-clabbe    | gcc-8    | multi_v7_defco=
nfig           | 0/1    =

sun7i-a20-cubieboard2   | arm   | lab-clabbe    | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2   | arm   | lab-baylibre  | gcc-8    | sunxi_defconfi=
g              | 0/1    =

sun7i-a20-cubieboard2   | arm   | lab-clabbe    | gcc-8    | sunxi_defconfi=
g              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200804/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200804
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1cfc1dba44c2b62b2856bf23624116eea9cd5627 =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295e1e8945ed5f9652c1b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295e1e8945ed5f9652c=
1b2
      failing since 98 days (last pass: next-20200424, first fail: next-202=
00428) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f295c4a81084d7e6f52c1d3

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f295c4b81084d7e=
6f52c1d6
      failing since 0 day (last pass: next-20200731, first fail: next-20200=
803)
      1 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | exynos_defconf=
ig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295e3ba0be23c97652c1d2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295e3ba0be23c97652c=
1d3
      failing since 13 days (last pass: next-20200630, first fail: next-202=
00721) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f296589df38321b1852c1aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f296589df38321b1852c=
1ab
      failing since 10 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2966d3fc5d2d5f6352c1b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2966d3fc5d2d5f6352c=
1b6
      failing since 10 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
exynos5422-odroidxu3    | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2968104a463fadeb52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2968104a463fadeb52c=
1a7
      failing since 10 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
mt8173-elm-hana         | arm64 | lab-collabora | clang-10 | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2962427e1ac9d3c452c1b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2962427e1ac9d3c452c=
1b3
      failing since 10 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295cca5bd532f94c52c1d4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-mt8173-e=
lm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295cca5bd532f94c52c=
1d5
      failing since 7 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
mt8173-elm-hana         | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295e138945ed5f9652c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295e138945ed5f9652c=
1a7
      failing since 7 days (last pass: next-20200724, first fail: next-2020=
0727) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
rk3399-gru-kevin        | arm64 | lab-collabora | clang-10 | defconfig     =
               | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f2961b00a1b79794852c1c8

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f2961b00a1b79794852c208
      failing since 5 days (last pass: next-20200728, first fail: next-2020=
0729) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f295bfe3d807742e752c1fe

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f295bfe3d807742e752c23e
      failing since 5 days (last pass: next-20200728, first fail: next-2020=
0729) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
rk3399-gru-kevin        | arm64 | lab-collabora | gcc-8    | defconfig     =
               | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f295c3c7e118f9fea52c1c3

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f295c3d7e118f9fea52c203
      failing since 3 days (last pass: next-20200728, first fail: next-2020=
0731) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | clang-10 | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2962903ca81b554b52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2962903ca81b554b52c=
1a7
      failing since 3 days (last pass: next-20200729, first fail: next-2020=
0731) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295cc95bd532f94c52c1ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295cc95bd532f94c52c=
1cf
      failing since 0 day (last pass: next-20200731, first fail: next-20200=
803) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295e198945ed5f9652c1ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295e198945ed5f9652c=
1af
      failing since 0 day (last pass: next-20200731, first fail: next-20200=
803) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun7i-a20-cubieboard2   | arm   | lab-baylibre  | gcc-8    | multi_v7_defco=
nfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295f4e9d6e5a9a7852c1c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295f4e9d6e5a9a7852c=
1c3
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun7i-a20-cubieboard2   | arm   | lab-baylibre  | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f29615935c39b1f0152c1c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f29615935c39b1f0152c=
1c4
      failing since 17 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun7i-a20-cubieboard2   | arm   | lab-clabbe    | gcc-8    | multi_v7_defco=
nfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295f4a5b9cfc985452c1c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295f4a5b9cfc985452c=
1c4
      failing since 17 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun7i-a20-cubieboard2   | arm   | lab-clabbe    | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f296159e995b13e0c52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f296159e995b13e0c52c=
1a7
      failing since 17 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun7i-a20-cubieboard2   | arm   | lab-baylibre  | gcc-8    | sunxi_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295ae0a5f24b4f9d52c1bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295ae0a5f24b4f9d52c=
1be
      failing since 14 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun7i-a20-cubieboard2   | arm   | lab-clabbe    | gcc-8    | sunxi_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f295ae7ac204bc23552c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200804/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200804/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f295ae7ac204bc23552c=
1a7
      failing since 14 days (last pass: next-20200717, first fail: next-202=
00720) =20
