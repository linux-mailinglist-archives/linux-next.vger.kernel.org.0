Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7E72DE193
	for <lists+linux-next@lfdr.de>; Fri, 18 Dec 2020 11:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389206AbgLRKzH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Dec 2020 05:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389258AbgLRKzG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2020 05:55:06 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975FAC0617B0
        for <linux-next@vger.kernel.org>; Fri, 18 Dec 2020 02:54:25 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id v2so1311893pfm.9
        for <linux-next@vger.kernel.org>; Fri, 18 Dec 2020 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=k9mcREcByZuTtQR1dypTn5btKyvAOexMLY2jWdeInUQ=;
        b=zqUCJYM7Ya0TsRhjhVmfCmUxDGRsR24A7cYUZ4CfN0K6oZcd3FJuRbbQjQVISKrg+F
         DM60Rq2ND5HbXUTM2wZ9Rb2z3y3ijyoGmmQ1dpyzVx9Vcgwi3QObdvi5I2EoqQ9NW6p9
         Zj9lLqwDmJ/GnlcIAmnw8vdwqREz2OdubcnV7MDF1SUjHSLQ/89PcaiMQgOqEL4C9n4F
         jbyYjzvueOGIp4LYGuOL5eGS5vPETXZDDrJT8eFyGBI/EGWQhRbJM6o3QROg9eof9FrY
         eAxo8JJ4aWGcR5ItCwwrOF3IHdqWNA2LjLBr/jbrZCtZVHGmkaddoOIljMHVy9ixxvAv
         Nvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=k9mcREcByZuTtQR1dypTn5btKyvAOexMLY2jWdeInUQ=;
        b=j/+9SgmV630PL5MWJj46LC28FK4xMILWXemh+vJbVoF0U3KdElhPAh5bSRRYWAbgFS
         rB1uSplRPr6EuUctR9NXlLW8VlT44MnffgrLfC7nlB6WTRwDrkoCYeZz5ZyDye9drnZr
         uIWm9e/+MZYRBU6dOEsIzse/2CzMrH5kxQtMhAo6JFhXEik9tCdfi4E/Q906srXwmE2T
         ZO7c+tuH4CMUSjuAKpspPjjciHjvlxV9s78vD5A+nSu8ibvk8YZ95O3eMdKf0MaMYnzP
         ocpz1j25TA0qbyNguV/lxLprzbWRAQGdZMOu1wJTbf8H0fdTF0nUzXLp9QfGSuTp3IN6
         g/5A==
X-Gm-Message-State: AOAM533gFS8oEUtzRJJWNBCUzuG9OtWd5tfbUEb6rvsdROWKXaxKf54N
        6Xhsm1gZ5UjOVWi6JHs2snErwpGy5tyDEA==
X-Google-Smtp-Source: ABdhPJzblp4Pakiq+0OHh5z5B0ZeDzQ+eAlWD8ws8vyT1kZLD3SqaaRWeemgz2I9bBi6uB7AJRh9+Q==
X-Received: by 2002:a65:460d:: with SMTP id v13mr1112124pgq.414.1608288864261;
        Fri, 18 Dec 2020 02:54:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ev23sm7503410pjb.24.2020.12.18.02.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 02:54:23 -0800 (PST)
Message-ID: <5fdc8a5f.1c69fb81.fb8c1.3966@mx.google.com>
Date:   Fri, 18 Dec 2020 02:54:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20201218
X-Kernelci-Report-Type: test
Subject: next/master baseline: 801 runs, 39 regressions (next-20201218)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 801 runs, 39 regressions (next-20201218)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-11 | defconf=
ig                    | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | clang-11 | multi_v=
7_defconfig           | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | clang-10 | multi_v=
7_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | clang-11 | multi_v=
7_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | clang-10 | multi_v=
7_defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | clang-11 | multi_v=
7_defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | clang-10 | multi_v=
7_defconfig           | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201218/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201218
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0d52778b8710eb11cb616761a02aee0a7fd60425 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc518d5e575355cbc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc518d5e575355cbc94=
cba
        failing since 27 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc598252ff09f912c94ced

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc598252ff09f912c94=
cee
        failing since 27 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-11 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5afe510292c31ac94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5afe510292c31ac94=
cbe
        failing since 27 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5cdf125e3e0305c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5cdf125e3e0305c94=
cbb
        failing since 27 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc53489e6e4d8c0cc94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc53489e6e4d8c0cc94=
cd0
        failing since 27 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc556dd8e54c59f2c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc556dd8e54c59f2c94=
ccd
        failing since 27 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5754cd6e9a9c6fc94ceb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5754cd6e9a9c6fc94=
cec
        failing since 27 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5661285f63aee1c94ceb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5661285f63aee1c94=
cec
        failing since 9 days (last pass: next-20201204, first fail: next-20=
201208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc59463a929cac24c94ce6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc59463a929cac24c94=
ce7
        failing since 1 day (last pass: next-20201211, first fail: next-202=
01216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | clang-11 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5ae8d7eb7ea55dc94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5ae8d7eb7ea55dc94=
cc4
        failing since 3 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc57649a05d03115c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc57649a05d03115c94=
cba
        failing since 3 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5269fa0890ae30c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5269fa0890ae30c94=
cc0
        failing since 3 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc55d0e2a8c707e2c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc55d0e2a8c707e2c94=
cc7
        failing since 3 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc51f189022babe0c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc51f189022babe0c94=
cdb
        new failure (last pass: next-20201216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5855302001af39c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5855302001af39c94=
cba
        new failure (last pass: next-20201216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc55cd413366c0a3c94d02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc55cd413366c0a3c94=
d03
        failing since 6 days (last pass: next-20201210, first fail: next-20=
201211) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc53c7ef320578c0c94d4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc53c7ef320578c0c94=
d4e
        new failure (last pass: next-20201216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc57fc2204e77961c94d22

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc57fc2204e77961c94=
d23
        new failure (last pass: next-20201216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5120ba5fe78a0fc94d2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5120ba5fe78a0fc94=
d2b
        new failure (last pass: next-20201216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc53ceef320578c0c94d62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc53ceef320578c0c94=
d63
        new failure (last pass: next-20201216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5246fa0890ae30c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5246fa0890ae30c94=
cbb
        failing since 8 days (last pass: next-20201208, first fail: next-20=
201209) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc4f1db3967eb37ec94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc4f1db3967eb37ec94=
cc6
        failing since 30 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc4f22acddda378dc94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc4f22acddda378dc94=
cbe
        failing since 30 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc4ed65d030be21cc94cdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc4ed65d030be21cc94=
cdd
        failing since 30 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc76ccb389032f1cc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc76ccb389032f1cc94=
cba
        failing since 30 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5a683194092f49c94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5a683194092f49c94=
cc1
        failing since 0 day (last pass: next-20201208, first fail: next-202=
01217) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | clang-11 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5e6b4120dd4816c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5e6b4120dd4816c94=
cc7
        failing since 3 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc521789022babe0c94cf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc521789022babe0c94=
cf1
        failing since 3 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc57709a05d03115c94cec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc57709a05d03115c94=
ced
        failing since 1 day (last pass: next-20201208, first fail: next-202=
01217) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc57ba2b18f6865ac94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc57ba2b18f6865ac94=
cbb
        failing since 3 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5ce6645b87ae9ac94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5ce6645b87ae9ac94=
cc2
        failing since 0 day (last pass: next-20201208, first fail: next-202=
01217) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | clang-11 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc66274f63dc7ebcc94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc66274f63dc7ebcc94=
cbb
        failing since 3 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5367269783c985c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5367269783c985c94=
cba
        failing since 3 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5a28f4eb87ee1cc94cf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5a28f4eb87ee1cc94=
cf6
        failing since 1 day (last pass: next-20201208, first fail: next-202=
01217) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5a84d7eb7ea55dc94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5a84d7eb7ea55dc94=
cc0
        failing since 3 days (last pass: next-20201208, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5a84f1cd620897c94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5a84f1cd620897c94=
ccb
        failing since 36 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5385dd9185a9abc94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5385dd9185a9abc94=
cd4
        failing since 36 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe      | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc56b2d42fc61a33c94ce1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig/clang-10/lab-clabbe/baseline-sun8i-r40-bananapi-m2-ultra=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc56b2d42fc61a33c94=
ce2
        new failure (last pass: next-20201216) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fdc5956b99141e093c94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201218/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fdc5956b99141e093c94=
cd3
        failing since 1 day (last pass: next-20201208, first fail: next-202=
01217) =

 =20
