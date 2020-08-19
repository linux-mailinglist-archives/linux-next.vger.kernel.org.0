Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951BC2494D1
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 08:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgHSGEf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 02:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgHSGEd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 02:04:33 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDBAC061389
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2020 23:04:32 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id kr4so619955pjb.2
        for <linux-next@vger.kernel.org>; Tue, 18 Aug 2020 23:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3nw0l4tIqR19l/mSCdNJBkwD4U+oVhMM2VJQb6c1ut0=;
        b=YjsG+v6el4e6MDva0R6sM5l5r9R5owAIErOcPJzlxRg8gjryOYAzMelo81ouM6Ovpx
         N10+NFrNZPoCdj8S67AxIOI1mcFf/KH9a7LNTyFKSfr3rRZhxw8CXMptkXb3Ij5MDkMl
         vwO8h8/DZsbotQ9IxYpPINxz5KP4LHmZgetRolk1tNlXKhKNkQGiGZ1F6p7+ndILP24L
         plizVPK5P1ciuvy4bqm9RbV+vaKjh3m92pSripLIMYYy639xpAGrOqMUHzZnDCwfW5dn
         /+qdvw72R3A2E11g3YpvGxrWyHZ9QY74LKW+zEx+yg99OTXHEjooeXIdGOssOO0tcemX
         i2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3nw0l4tIqR19l/mSCdNJBkwD4U+oVhMM2VJQb6c1ut0=;
        b=sqLzJH2p0GTXEtJ4w8R+pbGN7GcwaA0kfiVYkF9n/3bN0afoLQulRFlQvD6iHgJZYW
         BMOKZFzdOsP4UPa2Iyzutgmw8TRapIE/Oc8Ld8QnpS667BFX5VtGqk+3bfkMQfJ/TZKK
         PrdxywRqaP7Z91go1NTu2+0jRC+mZ6vvC0w1p+oJADjrN8slv7V0ZHOzO4ujrmmckCyB
         3DeBrxhVMi9DKmi42tCdSh8UeCGOVIUF7uH8Bakqe6xKz18lAxPWrtI/3m4Daib1GcES
         7qdhMgThz/5yjReT/Wi2ad9EuEHkrx1zt5rCbsle4yTHR8Jn3llUTrBwcpn7dHWNmipV
         1o6Q==
X-Gm-Message-State: AOAM533bm76H11v+YuviYjrgK2BJMlQTOEpv4aXeUTHbEOPb3A5X3WSM
        4kAzea+OH38qcjCVpnZL4vRvQ+Drhx49BQ==
X-Google-Smtp-Source: ABdhPJz5thdXwM7E2W5CkHLGsyKd/oXtCoteMs22QX4eTmPchBMB2YuHWfEADOdK18aZV7u4Hgmnnw==
X-Received: by 2002:a17:902:eb14:: with SMTP id l20mr17920378plb.6.1597817070988;
        Tue, 18 Aug 2020 23:04:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o134sm26691849pfg.200.2020.08.18.23.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 23:04:29 -0700 (PDT)
Message-ID: <5f3cc0ed.1c69fb81.73e73.f7d4@mx.google.com>
Date:   Tue, 18 Aug 2020 23:04:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.9-rc1-311-g44ce88b59ae4
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 261 runs,
 24 regressions (v5.9-rc1-311-g44ce88b59ae4)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 261 runs, 24 regressions (v5.9-rc1-311-g44ce88=
b59ae4)

Regressions Summary
-------------------

platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 3/4    =

bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 3/4    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =

imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 3/4    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/4    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =

omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =

omap4-panda              | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 0/1    =

omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 84/88  =

rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 84/88  =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 0/1    =

sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.9-rc1-311-g44ce88b59ae4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.9-rc1-311-g44ce88b59ae4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      44ce88b59ae417a4c3aa0a659136188d78086a71 =



Test Regressions
---------------- =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
at91-sama5d4_xplained    | arm   | lab-baylibre  | gcc-8    | sama5_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c8539d75f8ea149d99a58

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d=
4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c8539d75f8ea149d99=
a59
      failing since 105 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first =
fail: v5.7-rc4-211-g6d4315023bc9)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f3c85a9455a14f80cd99a60

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f3c85a9455a14f8=
0cd99a62
      new failure (last pass: v5.9-rc1-207-gddf860520297)
      2 lines

    2020-08-19 01:51:20.967000  / # =

    2020-08-19 01:51:20.972000  =

    2020-08-19 01:51:21.081000  / # #
    2020-08-19 01:51:21.084000  #
    2020-08-19 01:51:22.347000  / # export SHELL=3D/bin/sh
    2020-08-19 01:51:22.362000  export SHELL=3D/bin/sh
    2020-08-19 01:51:23.866000  / # . /lava-2881/environment
    2020-08-19 01:51:23.881000  . /lava-2881/environment
    2020-08-19 01:51:26.596000  / # /lava-2881/bin/lava-test-runner /lava-2=
881/0
    2020-08-19 01:51:26.609000  /lava-2881[   29.979544] hwmon hwmon1: Unde=
rvoltage detected!
    ... (10 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
bcm2837-rpi-3-b          | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f3c86689a962b99dfd99a3c

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f3c86689a962b99=
dfd99a3e
      new failure (last pass: v5.9-rc1-207-gddf860520297)
      1 lines

    2020-08-19 01:54:32.757000  / # =

    2020-08-19 01:54:32.769000  =

    2020-08-19 01:54:32.873000  / # #
    2020-08-19 01:54:32.880000  #
    2020-08-19 01:54:34.140000  / # export SHELL=3D/bin/sh
    2020-08-19 01:54:34.151000  export SHELL=3D/bin/sh[   17.899208] hwmon =
hwmon1: Undervoltage detected!
    2020-08-19 01:54:34.151000  =

    2020-08-19 01:54:35.654000  / # . /lava-2893/environment
    2020-08-19 01:54:35.664000  . /lava-2893/environment
    2020-08-19 01:54:38.374000  / # /lava-2893/bin/lava-test-runner /lava-2=
893/0
    ... (9 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | exynos_defcon=
fig             | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c8ae2ad07af78dad99a3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos542=
2-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c8ae2ad07af78dad99=
a3c
      failing since 1 day (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fai=
l: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c8d6c17a33116c0d99a3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c8d6c17a33116c0d99=
a3b
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c9272673940a711d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5=
422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c9272673940a711d99=
a3a
      failing since 1 day (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fai=
l: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
exynos5422-odroidxu3     | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c94fd6dddcb1d52d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c94fd6dddcb1d52d99=
a3a
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
imx6q-var-dt6customboard | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c92974088001586d99a42

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c92974088001586d99=
a43
      failing since 1 day (last pass: v5.9-rc1-137-ga49f4f3ccd1d, first fai=
l: v5.9-rc1-207-gddf860520297)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c8650af983bf996d99a46

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c8650af983bf996d99=
a47
      failing since 8 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
mt8173-elm-hana          | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c8730c87f87405bd99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-han=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c8730c87f87405bd99=
a3a
      failing since 9 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f3c958deb2d6139e4d99a39

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3c958deb2d613=
9e4d99a3c
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-19 02:59:14.509000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-19 02:59:14.514000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-19 02:59:14.518000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-19 02:59:14.523000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-19 02:59:14.529000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-19 02:59:14.535000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-19 02:59:14.542000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-19 02:59:14.548000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-19 02:59:14.558000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-19 02:59:14.561000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f3c989df26a578454d99a39

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-omap4-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3c989df26a578=
454d99a3c
      failing since 7 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-19 03:12:16.237000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-19 03:12:16.243000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-19 03:12:16.247000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-19 03:12:16.252000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-19 03:12:16.258000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-19 03:12:16.263000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-19 03:12:16.272000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-19 03:12:16.278000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-19 03:12:16.283000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-19 03:12:16.287000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3c88058ce28c098bd99a3a

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/b=
aseline-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3c88058ce28c0=
98bd99a3e
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)
      60 lines

    2020-08-19 02:01:35.421000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c801
    2020-08-19 02:01:35.427000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c802
    2020-08-19 02:01:35.432000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c803
    2020-08-19 02:01:35.438000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c804
    2020-08-19 02:01:35.444000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c805
    2020-08-19 02:01:35.450000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c806
    2020-08-19 02:01:35.455000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c807
    2020-08-19 02:01:35.461000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c808
    2020-08-19 02:01:35.467000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c809
    2020-08-19 02:01:35.473000  kern  :alert : BUG: Bad page state in proce=
ss swapper  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f3c89c6dd627be2ead99a39

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f3c89c6dd627be=
2ead99a3d
      failing since 7 days (last pass: v5.8-rc7-210-gb684091a3d8c, first fa=
il: v5.8-12146-gc063c7b30ed0)
      60 lines

    2020-08-19 02:09:04.622000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c801
    2020-08-19 02:09:04.628000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-19 02:09:04.634000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-19 02:09:04.640000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-19 02:09:04.646000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-19 02:09:04.652000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-19 02:09:04.658000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-19 02:09:04.664000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-19 02:09:04.670000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-19 02:09:04.676000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    ... (50 line(s) more)
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-baylibre  | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c9743333b893ee1d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap4-p=
anda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c9743333b893ee1d99=
a3a
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
omap4-panda              | arm   | lab-collabora | gcc-8    | omap2plus_def=
config          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c89445a026a80a4d99a43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-=
panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c89445a026a80a4d99=
a44
      failing since 13 days (last pass: v5.8-1558-g0359180fcb42, first fail=
: v5.8-3221-g983112062f35)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3c8584342deb9764d99a61

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabo=
ra/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3c8584342deb9764d99aa1
      failing since 9 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)

    2020-08-19 01:50:55.500000  /lava-2553711/1/../bin/lava-test-case
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
rk3399-gru-kevin         | arm64 | lab-collabora | gcc-8    | defconfig    =
                | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f3c86d53b34e00a28d99a39

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kev=
in.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f3c86d53b34e00a28d99a79
      failing since 9 days (last pass: v5.8-1558-g0359180fcb42, first fail:=
 v5.8-12062-g26dee840e516)

    2020-08-19 01:56:31.602000  <8>[   52.462518] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-driver-present RESULT=3Dpass>
    2020-08-19 01:56:32.621000  /lava-2553737/1/../bin/lava-test-case
    2020-08-19 01:56:32.632000  <8>[   53.494992] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c99e1e59145e9aed99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64be/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c99e1e59145e9aed99=
a3a
      failing since 1 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c9bf96319f0e565d99a39

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibr=
e/baseline-sun50i-a64-pine64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c9bf96319f0e565d99=
a3a
      failing since 1 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun50i-a64-pine64-plus   | arm64 | lab-baylibre  | gcc-8    | defconfig    =
                | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c9e01c06007849bd99a40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine=
64-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c9e01c06007849bd99=
a41
      failing since 1 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c88e4d6d12601f7d99a66

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/ba=
seline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c88e4d6d12601f7d99=
a67
      failing since 1 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | multi_v7_defc=
onfig           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c8a26b71473bb52d99a3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a2=
0-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c8a26b71473bb52d99=
a3c
      failing since 1 day (last pass: v5.8-13316-g31a0e28a656f, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =



platform                 | arch  | lab           | compiler | defconfig    =
                | results
-------------------------+-------+---------------+----------+--------------=
----------------+--------
sun7i-a20-cubieboard2    | arm   | lab-baylibre  | gcc-8    | sunxi_defconf=
ig              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f3c8438475cb2b58ad99a4b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.9-rc1-31=
1-g44ce88b59ae4/arm/sunxi_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-c=
ubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f3c8438475cb2b58ad99=
a4c
      failing since 1 day (last pass: v5.8-13251-g8d2ac1ce7b76, first fail:=
 v5.9-rc1-137-ga49f4f3ccd1d)  =20
