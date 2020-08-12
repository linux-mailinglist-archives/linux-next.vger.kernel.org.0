Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5EC242734
	for <lists+linux-next@lfdr.de>; Wed, 12 Aug 2020 11:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgHLJKS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Aug 2020 05:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgHLJKS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2020 05:10:18 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10F2C06174A
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2020 02:10:17 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id t10so802071plz.10
        for <linux-next@vger.kernel.org>; Wed, 12 Aug 2020 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nbnoAYyUqk/Q/OONSRl0N4nzdRvzbTWy8nCAUPEwXcg=;
        b=VhtJVGPC59LHO31UkYuonsQS8C5oWc4KHqOYu8W84IUeoaJsA2FM/fayXMxj294bk+
         YGRCUQscMYqCBni6aXbUNtHWjTsawT3n+AJZBK/+DPNIa4QRAKVqzFzgcvTUWKAsvmy6
         C6MeAipccRbJ0ksHv/sgju7syDiA9EPx18LN9aJNQyTHPNPoJ3CxBzM/QUGv9t2qKXfp
         mexKP9kcxS+/+81T8K+thZB4iqsea8P7z72cVbFU94kRjs/0oWoa6pNtuKbu2kZlKXWD
         btLWaVkRwU7F+2Je8SwFQZKPv/jRW3oJllQftV5QZ/CNc0p1xZok7At8m6qg+bH4q5ts
         P+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nbnoAYyUqk/Q/OONSRl0N4nzdRvzbTWy8nCAUPEwXcg=;
        b=SCiABExHr1arnOX34WHTcWnTy+KwX83htz3fjJ8gKpVQe7+cRLDUeICvL8MFe0Axm4
         j8zvh+o+VQIo68ooO9TD3qDU/yU+msuTHjgjtCOdqLy0dA3fqFicot7Kke1NINBbmyp4
         QwABQSzSkOuFYrXkU0RfSucKOEYDF3B4OoIewkpytt4669V+TRXjpPGjJwig1weiy/Uv
         n0vPXG6nkzAPefRGXH2DUyJ1n9zggZVQTFXd27jKUKaQMm1PDVYqlNf8vl84Mc0UN8wy
         /aAan1vgfGvJo3QfMQR7QA2p9CoBQfUQJTqatMkXxK1PVjCqPELJAi00zAZ0RFrxMGc6
         tYLw==
X-Gm-Message-State: AOAM532pdmh29E9hHxl5NrkXPyhWY6UGCGJqjQGZ6xaN5NAwnjSLWlKK
        m5/l1HrQPBFsRm5pzGV/cUpsOVxc62M=
X-Google-Smtp-Source: ABdhPJxzbgdQoegDuWmadUfBQG/mm0C5RkSXO2jaB5yhPcdQp/lMSQDfocx+0Lm+EainJRnlQhYOBQ==
X-Received: by 2002:a17:902:a70e:: with SMTP id w14mr4640178plq.259.1597223415639;
        Wed, 12 Aug 2020 02:10:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u21sm1493934pjn.27.2020.08.12.02.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 02:10:14 -0700 (PDT)
Message-ID: <5f33b1f6.1c69fb81.e405d.364f@mx.google.com>
Date:   Wed, 12 Aug 2020 02:10:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20200812
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 391 runs, 32 regressions (next-20200812)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 391 runs, 32 regressions (next-20200812)

Regressions Summary
-------------------

platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained       | arm    | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =

bcm2837-rpi-3-b             | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | exynos_de=
fconfig             | 0/1    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 0/1    =

exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 0/1    =

imx6q-var-dt6customboard    | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 4/5    =

omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =

omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 4/5    =

omap4-panda                 | arm    | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 0/1    =

omap4-panda                 | arm    | lab-collabora | gcc-8    | omap2plus=
_defconfig          | 0/1    =

qemu_x86_64-uefi-mixed      | x86_64 | lab-baylibre  | gcc-8    | x86_64_de=
fconfig             | 0/1    =

rk3399-gru-kevin            | arm64  | lab-collabora | clang-10 | defconfig=
                    | 84/88  =

rk3399-gru-kevin            | arm64  | lab-collabora | gcc-8    | defconfig=
                    | 84/88  =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =

sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =

sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =

sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...BIG_ENDIAN=3Dy | 0/1    =

sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
200812/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20200812
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      bc09acc9f224c0923794b69534c9bfa999c27b64 =



Test Regressions
---------------- =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
at91-sama5d4_xplained       | arm    | lab-baylibre  | gcc-8    | sama5_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337db45488a4fa1d52c1aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337db45488a4fa1d52c=
1ab
      failing since 105 days (last pass: next-20200424, first fail: next-20=
200428) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
bcm2837-rpi-3-b             | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f337791bcecaa471452c1a6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f337791bcecaa47=
1452c1a9
      new failure (last pass: next-20200811)
      1 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | exynos_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3379ba6911d10a2352c1c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3379ba6911d10a2352c=
1c3
      failing since 21 days (last pass: next-20200630, first fail: next-202=
00721) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337da85c15495d9252c1ad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337da85c15495d9252c=
1ae
      failing since 18 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337ee66f5fcef67752c1ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337ee66f5fcef67752c=
1af
      failing since 18 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
exynos5422-odroidxu3        | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3381676d77b2810e52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3381676d77b2810e52c=
1a7
      failing since 18 days (last pass: next-20200723, first fail: next-202=
00724) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
imx6q-var-dt6customboard    | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337e36ce1d17455352c1da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337e36ce1d17455352c=
1db
      failing since 0 day (last pass: next-20200810, first fail: next-20200=
811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f337d3bfce542ad2652c1bd

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-omap4-panda.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f337d3bfce542a=
d2652c1c1
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f337dd3b50377e98d52c1b2

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f337dd3b50377e=
98d52c1b6
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f337cf11a7bf91ccb52c1c6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-omap4-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f337cf11a7bf91=
ccb52c1ca
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-collabora | gcc-8    | multi_v7_=
defconfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f337db27643a7e5dc52c1ae

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f337db27643a7e=
5dc52c1b2
      failing since 27 days (last pass: next-20200706, first fail: next-202=
00715)
      60 lines =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-baylibre  | gcc-8    | omap2plus=
_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337bd9b82947193252c1ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337bdab82947193252c=
1bb
      failing since 21 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
omap4-panda                 | arm    | lab-collabora | gcc-8    | omap2plus=
_defconfig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337a8520ebb5e35452c1bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337a8520ebb5e35452c=
1be
      failing since 21 days (last pass: next-20200706, first fail: next-202=
00721) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
qemu_x86_64-uefi-mixed      | x86_64 | lab-baylibre  | gcc-8    | x86_64_de=
fconfig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337aa3969e4e224852c1b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337aa3969e4e224852c=
1b9
      new failure (last pass: next-20200811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
rk3399-gru-kevin            | arm64  | lab-collabora | clang-10 | defconfig=
                    | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f33784df8752a309652c1b9

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f33784df8752a309652c1f9
      failing since 12 days (last pass: next-20200728, first fail: next-202=
00729) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
rk3399-gru-kevin            | arm64  | lab-collabora | gcc-8    | defconfig=
                    | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f33777c0a4e99ca9452c1cc

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f33777c0a4e99ca9452c20c
      failing since 11 days (last pass: next-20200728, first fail: next-202=
00731) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | clang-10 | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337ffb702c0511fb52c1a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (clang version 10.0.0-++20200412072704+50d7e5d5e7d-=
1~exp1~20200412053303.133 )
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337ffb702c0511fb52c=
1aa
      failing since 25 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
                    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337e5b9a3d98a9dd52c1b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337e5b9a3d98a9dd52c=
1b6
      failing since 25 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun50i-a64-pine64-plus      | arm64  | lab-baylibre  | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f33817e6d77b2810e52c1ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-sun50i-a6=
4-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f33817e6d77b2810e52c=
1ac
      failing since 25 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337d91df6291927052c203

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-cub=
ieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337d91df6291927052c=
204
      failing since 25 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337ecbbd7c30e84b52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337ecbbd7c30e84b52c=
1a7
      failing since 25 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337da25c15495d9252c1a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337da25c15495d9252c=
1a9
      failing since 25 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337eeda9527eb57e52c1ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337eeda9527eb57e52c=
1ad
      failing since 25 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337a5f24bde2cf3152c1c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337a5f24bde2cf3152c=
1c5
      failing since 22 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-cubieboard2       | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337a6324bde2cf3152c1c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337a6324bde2cf3152c=
1ca
      failing since 22 days (last pass: next-20200717, first fail: next-202=
00720) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f338672fa81a235ca52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-sun7i-a20-oli=
nuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f338672fa81a235ca52c=
1a7
      failing since 25 days (last pass: next-20200715, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3387c35dd54325e252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3387c35dd54325e252c=
1a7
      failing since 25 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun7i-a20-olinuxino-lime2   | arm    | lab-baylibre  | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3383d7331987124352c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-olinuxino-lime2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3383d7331987124352c=
1a7
      failing since 25 days (last pass: next-20200716, first fail: next-202=
00717) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337e31ce1d17455352c1d6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-clabbe/baseline-sun8i-r40-banan=
api-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337e31ce1d17455352c=
1d7
      failing since 0 day (last pass: next-20200519, first fail: next-20200=
811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defconfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3380c5fcf85df0e352c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3380c5fcf85df0e352c=
1a7
      failing since 0 day (last pass: next-20200519, first fail: next-20200=
811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | multi_v7_=
defc...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f33836045bad13ae252c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun8=
i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armeb/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f33836045bad13ae252c=
1a7
      failing since 0 day (last pass: next-20200519, first fail: next-20200=
811) =



platform                    | arch   | lab           | compiler | defconfig=
                    | results
----------------------------+--------+---------------+----------+----------=
--------------------+--------
sun8i-r40-bananapi-m2-ultra | arm    | lab-clabbe    | gcc-8    | sunxi_def=
config              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f337bc362659a835f52c1b7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20200812/arm/=
sunxi_defconfig/gcc-8/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f337bc362659a835f52c=
1b8
      failing since 0 day (last pass: next-20200519, first fail: next-20200=
811) =20
