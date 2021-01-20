Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDD42FD0A0
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 13:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731438AbhATMqw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 07:46:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387837AbhATMba (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 07:31:30 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E96C0613C1
        for <linux-next@vger.kernel.org>; Wed, 20 Jan 2021 04:30:47 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b8so12453207plx.0
        for <linux-next@vger.kernel.org>; Wed, 20 Jan 2021 04:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kZI2BVBAkwZ6ft5Lu41GoIEoTJXaWNWaSfiHMCyHhw0=;
        b=s6TqJWix7qmATXNT2WA/gv77ulm2F2MJ0PMPCTVy64mAAKg/jiiFU2Q6jo3mlT5QPN
         T02HS6YAHA3a+rrWABdFJatWjnuknfgSaNQ8dpmX3OIJUc7s0ImACzV/2+NOCTHT/NM/
         WUtgfUN3bgVg14J4yD9ZfaYPw10EKsvsd2WI5wWGYxQ5Rx80GCXE/XZmpTvk6aDEf4dQ
         zWXGo9N9DVCmhqd9O7x1I2TBGSytcwLO8DjWDW4eCrplI8xDklF5hxCaB/dHwiCVQdUC
         LXJvBtXdLU88XEpE3t4r7OLADZBGvA1QPOy9IqMrPZqE8XWn9CnorNyJL7Gyvgbhtqkp
         0cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kZI2BVBAkwZ6ft5Lu41GoIEoTJXaWNWaSfiHMCyHhw0=;
        b=sd5BFJUQQVSMAc8KKOVbS/coIhSuAUYdnTpA6Sx9ZwRc7/Cw6Lnxzl+KumBEzmJ/pl
         FCbL69eLB5T2HKzGo6/k2yMuJWdHWWmuCrMUhPHhiGddGAWixzoUpkfRhRO8CcbmxAeu
         iE0E9tY+zCWk5za3nrQ4j5m2tVw9NVudmtdAvrm41pb9UoEJD2RxoLSUbvaRbxNR0vN7
         ln7KmedOuMEc5BCPOZceFAM5ysDOFQxO6BIyOUum5cprNOaBF9q2Guc8x0SZ/hWnbeq/
         m2Ej6flk0kKT4tA1aQM2RQ7+cizCP1NqT7N4Yws95R6tXNPP5R5Yu67JLdI7wMRi+cte
         dooA==
X-Gm-Message-State: AOAM530FzuPyA6B5qaACWfwY9uPXwdbiuwZfzT9f59CTvvISOv/SpkAg
        epm8t0tAmy1V8YY6qSvMD5bSOb4cFq5CnQ==
X-Google-Smtp-Source: ABdhPJx60Cj1F6foSDWLZfTS60+hHONFmlI6Gh5E/l7sQ7OwHfFfSSmvyphptc/rxtR7voM9oIC8aQ==
X-Received: by 2002:a17:90a:8594:: with SMTP id m20mr179960pjn.215.1611145845365;
        Wed, 20 Jan 2021 04:30:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 67sm2324863pfv.20.2021.01.20.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 04:30:44 -0800 (PST)
Message-ID: <60082274.1c69fb81.caf2.5950@mx.google.com>
Date:   Wed, 20 Jan 2021 04:30:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210120
Subject: next/master baseline: 525 runs, 109 regressions (next-20210120)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 525 runs, 109 regressions (next-20210120)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

imx6q-sabresd                | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6sll-evk                  | arm    | lab-nxp       | clang-11 | multi_v7=
_defconfig           | 1          =

imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defconfig           | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6ull-14x14-evk            | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson8b-odroidc1             | arm    | lab-baylibre  | clang-11 | multi_v7=
_defconfig           | 1          =

meson8b-odroidc1             | arm    | lab-baylibre  | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

qemu_arm-versatilepb         | arm    | lab-baylibre  | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-broonie   | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-cip       | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-collabora | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-10 | x86_64_d=
efconfig             | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 2          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 2          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 2          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210120/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210120
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      647060f3b592d3c8df0c85dd887557b03e6ea897 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007e948486e079279bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007e948486e079279bb5=
d0c
        failing since 15 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6q-sabresd                | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ea27bf1ea685ccbb5d33

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ea27bf1ea685ccbb5=
d34
        failing since 86 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6007fafa7578487ffbbb5d0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007fafa7578487ffbbb5=
d0d
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ece3dbe79f474bbb5d10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ece3dbe79f474bbb5=
d11
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ee4ff343486cd2bb5d10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ee4ff343486cd2bb5=
d11
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f054be91b770c1bb5d24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f054be91b770c1bb5=
d25
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ea9856c2f1f98abb5d37

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ul-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ea9856c2f1f98abb5=
d38
        failing since 0 day (last pass: next-20210118, first fail: next-202=
10119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6ull-14x14-evk            | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007eac0ff0a0ca39abb5d28

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6ull-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007eac0ff0a0ca39abb5=
d29
        failing since 0 day (last pass: next-20210118, first fail: next-202=
10119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f310596affa71cbb5d31

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f310596affa71cbb5=
d32
        new failure (last pass: next-20210119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ecf3714f95a189bb5d18

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007ecf3714f95a=
189bb5d1c
        new failure (last pass: next-20210119)
        11 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007ecf3714f95a=
189bb5d1d
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:42:19.745000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:42:19.747000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL),<8>[   45.373850] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RES=
ULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:42:19.748000+00:00   IL =3D 3<8>[   45.382137] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 610978_1.5.2.4.1>
    2021-01-20 08:42:19.749000+00:00  2 bits
    2021-01-20 08:42:19.750000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:42:19.752000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:42:19.753000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:42:19.754000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000046   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f1a0675504c7aabb5d25

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f1a1675504c7aabb5=
d26
        new failure (last pass: next-20210119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ecdf188fb317f4bb5d89

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007ecdf188fb31=
7f4bb5d8d
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:42:02.312000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:42:02.312000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:42:02.312000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL <8>[   45.362728] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg=
 RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:42:02.313000+00:00  =3D 32 bits<8>[   45.371145] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 3093684_1.5.2.4.1>
    2021-01-20 08:42:02.313000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:42:02.313000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:42:02.313000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:42:02.314000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000046   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007ecdf188fb31=
7f4bb5d8e
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007eff619e1c0ae97bb5d2a

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007eff619e1c0a=
e97bb5d2e
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:55:13.812000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:55:13.812000+00:00  kern  :alert :   ESR =3D 0x96000047
    2021-01-20 08:55:13.812000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), I<8>[   16.260298] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:55:13.813000+00:00  L =3D <8>[   16.268347] <LAVA_SIGNAL_=
ENDRUN 0_dmesg 3093858_1.5.2.4.1>
    2021-01-20 08:55:13.813000+00:00  32 bits
    2021-01-20 08:55:13.813000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:55:13.814000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:55:13.814000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:55:13.814000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007eff619e1c0a=
e97bb5d2f
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ee76893c8bd727bb5d40

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007ee76893c8bd=
727bb5d44
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:48:49.408000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:48:49.408000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:48:49.409000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), I<8>[   45.316890] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg R=
ESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:48:49.409000+00:00  L =3D 32 bit<8>[   45.325413] <LAVA_S=
IGNAL_ENDRUN 0_dmesg 611061_1.5.2.4.1>
    2021-01-20 08:48:49.409000+00:00  s
    2021-01-20 08:48:49.409000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:48:49.409000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:48:49.409000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:48:49.409000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000046   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007ee76893c8bd=
727bb5d45
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ef70396ada3551bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-meson-g12b-a311d-khadas-vim3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ef70396ada3551bb5=
d0c
        new failure (last pass: next-20210119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007eae76f019d5963bb5d9e

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007eae76f019d5=
963bb5da2
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:33:37.884000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:33:37.884000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:33:37.885000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL<8>[   45.324489] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg =
RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:33:37.885000+00:00   =3D 32 b<8>[   45.332776] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 610903_1.5.2.4.1>
    2021-01-20 08:33:37.885000+00:00  its
    2021-01-20 08:33:37.885000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:33:37.885000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:33:37.885000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:33:37.886000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000046   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007eae76f019d5=
963bb5da3
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f2152a7c66bd10bb5d0b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007f2152a7c66b=
d10bb5d0f
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 09:04:16.081000+00:00  kern  :alert : Mem abort info:
    2021-01-20 09:04:16.081000+00:00  kern  :alert :   ESR =3D 0x96000047
    2021-01-20 09:04:16.081000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), <8>[   45.282304] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RE=
SULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 09:04:16.082000+00:00  IL =3D<8>[   45.290208] <LAVA_SIGNAL_=
ENDRUN 0_dmesg 611197_1.5.2.4.1>
    2021-01-20 09:04:16.082000+00:00   32 bits
    2021-01-20 09:04:16.082000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 09:04:16.082000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 09:04:16.082000+00:00  kern  :alert : Data abort info:
    2021-01-20 09:04:16.082000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007f2152a7c66b=
d10bb5d10
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007eaf66f019d5963bb5db6

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-meson-g1=
2b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-meson-g1=
2b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007eaf66f019d5=
963bb5dba
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:33:53.929000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:33:53.930000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:33:53.930000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL<8>[   45.327954] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg =
RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:33:53.930000+00:00   =3D 32 b<8>[   45.336185] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 3093513_1.5.2.4.1>
    2021-01-20 08:33:53.930000+00:00  its
    2021-01-20 08:33:53.930000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:33:53.931000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:33:53.931000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:33:53.931000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000046   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007eaf66f019d5=
963bb5dbb
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f079baa68eef1ebb5d6b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-meson-g=
12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007f079baa68ee=
f1ebb5d6f
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:57:24.405000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:57:24.406000+00:00  kern  :alert :   ESR =3D 0x96000047
    2021-01-20 08:57:24.406000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL<8>[   45.321848] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg =
RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:57:24.406000+00:00   =3D 32<8>[   45.329838] <LAVA_SIGNAL=
_ENDRUN 0_dmesg 3093885_1.5.2.4.1>
    2021-01-20 08:57:24.406000+00:00   bits
    2021-01-20 08:57:24.407000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:57:24.407000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:57:24.407000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:57:24.407000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007f079baa68ee=
f1ebb5d70
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ee8c2e0737c2f9bb5d20

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007ee8c2e0737c=
2f9bb5d24
        new failure (last pass: next-20210119)
        11 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007ee8c2e0737c=
2f9bb5d25
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:49:11.921000+00:00  kern  :alert :   ESR =3D 0x96000047
    2021-01-20 08:49:11.921000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL),<8>[   45.356754] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RES=
ULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:49:11.921000+00:00   IL <8>[   45.364721] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 611132_1.5.2.4.1>
    2021-01-20 08:49:11.921000+00:00  =3D 32 bits
    2021-01-20 08:49:11.921000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:49:11.921000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:49:11.922000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:49:11.922000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007eae8b3b482702bbb5d25

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-g12=
b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007eae8b3b4827=
02bbb5d29
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:33:38.255000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:33:38.256000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:33:38.256000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL<8>[   45.359038] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg =
RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 08:33:38.256000+00:00   =3D 32 b<8>[   45.367178] <LAVA_SIGN=
AL_ENDRUN 0_dmesg 610898_1.5.2.4.1>
    2021-01-20 08:33:38.256000+00:00  its
    2021-01-20 08:33:38.256000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:33:38.256000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:33:38.257000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:33:38.257000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000046   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007eae8b3b4827=
02bbb5d2a
        new failure (last pass: next-20210119)
        2 lines =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f0438c1511886ebb5d1b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-meson-g1=
2b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007f0438c15118=
86ebb5d1f
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:56:31.071000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:56:31.071000+00:00  kern  :alert :   ESR =3D 0x96000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007f0438c15118=
86ebb5d20
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:56:31.073000+00:00   IL <8>[   45.337501] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 611212_1.5.2.4.1>
    2021-01-20 08:56:31.073000+00:00  =3D 32 bits
    2021-01-20 08:56:31.073000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:56:31.073000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:56:31.073000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:56:31.073000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson8b-odroidc1             | arm    | lab-baylibre  | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f36c1d69961cabbb5d69

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f36c1d69961cabbb5=
d6a
        failing since 6 days (last pass: next-20201222, first fail: next-20=
210113) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson8b-odroidc1             | arm    | lab-baylibre  | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ebcd33b8f92f3dbb5d2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ebcd33b8f92f3dbb5=
d2b
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ed04714f95a189bb5d34

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6007ed04714f95a189bb5d4c
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:42:38.648000+00:00  /lava-3093696/1/../bin/lava-test-case=
   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
7ed04714f95a189bb5d52
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:42:39.765000+00:00  <8>[   27.500485] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f067baa68eef1ebb5d18

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6007f067baa68eef1ebb5d30
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-20 08:57:07.133000+00:00  <8>[   26.337721] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
7f067baa68eef1ebb5d36
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-20 08:57:08.235000+00:00  /lava-3093893/1/../bin/lava-test-case=
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-baylibre  | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007e819e145df264fbb5d4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007e819e145df264fbb5=
d4f
        failing since 63 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-broonie   | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007e872b0f5bd6018bb5d32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007e872b0f5bd6018bb5=
d33
        failing since 63 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-cip       | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007e81fe145df264fbb5d5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007e81fe145df264fbb5=
d5e
        failing since 63 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-collabora | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6007e84f382370e697bb5d21

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007e84f382370e697bb5=
d22
        failing since 63 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | clang-10 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/6007eb0b06e760603dbb5d2a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007eb0b06e760603dbb5=
d2b
        new failure (last pass: next-20210119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007eda4c1bed52946bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007eda4c1bed52946bb5=
d0c
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ef98c560f7ce93bb5d1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ef98c560f7ce93bb5=
d20
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ef72aa748bc4fbbb5d2d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ef72aa748bc4fbbb5=
d2e
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ebdfb3343c23a9bb5d18

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ebdfb3343c23a9bb5=
d19
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f15c2caf60e11dbb5d1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f15c2caf60e11dbb5=
d1e
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007edbcbb92fbad98bb5d14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007edbcbb92fbad98bb5=
d15
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f2232a7c66bd10bb5d48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f2232a7c66bd10bb5=
d49
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ef71396ada3551bb5d10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ef71396ada3551bb5=
d11
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ebe9b3343c23a9bb5d1d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ebe9b3343c23a9bb5=
d1e
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f37c1d69961cabbb5d7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f37c1d69961cabbb5=
d80
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007edb7c1bed52946bb5d35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007edb7c1bed52946bb5=
d36
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f23bd1e10678b7bb5d13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f23bd1e10678b7bb5=
d14
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ef7aaa748bc4fbbb5d32

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ef7aaa748bc4fbbb5=
d33
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ebc833b8f92f3dbb5d24

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ebc833b8f92f3dbb5=
d25
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f394658cc3ab65bb5d1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f394658cc3ab65bb5=
d1c
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f0fcfbb1d6d422bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f0fcfbb1d6d422bb5=
d0c
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f93f843302c42abb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f93f843302c42abb5=
d0c
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f562a832d669fdbb5d5d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f562a832d669fdbb5=
d5e
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ee5fa84a2c3c89bb5d20

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ee5fa84a2c3c89bb5=
d21
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f242e55361c9b9bb5d0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f242e55361c9b9bb5=
d10
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007fa821712292589bb5d2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007fa821712292589bb5=
d30
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ed7ac22a568560bb5d2e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ed7ac22a568560bb5=
d2f
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f1d3706a122e15bb5d1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f1d3706a122e15bb5=
d20
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ef40d2109ed4f3bb5d98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ef40d2109ed4f3bb5=
d99
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007eb9c5ce600d283bb5d14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007eb9c5ce600d283bb5=
d15
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f316596affa71cbb5d3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77960=
-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77960=
-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f316596affa71cbb5=
d3e
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-rock2-square          | arm    | lab-collabora | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6007eb82a4168e80e6bb5d1f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007eb82a4168e80e6bb5=
d20
        failing since 0 day (last pass: next-20210118, first fail: next-202=
10119) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6007eb1fdfe2610e4cbb5d2f

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
6007eb1fdfe2610e4cbb5d3c
        failing since 0 day (last pass: next-20210118, first fail: next-202=
10119)

    2021-01-20 08:34:19.068000+00:00     =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 3          =


  Details:     https://kernelci.org/test/plan/id/6007ed5254c8d4be0ebb5d0b

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
007ed5254c8d4be0ebb5d40
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6007ed5254c8d4be0ebb5d4b
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6007ed5254c8d4be0ebb5d4d
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:43:57.938000+00:00  /lava-3093697/1/../bin/lava-test-case
    2021-01-20 08:43:57.948000+00:00  <8>[   25.412768] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/6007f33d2732071b05bb5d15

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
007f33d2732071b05bb5d5b
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 09:09:09.515000+00:00  /lava-3093865/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6007f33d2732071b05bb5d66
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 09:09:10.788000+00:00  <8>[   24.668750] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6007f33d2732071b05bb5d68
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 09:09:11.827000+00:00  /lava-3093865/1/../bin/lava-test-case
    2021-01-20 09:09:11.840000+00:00  <8>[   25.720999] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 3          =


  Details:     https://kernelci.org/test/plan/id/6007efe2d109da3d39bb5db8

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
007efe2d109da3d39bb5df0
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:54:51.638000+00:00  <8>[   23.012024] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>
    2021-01-20 08:54:51.639000+00:00  /lava-3093822/1/../bin/lava-test-case
    2021-01-20 08:54:51.639000+00:00  <8>[   23.032167] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-drm-driver-present RESULT=3Dpass>
    2021-01-20 08:54:51.639000+00:00  /lava-3093822/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6007efe2d109da3d39bb5dfb
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:54:52.830000+00:00  /lava-3093822/1/../bin/lava-test-case
    2021-01-20 08:54:52.842000+00:00  <8>[   24.253828] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6007efe2d109da3d39bb5dfd
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:54:53.877000+00:00  /lava-3093822/1/../bin/lava-test-case
    2021-01-20 08:54:53.888000+00:00  <8>[   25.301015] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/6007eae36f019d5963bb5d40

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
007eae36f019d5963bb5d75
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:33:33.205000+00:00  /lava-3093507/1/../bin/lava-test-case
    2021-01-20 08:33:33.215000+00:00  <8>[   50.207402] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6007eae36f019d5963bb5d80
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:33:34.471000+00:00  <8>[   51.462400] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6007eae36f019d5963bb5d82
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-20 08:33:35.518000+00:00  <8>[   52.510362] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/6007f3691d69961cabbb5d0b

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
007f3691d69961cabbb5d40
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-20 09:09:54.985000+00:00  <8>[   23.139439] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>
    2021-01-20 09:09:54.985000+00:00  /lava-3093891/1/../bin/lava-test-case
    2021-01-20 09:09:54.985000+00:00  <8>[   23.161867] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-drm-driver-present RESULT=3Dpass>
    2021-01-20 09:09:54.985000+00:00  /lava-3093891/1/../bin/lava-test-case
    2021-01-20 09:09:54.986000+00:00  <8>[   23.184735] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-efuse-driver-present RESULT=3Dpass>
    2021-01-20 09:09:54.986000+00:00  /lava-3093891/1/../bin/lava-test-case
    2021-01-20 09:09:54.986000+00:00  <8>[   23.207459] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-efuse-probed RESULT=3Dpass>
    2021-01-20 09:09:54.986000+00:00  /lava-3093891/1/../bin/lava-test-case
    2021-01-20 09:09:54.986000+00:00  <8>[   23.230102] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-emmc-phy-driver-present RESULT=3Dpass>
    2021-01-20 09:09:54.986000+00:00  /lava-3093891/1/../bin/lava-test-case =

    ... (11 line(s) more)  =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6007f3691d69961cabbb5d4b
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6007f3691d69961cabbb5d4d
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-20 09:09:57.030000+00:00  <8>[   25.447555] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f3c96dc4bce266bb5d15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f3c96dc4bce266bb5=
d16
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007fc8628fe9eb557bb5d43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007fc8628fe9eb557bb5=
d44
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6007f793904dfd6794bb5d0b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007f793904dfd6794bb5=
d0c
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007ecf1dbe79f474bbb5d14

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007ecf1dbe79f474bbb5=
d15
        failing since 9 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007febd5318bdb1a3bb5d38

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007febd5318bdb1a3bb5=
d39
        failing since 9 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ed7ad5bcd7c0e7bb5d15

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007ed7ad5bcd7c=
0e7bb5d19
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:44:38.013000+00:00  008
    2021-01-20 08:44:38.014000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:44:38.014000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:44:38.014000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-20 08:44:38.014000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:44:38.015000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:44:38.015000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007ed7ad5bcd7c=
0e7bb5d1a
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:44:38.056000+00:00  V =3D 0, ISS =3D 0x0<8>[   17.549110]=
 <LAVA_SIGNAL_ENDRUN 0_dmesg 3093702_1.5.2.4.1>
    2021-01-20 08:44:38.057000+00:00  0000046
    2021-01-20 08:44:38.057000+00:00  kern  :alert :   CM =3D 0, WnR =3D 1
    2021-01-20 08:44:38.057000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000434cd000
    2021-01-20 08:44:38.057000+00:00  kern  :alert : [0000000000000008] pgd=
=3D00000000434cc003, p4d=3D00000000434cc003, pud=3D0000000041fcf003, pmd=3D=
0000000000000000
    2021-01-20 08:44:38.058000+00:00  kern  :emerg : Internal error: Oops: =
96000046 [#1] PREEMPT SMP   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f0a8d5cf0cec37bb5d35

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-sun5=
0i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007f0a8d5cf0ce=
c37bb5d39
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:58:11.444000+00:00  kern  :aler<8>[   17.583000] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D11>
    2021-01-20 08:58:11.445000+00:00  t : Mem abort info:
    2021-01-20 08:58:11.445000+00:00  kern  :alert :   ESR =3D 0x96000047
    2021-01-20 08:58:11.446000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-20 08:58:11.446000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:58:11.447000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:58:11.447000+00:00  kern  :alert : Data abort info:
    2021-01-20 08:58:11.448000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007f0a8d5cf0ce=
c37bb5d3a
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:58:11.487000+00:00  kern  :alert : user p<8>[   17.619388=
] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines ME=
ASUREMENT=3D2>
    2021-01-20 08:58:11.488000+00:00  gtable: 64k page<8>[   17.630044] <LA=
VA_SIGNAL_ENDRUN 0_dmesg 3093856_1.5.2.4.1>
    2021-01-20 08:58:11.488000+00:00  s, 48-bit VAs, pgdp=3D000000004be70e00
    2021-01-20 08:58:11.489000+00:00  kern  :alert : [0000000000000008] pgd=
=3D000000004c9c0003, p4d=3D000000004c9c0003, pud=3D000000004c9c0003, pmd=3D=
000000004c9d0003, pte=3D0000000000000000
    2021-01-20 08:58:11.489000+00:00  kern  :emerg : Internal error: Oops: =
96000047 [#1] PREEMPT SMP   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ef2cd2109ed4f3bb5d27

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007ef2cd2109ed=
4f3bb5d2b
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:51:50.532000+00:00  008
    2021-01-20 08:51:50.532000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:51:50.532000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:51:50.533000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-20 08:51:50.533000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:51:50.533000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:51:50.533000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007ef2cd2109ed=
4f3bb5d2c
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:51:50.575000+00:00  V =3D 0, ISS =3D 0x0<8>[   17.610118]=
 <LAVA_SIGNAL_ENDRUN 0_dmesg 3093823_1.5.2.4.1>
    2021-01-20 08:51:50.575000+00:00  0000046
    2021-01-20 08:51:50.575000+00:00  kern  :alert :   CM =3D 0, WnR =3D 1
    2021-01-20 08:51:50.575000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D0000000047548000
    2021-01-20 08:51:50.576000+00:00  kern  :alert : [0000000000000008] pgd=
=3D0000000047547003, p4d=3D0000000047547003, pud=3D0000000047542003, pmd=3D=
0000000000000000
    2021-01-20 08:51:50.576000+00:00  kern  :emerg : Internal error: Oops: =
96000046 [#1] PREEMPT SMP   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007eb945ce600d283bb5d0b

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-sun50i-h=
6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-sun50i-h=
6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007eb945ce600d=
283bb5d0f
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 08:36:31.137000+00:00  008
    2021-01-20 08:36:31.138000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:36:31.138000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:36:31.139000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-20 08:36:31.139000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:36:31.140000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:36:31.140000+00:00  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007eb945ce600d=
283bb5d10
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:36:31.180000+00:00  V =3D 0, ISS =3D 0x0<8>[   17.619901]=
 <LAVA_SIGNAL_ENDRUN 0_dmesg 3093519_1.5.2.4.1>
    2021-01-20 08:36:31.181000+00:00  0000046
    2021-01-20 08:36:31.181000+00:00  kern  :alert :   CM =3D 0, WnR =3D 1
    2021-01-20 08:36:31.181000+00:00  kern  :alert : user pgtable: 4k pages=
, 48-bit VAs, pgdp=3D00000000436b7000
    2021-01-20 08:36:31.182000+00:00  kern  :alert : [0000000000000008] pgd=
=3D00000000436b3003, p4d=3D00000000436b3003, pud=3D000000004371f003, pmd=3D=
0000000000000000
    2021-01-20 08:36:31.182000+00:00  kern  :emerg : Internal error: Oops: =
96000046 [#1] PREEMPT SMP   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64           | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f1d7d85280e0a5bb5d46

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-sun50i-=
h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-sun50i-=
h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007f1d7d85280e=
0a5bb5d4a
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 09:03:12.732000+00:00  kern  :aler<8>[   17.639244] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D11>
    2021-01-20 09:03:12.733000+00:00  t : Mem abort info:
    2021-01-20 09:03:12.733000+00:00  kern  :alert :   ESR =3D 0x96000047
    2021-01-20 09:03:12.733000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-20 09:03:12.734000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 09:03:12.734000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 09:03:12.734000+00:00  kern  :alert : Data abort info:
    2021-01-20 09:03:12.735000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000047   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007f1d7d85280e=
0a5bb5d4b
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 09:03:12.775000+00:00  kern  :alert : user pgtable: 64k page=
s, 48-bit VAs, p<8>[   17.677415] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demer=
g RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-20 09:03:12.775000+00:00  gdp=3D000000004193<8>[   17.688185] <=
LAVA_SIGNAL_ENDRUN 0_dmesg 3093888_1.5.2.4.1>
    2021-01-20 09:03:12.776000+00:00  1c00
    2021-01-20 09:03:12.776000+00:00  kern  :alert : [0000000000000008] pgd=
=3D000000004cfc0003, p4d=3D000000004cfc0003, pud=3D000000004cfc0003, pmd=3D=
000000004cfd0003, pte=3D0000000000000000
    2021-01-20 09:03:12.777000+00:00  kern  :emerg : Internal error: Oops: =
96000047 [#1] PREEMPT SMP   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f305596affa71cbb5d14

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007f305596affa=
71cbb5d18
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 09:08:13.734000+00:00  ss 0000000000000008
    2021-01-20 09:08:13.736000+00:00  kern  :alert : Mem abort info:
    2021-01-20 09:08:13.739000+00:00  kern  :alert :   ESR =3D 0x96000046   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007f305596affa=
71cbb5d19
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 09:08:13.752000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 09:08:13.755000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 09:08:13.773000+00:00  kern  :alert : Data <8>[   17.678794]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D2>
    2021-01-20 09:08:13.776000+00:00  abort info:   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/6007f3971d69961cabbb5d97

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210112082949+9bbcb=
554cdbf-1~exp1~20210112193605.156)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007f3971d69961=
cabbb5d9b
        new failure (last pass: next-20210119)
        11 lines

    2021-01-20 09:10:39.541000+00:00  ss 0000000000000008   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007f3971d69961=
cabbb5d9c
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 09:10:39.551000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 09:10:39.552000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-20 09:10:39.554000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 09:10:39.556000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 09:10:39.581000+00:00  kern  :alert : Data <8>[   17.690041]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D2>
    2021-01-20 09:10:39.583000+00:00  abort info:   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6007ec80ff724af168bb5d17

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h6=
-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h6=
-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6007ec80ff724af=
168bb5d1b
        new failure (last pass: next-20210119)
        11 lines =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6007ec80ff724af=
168bb5d1c
        new failure (last pass: next-20210119)
        2 lines

    2021-01-20 08:40:22.699000+00:00  kern  :alert : Mem abort info:
    2021-01-20 08:40:22.701000+00:00  kern  :alert :   ESR =3D 0x96000046
    2021-01-20 08:40:22.702000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-20 08:40:22.703000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-20 08:40:22.705000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-20 08:40:22.733000+00:00  kern  :alert : Data <8>[   17.691189]=
 <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEA=
SUREMENT=3D2>
    2021-01-20 08:40:22.735000+00:00  abort info:   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6007fcd8b2f9228730bb5d2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210120/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6007fcd8b2f9228730bb5=
d30
        failing since 69 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =20
