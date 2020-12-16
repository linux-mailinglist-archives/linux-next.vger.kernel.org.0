Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB442DC2A0
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 16:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgLPPBI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 10:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgLPPBI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 10:01:08 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4743C061794
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 07:00:27 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id q4so7355880plr.7
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 07:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EhWjL5qY1b6CZVJNFHEc/HwT2CJZ6Z+Ds1ADl5PZs2s=;
        b=UQN9Dla6oloxXVlttfuXNFyK8EJY8Xb8e0MDA1wpHSCjpuZIOOu/cWgys1Nh2zGsw0
         lJCOZxV026BTTt869fF/ziesJ3yUfci+RmwX42AXzQJzLH8EjAaGnOOBsU3RPRUZjDeQ
         4migXN+OUPbh4VaKaEzYJ7lMIcszLtwZdQHGGG1Sp7VdisPhm1fvJKIxqietGSCfMA51
         RK1A6FdHBE6S4rhWf3LV4JZCmTWsypys3bdn0m9FzrZpYKdW+wb49xh7KirmU4ZisIGN
         06bAV4bQP/Y0lRPu8nvVqUiRg0AyPWQthPqbahpSYfbVltehNzVzx86ricVt66NJwTY1
         3NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EhWjL5qY1b6CZVJNFHEc/HwT2CJZ6Z+Ds1ADl5PZs2s=;
        b=JpyD6AqvrpAegsZSpY9L6z7/+VEJDT80ohBEQCA5Yj+fq7gNcUO9zN4TPvkIsFC+dM
         Irdd+JFoQ2sPHEnzwqVQNUFQ3bZJDV0ZeWfzKZUlY7XqhayNmA/2wWdYqqRxNgzmVYI8
         4GFce6V8mqNpNADk62LmK9O3g7xqmoMsxInvcagFH+WAiRL46TZ/f2PCYtyhuyoNp2tQ
         gUaLTW9yvjReS2Mvuf7APTk+NH2N3yFe6CQvuUoKYawqPu0FRms/pMrBvoJMrfXpkWAH
         Xp5J9DQFx9X2xC6VHtmjsgjp2cQ4r/owUYxL24Yy77JXJqyDA3Yc4jIp4p+e5FJTYYhL
         +S9Q==
X-Gm-Message-State: AOAM530ndnMLKinhdW8ihbllKMlXesDVJc3iAHolzbC7axpzRG9JFYqH
        Ke+WxP0WUwyTroexo7KPfNSBFExNyJf5XA==
X-Google-Smtp-Source: ABdhPJwyDylPVvZ1beWIzub7ATpOoLXu2Js7vL1M0CBZGmCzj6eNArf9QRVVtvBr1O+uPNw+TYb/Gg==
X-Received: by 2002:a17:90b:1886:: with SMTP id mn6mr3433351pjb.31.1608130826103;
        Wed, 16 Dec 2020 07:00:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y6sm2836008pfn.145.2020.12.16.07.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 07:00:25 -0800 (PST)
Message-ID: <5fda2109.1c69fb81.54c55.60f7@mx.google.com>
Date:   Wed, 16 Dec 2020 07:00:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20201216
X-Kernelci-Report-Type: test
Subject: next/master baseline: 663 runs, 38 regressions (next-20201216)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 663 runs, 38 regressions (next-20201216)

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
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-11 | defconf=
ig                    | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 2          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | clang-11 | multi_v=
7_defconfig           | 2          =

imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 2          =

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

imx8mp-evk                   | arm64 | lab-nxp         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-11 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | clang-11 | defconf=
ig                    | 2          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 3          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
201216/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20201216
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      26aed0ea32c8f25c4538a42a8d5e9c458e79b62f =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9e80bd5cf8ad0bac94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9e80bd5cf8ad0bac94=
ccb
        failing since 26 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9ea00ff02bea80cc94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9ea00ff02bea80cc94=
cca
        failing since 26 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9ee6e845955de11c94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-fsl-ls1088=
a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9ee6e845955de11c94=
cc9
        failing since 26 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | clang-11 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f23fea6724a27bc94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-11/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f23fea6724a27bc94=
cbe
        failing since 26 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9ec28b06051a9a9c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9ec28b06051a9a9c94=
cba
        failing since 26 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f04c252140a119c94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f04c252140a119c94=
cbf
        failing since 26 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f4270bbeb3bf65c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f4270bbeb3bf65c94=
cce
        failing since 26 days (last pass: next-20201119, first fail: next-2=
0201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9ea74119e709d98c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9ea74119e709d98c94=
ccd
        failing since 51 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd9ee521dc554f21ac94ccb

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd9ee521dc554f=
21ac94ccf
        new failure (last pass: next-20201211)
        4 lines

    2020-12-16 11:22:43.540000+00:00  kern  :alert : Unhandled fault: align=
ment exception (0x001) at 0xcec60217
    2020-12-16 11:22:43.541000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-12-16 11:22:43.541000+00:00  kern  :alert : [cec60217] *pgd=3D1ec1=
141e(bad)   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd9ee521dc554f=
21ac94cd0
        new failure (last pass: next-20201211)
        25 lines

    2020-12-16 11:22:43.583000+00:00  kern  :emerg : Process kworker/1:1 (p=
id: 53, stack limit =3D 0x(ptrval))
    2020-12-16 11:22:43.584000+00:00  kern  :emerg : Stack: (0xc2369ec8 to =
0xc236a000)
    2020-12-16 11:22:43.584000+00:00  kern  :emerg : 9ec0:                 =
  8fd1119d cec60217 00000000 00000000 00000003 00000000
    2020-12-16 11:22:43.584000+00:00  kern  :emerg : 9ee0: 00000000 8fd1119=
d c38c7840 c3af0400 c38c7894 00000000 cec6008f c0a691b8
    2020-12-16 11:22:43.585000+00:00  kern  :emerg : 9f00: c38c7840 c3af040=
0 fffffc84 00000000 ef7a8280 ef7ab500 c1a04d18 c0a68b68
    2020-12-16 11:22:43.626000+00:00  kern  :emerg : 9f20: c2152080 0000004=
0 00000000 c3af05a0 c1a04d18 c036e820 c2152094 c2152080
    2020-12-16 11:22:43.626000+00:00  kern  :emerg : 9f40: ef7a8280 0000000=
8 c2152094 ef7a8298 c1a03d00 0000000c ef7a8280 c036ee94
    2020-12-16 11:22:43.627000+00:00  kern  :emerg : 9f60: c1c26214 c225524=
0 0000047c c036ead0 c2368000 c2255254 00000040 c2255264
    2020-12-16 11:22:43.627000+00:00  kern  :emerg : 9f80: c2152080 c037429=
4 c036ead0 c20dd140 c03740e0 00000000 00000000 00000000
    2020-12-16 11:22:43.627000+00:00  kern  :emerg : 9fa0: 00000000 0000000=
0 00000000 c03001b0 00000000 00000000 00000000 00000000 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | clang-11 | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd9ec75eb75239859c94cc6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-imx6q-var-dt6customboard.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-imx6q-var-dt6customboard.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd9ec75eb75239=
859c94cca
        new failure (last pass: next-20201215)
        4 lines

    2020-12-16 11:15:55.510000+00:00  kern  :alert : pgd =3D (ptrval)
    2020-12-16 11:15:55.510000+00:00  kern  :alert : [752f7389] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd9ec75eb75239=
859c94ccb
        new failure (last pass: next-20201215)
        64 lines

    2020-12-16 11:15:55.553000+00:00  kern  :emerg : Process udevd (pid: 11=
8, stack limit =3D 0x(ptrval))
    2020-12-16 11:15:55.554000+00:00  kern  :emerg : Stack: (0xc390bb70 to =
0xc390c000)
    2020-12-16 11:15:55.554000+00:00  kern  :emerg : bb60:                 =
                    c38f91b4 c390bba8 c38f9000 c38f9014
    2020-12-16 11:15:55.554000+00:00  kern  :emerg : bb80: c156e72a 0000012=
2 00000100 c0a70a0c ef83ee64 c38f9840 c38f9000 c2374400
    2020-12-16 11:15:55.555000+00:00  kern  :emerg : bba0: c38f9014 c156e72=
a c38f9000 752f7369 1566c530 c38f9000 c2362480 c2373140
    2020-12-16 11:15:55.596000+00:00  kern  :emerg : bbc0: c38f9014 c156e72=
a 00000122 00000100 00000021 c0a7e308 c1563fd5 00000000
    2020-12-16 11:15:55.596000+00:00  kern  :emerg : bbe0: c38f900c c38f900=
0 fffffdfb c2370780 c39ef508 c39ef510 c39ef50c c0a5032c
    2020-12-16 11:15:55.597000+00:00  kern  :emerg : bc00: c38f9000 c22c541=
0 00000021 bf04f6ac c39cf200 0000000c c1bb8348 c2370780
    2020-12-16 11:15:55.597000+00:00  kern  :emerg : bc20: 00000021 c0ab0a0=
4 00000000 c39ca6c0 c23727c0 c23727c0 00000000 c1bb8340
    2020-12-16 11:15:55.597000+00:00  kern  :emerg : bc40: c39cf200 0000000=
0 c1c6bab0 00000015 00000100 c0ab0ff4 c225ac10 00000000 =

    ... (53 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd9ea389aa2f8422dc94cc2

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd9ea389aa2f84=
22dc94cc6
        new failure (last pass: next-20201215)
        4 lines

    2020-12-16 11:06:24.460000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000313
    2020-12-16 11:06:24.461000+00:00  kern  :alert : pgd =3D 2aeabb52
    2020-12-16 11:06:24.462000+00:00  kern  :alert : [00000313] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd9ea389aa2f84=
22dc94cc7
        new failure (last pass: next-20201215)
        47 lines

    2020-12-16 11:06:24.504000+00:00  kern  :emerg : Process kworker/1:3 (p=
id: 139, stack limit =3D 0x7e9fd939)
    2020-12-16 11:06:24.504000+00:00  kern  :emerg : Stack: (0xc39c9d58 to =
0xc39ca000)
    2020-12-16 11:06:24.506000+00:00  kern  :emerg : 9d40:                 =
                                      c3e001b0 c3e001b4
    2020-12-16 11:06:24.506000+00:00  kern  :emerg : 9d60: c3e00000 c3e0001=
4 c14389d4 c09c201c c39c8000 ef8732e0 c09c33dc c3e00000
    2020-12-16 11:06:24.507000+00:00  kern  :emerg : 9d80: 000002f3 0000000=
c c19bab78 c2001d80 c3965900 ef86aca0 c09cf930 c14389d4
    2020-12-16 11:06:24.546000+00:00  kern  :emerg : 9da0: c19bab5c 78da943=
8 c19bab78 c3d97c80 c390d000 c3e00000 c3e00014 c14389d4
    2020-12-16 11:06:24.547000+00:00  kern  :emerg : 9dc0: c19bab5c 0000000=
c c19bab78 c09cf900 c1436618 00000000 c3e0000c c3e00000
    2020-12-16 11:06:24.549000+00:00  kern  :emerg : 9de0: c230f410 c32165c=
0 c3a46f40 c09a5460 c3e00000 fffffdfb c230f410 bf044134
    2020-12-16 11:06:24.549000+00:00  kern  :emerg : 9e00: c3d97880 c3213f0=
8 00000120 c32165c0 c3a46f40 c09ff8d4 c3d97880 c3d97880
    2020-12-16 11:06:24.549000+00:00  kern  :emerg : 9e20: 00000040 c3d9788=
0 c3a46f40 00000000 c19bab70 bf15209c bf153014 00000021 =

    ... (36 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f03d63b4c08016c94d25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-imx6q-var-dt6=
customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f03d63b4c08016c94=
d26
        failing since 7 days (last pass: next-20201204, first fail: next-20=
201208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f22a569c7763b5c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f22a569c7763b5c94=
cc7
        new failure (last pass: next-20201211) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | clang-11 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f09aed225eb7e5c94cf3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f09aed225eb7e5c94=
cf4
        failing since 1 day (last pass: next-20201211, first fail: next-202=
01214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9ed2b195afc4922c94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9ed2b195afc4922c94=
cd4
        failing since 1 day (last pass: next-20201211, first fail: next-202=
01214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9eef79866b12406c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9eef79866b12406c94=
cba
        failing since 1 day (last pass: next-20201211, first fail: next-202=
01214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f3e801e6d8ddfbc94ce7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f3e801e6d8ddfbc94=
ce8
        failing since 2 days (last pass: next-20201211, first fail: next-20=
201214) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9ec62700d3c9c70c94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9ec62700d3c9c70c94=
cc9
        new failure (last pass: next-20201215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-11 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f09dc64ec5ca0dc94ce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f09dc64ec5ca0dc94=
ce6
        failing since 7 days (last pass: next-20201207, first fail: next-20=
201208) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9ea210149b7eeabc94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9ea210149b7eeabc94=
cd8
        failing since 6 days (last pass: next-20201208, first fail: next-20=
201209) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9eee3180cbea9d8c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9eee3180cbea9d8c94=
cba
        failing since 5 days (last pass: next-20201210, first fail: next-20=
201211) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9e6d77c8f6c6fb5c94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9e6d77c8f6c6fb5c94=
ccb
        new failure (last pass: next-20201215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9e9a55d6b13c5a6c94cd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-meson-gxl-s=
905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-meson-gxl-s=
905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9e9a65d6b13c5a6c94=
cd5
        new failure (last pass: next-20201215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9e973d8cfb77d9dc94cf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9e973d8cfb77d9dc94=
cf2
        new failure (last pass: next-20201215) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | clang-11 | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/5fd9ea4efe37d0edd5c94cc9

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd9ea4efe37d0e=
dd5c94ccd
        failing since 1 day (last pass: next-20201211, first fail: next-202=
01215)
        10 lines

    2020-12-16 11:06:47.703000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-12-16 11:06:47.704000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-16 11:06:47.704000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-16 11:06:47.704000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-12-16 11:06:47.704000+00:00  kern  :alert : Data abort info:
    2020-12-16 11:06:47.704000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-12-16 11:06:47.704000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-12-16 11:06:47.756000+00:00  kern  :alert : [007f0000032fb800] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd9ea4efe37d0e=
dd5c94cce
        failing since 1 day (last pass: next-20201211, first fail: next-202=
01215)
        2 lines

    2020-12-16 11:06:47.756000+00:00  kern  :emerg : Code: 38420e88 2a1f03e=
0 35ffff48 17fffff0 (f85f0260)    =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/5fd9e9d47d872df4e0c94cc8

  Results:     2 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fd9e9d47d872df4=
e0c94ccb
        new failure (last pass: next-20201215)
        1 lines

    2020-12-16 11:03:40.987000+00:00  Connected to meson-gxm-q200 console [=
channel connected] (~$quit to exit)
    2020-12-16 11:03:40.988000+00:00  (user:khilman) is already connected
    2020-12-16 11:03:52.536000+00:00  GXM:BL1:dc8b51:76f1a5;FEAT:ADFC318C:0=
;POC:3;RCY:0;EMMC:0;READ:0;CHK:AA;SD:0;READ:0;0.0;CHK:0;
    2020-12-16 11:03:52.536000+00:00  no sdio debug board detected =

    2020-12-16 11:03:52.536000+00:00  TE: 309139
    2020-12-16 11:03:52.537000+00:00  =

    2020-12-16 11:03:52.537000+00:00  BL2 Built : 11:58:42, May 27 2017. =

    2020-12-16 11:03:52.537000+00:00  gxl gc3c9a84 - xiaobo.gu@droid05
    2020-12-16 11:03:52.537000+00:00  =

    2020-12-16 11:03:52.537000+00:00  set vcck to 1120 mv =

    ... (628 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fd9e9d47d872df=
4e0c94ccc
        new failure (last pass: next-20201215)
        11 lines

    2020-12-16 11:04:45.757000+00:00  kern  :alert : Mem abort info:
    2020-12-16 11:04:45.757000+00:00  kern  :alert :   ESR =3D 0x96000005
    2020-12-16 11:04:45.758000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-16 11:04:45.758000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-16 11:04:45.758000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-12-16 11:04:45.758000+00:00  kern  :alert : Data abort info:
    2020-12-16 11:04:45.759000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000005
    2020-12-16 11:04:45.759000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-12-16 11:04:45.759000+00:00  kern  :alert : swapper pgtable: 4k pa=
ges, 48-bit VAs, pgdp=3D000000000254a000
    2020-12-16 11:04:45.799000+00:00  kern  :alert : [ffff000107380000] pgd=
=3D000000007fff8003   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd9e9d47d872df=
4e0c94ccd
        new failure (last pass: next-20201215)
        4 lines

    2020-12-16 11:04:45.800000+00:00  kern  :emerg : Code: 17ffff9a f9401bf=
7 17ffffcb f9001bf7 (d4210000) =

    2020-12-16 11:04:45.800000+00:00  kern  :emerg : Internal error: Oops: =
96000005 [#2] PREEMPT SMP
    2020-12-16 11:04:45.800000+00:00  kern  :emerg : Code: d503201f d503201=
f d503201f d503201f (a8c12027)    =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9e68f5391c0ff12c94cd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9e68f5391c0ff12c94=
cd5
        failing since 6 days (last pass: next-20201208, first fail: next-20=
201209) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9e92f5c2a186965c94ce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9e92f5c2a186965c94=
ce6
        failing since 28 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9e84c4f21591e91c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9e84c4f21591e91c94=
cba
        failing since 28 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fda15620e91ef19a1c94ce7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fda15620e91ef19a1c94=
ce8
        failing since 28 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9f12e7bdd71bbf5c94cdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201212122539+abeec=
5d081f-1~exp1~20201211233153.145)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9f12e7bdd71bbf5c94=
cde
        failing since 34 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9efb000373b6760c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20201216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9efb000373b6760c94=
cc4
        failing since 34 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =20
