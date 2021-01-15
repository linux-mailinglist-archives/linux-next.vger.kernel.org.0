Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA3A2F78E9
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 13:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbhAOM3R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jan 2021 07:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbhAOM3Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jan 2021 07:29:16 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A2CC0613D3
        for <linux-next@vger.kernel.org>; Fri, 15 Jan 2021 04:28:36 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id cq1so4969611pjb.4
        for <linux-next@vger.kernel.org>; Fri, 15 Jan 2021 04:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ogkT626LHAcGDtlPHftq2+juY27yYvqukF+bAgyK9dk=;
        b=kwFJtOrDuQITgBeToGX8lKFd5L7A0mxvE7fdfNcThsex3/0VB+Lj3I4ytIMhVAwb4/
         uiALO86kdNMGDbOqKVnemS3bR+OPp0tY0/nwLycUHlurKu62ASNslul7FO1uUggWrSJo
         6g0ZPSvkF8hrmJY6qoNUBETK+yPdA6wBJxx45J4bBJ6W/Nt91kDz5CGZRHq9XP34uxhg
         S0yeII2xkURAc0cXmH8wo6VLuIwmNSn7Ycm7CW5iqG4zA9DqMHDW8benf737M4zK58Q8
         +E7LsiZKOk+S/ByH/lP/B9dIyjn6gRfLhfRO8uAgZ4vYwY9o+6sdP4HlNyydXLHCpvCd
         SbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ogkT626LHAcGDtlPHftq2+juY27yYvqukF+bAgyK9dk=;
        b=gGLwwLrtOpgVYnmG3WGUTA3d4uyUM5zYrQCFOaqAIJhl1NYMZcu2cKAiBAiOfdWjEQ
         p2wk/9AHQ6hRnilbf85/CCYEcbMA8vnJ3pB0mB3bHgCbet5b0lYx0a0tRjxuHvn1ttn0
         duAyiKR3XoJa/ZjQSAMIOMIwqvycMrCwVEFKOnYauM9rZVKwEvQd/zuVKgjBKyflYshC
         FAI2SfUiL0J+gDi1njKYhCQujCRhIZFst1w/tUqA0E8eWXqvHhezpyERyKr98mohCHvD
         OX38KJSggnbsypFjQ6ZuILUSS7HDzKHdTvRyE7TwTHXNGM71jopC/KSsXBv7gYHhG114
         oftw==
X-Gm-Message-State: AOAM532t3QmOCeVPLzosyKVWX9I5JAg5kVQXkzfNUZgSPIzGdVV1M3m+
        TBidpjXryFhatgSUBS0srfydj58nIaDn0A==
X-Google-Smtp-Source: ABdhPJwVLeTP1TirbWPhndIllw0MC8S1ejdk838t8xW17L2t+AU6b+1VNd0WMGrzKhtAJjkpxybReQ==
X-Received: by 2002:a17:902:f688:b029:da:a817:1753 with SMTP id l8-20020a170902f688b02900daa8171753mr12317576plg.76.1610713714014;
        Fri, 15 Jan 2021 04:28:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id gf23sm1547244pjb.42.2021.01.15.04.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 04:28:33 -0800 (PST)
Message-ID: <60018a71.1c69fb81.ad22c.331e@mx.google.com>
Date:   Fri, 15 Jan 2021 04:28:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210115
X-Kernelci-Report-Type: test
Subject: next/master baseline: 658 runs, 81 regressions (next-20210115)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 658 runs, 81 regressions (next-20210115)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | clang-11 | defconf=
ig+CONFIG_EFI=3Dn       | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

imx6sll-evk                  | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =

imx6sll-evk                  | arm   | lab-nxp         | clang-11 | multi_v=
7_defconfig           | 1          =

imx6sll-evk                  | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx6sll-evk                  | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6sll-evk                  | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | clang-11 | multi_v=
7_defconfig           | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

meson8b-odroidc1             | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 2          =

mt8173-elm-hana              | arm64 | lab-collabora   | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874               | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

r8a77960-ulcb                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | clang-10 | multi_v=
7_defconfig           | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 3          =

rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 3          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | clang-10 | defconf=
ig                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-8    | defconf=
ig                    | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210115/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210115
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b3a3cbdec55b090d22a09f75efb7c7d34cb97f25 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | clang-11 | defconf=
ig+CONFIG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/6001512eb7210e5f34c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001512eb7210e5f34c94=
cba
        failing since 10 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6001520ce1db10e798c94cf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001520ce1db10e798c94=
cf5
        failing since 10 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sll-evk                  | arm   | lab-nxp         | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/600158643ee0a75d5bc94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600158643ee0a75d5bc94=
ccb
        failing since 1 day (last pass: next-20210108, first fail: next-202=
10114) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sll-evk                  | arm   | lab-nxp         | clang-11 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/600159decd3b885ca4c94ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600159decd3b885ca4c94=
ce4
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sll-evk                  | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600151015b6c4fb2f7c94dcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600151015b6c4fb2f7c94=
dd0
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sll-evk                  | arm   | lab-nxp         | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/600154f4290bb7a6dec94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600154f4290bb7a6dec94=
cc1
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sll-evk                  | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6001565c0653a32612c94d2f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001565c0653a32612c94=
d30
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600159a1dd36303e95c94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600159a1dd36303e95c94=
cca
        failing since 1 day (last pass: next-20210113, first fail: next-202=
10114) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6001537a9eb32309dec94ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001537a9eb32309dec94=
ce4
        new failure (last pass: next-20210114) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600157ff8af3eac6acc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600157ff8af3eac6acc94=
cba
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210108) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60015aaa8e8c4f2f49c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015aaa8e8c4f2f49c94=
cc0
        new failure (last pass: next-20210107) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | clang-11 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60015d3b76242394f3c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-11/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015d3b76242394f3c94=
ccd
        failing since 1 day (last pass: next-20201222, first fail: next-202=
10113) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/600156fee5979a9fd2c94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600156fee5979a9fd2c94=
cd4
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/600158b8397162c376c94ce4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600158b8397162c376c94=
ce5
        failing since 1 day (last pass: next-20210108, first fail: next-202=
10113) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/600157d3865de93b76c94cc5

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/600157d3865de93b76c94cdd
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:52:31.272000+00:00  /lava-3060880/1/../bin/lava-test-case=
   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
157d3865de93b76c94ce3
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:52:32.390000+00:00  <8>[   27.464576] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6001508ac35f37e2a4c94cfd

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/6001508bc35f37e2a4c94d15
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:21:26.254000+00:00  <8>[   26.346921] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
1508bc35f37e2a4c94d1b
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 2          =


  Details:     https://kernelci.org/test/plan/id/600156530653a32612c94cd2

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/600156530653a32612c94cea
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-15 08:46:07.514000+00:00  /lava-3060682/1/../bin/lava-test-case=
   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
156530653a32612c94cf0
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-15 08:46:08.626000+00:00  /lava-3060682/1/../bin/lava-test-case=
   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60014edd62ab241a8fc94ce7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60014edd62ab241a8fc94=
ce8
        failing since 58 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-broonie     | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60014ed662ab241a8fc94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60014ed762ab241a8fc94=
cdc
        failing since 58 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60014ee0c2f4839b2dc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60014ee0c2f4839b2dc94=
cba
        failing since 58 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-collabora   | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60014eeac2f4839b2dc94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60014eeac2f4839b2dc94=
cc7
        failing since 58 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6001673c974c8ea8fec94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001673c974c8ea8fec94=
cd4
        failing since 58 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6001533c66d6448561c94d11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001533c66d6448561c94=
d12
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600158e1da4ddb741bc94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600158e1da4ddb741bc94=
cc7
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600151a0d001d677cec94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600151a0d001d677cec94=
cdc
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600152ab92f14bba36c94cfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600152ab92f14bba36c94=
cfb
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6001572f696e112ad3c94ceb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001572f696e112ad3c94=
cec
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6001545123b88bc6cbc94d51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001545123b88bc6cbc94=
d52
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600158d5af7b8a9ff9c94d07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600158d5af7b8a9ff9c94=
d08
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015193a9f34b588cc94d17

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015193a9f34b588cc94=
d18
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600152f7e4adc085b4c94cdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hihop=
e-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600152f7e4adc085b4c94=
ce0
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60015746446248b7d7c94d13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015746446248b7d7c94=
d14
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600155216e94593a93c94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600155216e94593a93c94=
ccc
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600158d1af7b8a9ff9c94cfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600158d1af7b8a9ff9c94=
cff
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015196a9f34b588cc94d23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015196a9f34b588cc94=
d24
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600153c05ae592c398c94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek874=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600153c05ae592c398c94=
cd2
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a774c0-ek874               | arm64 | lab-cip         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60015751f4393a011bc94cd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015751f4393a011bc94=
cd7
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600154e68f0484e939c94cf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600154e68f0484e939c94=
cf9
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60015aab50782a3a75c94cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015aab50782a3a75c94=
cbd
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6001514cdbb62d6127c94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001514cdbb62d6127c94=
cd3
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600153ae7c11ab9394c94cdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600153ae7c11ab9394c94=
cdd
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015621d9ebf851ebc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015621d9ebf851ebc94=
cba
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6001596f6698f13211c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001596f6698f13211c94=
cc7
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015425fa922ed3f9c94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015425fa922ed3f9c94=
ccf
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6001589d397162c376c94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001589d397162c376c94=
cc1
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015148dbb62d6127c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015148dbb62d6127c94=
cc4
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600152d7428d68ac8fc94cd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-r8a77960-=
ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600152d7428d68ac8fc94=
cda
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a77960-ulcb                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6001570d696e112ad3c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001570d696e112ad3c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/600154cd8f0484e939c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600154cd8f0484e939c94=
cdb
        new failure (last pass: next-20210114) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60015dd2abef747f5bc94ccc

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
60015dd2abef747f5bc94cd9
        new failure (last pass: next-20210114)

    2021-01-15 09:18:00.883000+00:00  <8>[   10.617909] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/600154e8ca791ee9b8c94cb9

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
00154e8ca791ee9b8c94cee
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/600154e8ca791ee9b8c94cf9
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/600154e8ca791ee9b8c94cfb
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:40:03.816000+00:00  <8>[   26.160722] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-10 | defconf=
ig                    | 3          =


  Details:     https://kernelci.org/test/plan/id/60015a099709b0bdf2c94cd9

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
0015a099709b0bdf2c94d0e
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 09:01:55.287000+00:00  <8>[   23.155746] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/60015a099709b0bdf2c94d19
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 09:01:56.519000+00:00  /lava-3060888/1/../bin/lava-test-case
    2021-01-15 09:01:56.530000+00:00  <8>[   24.397554] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/60015a099709b0bdf2c94d1b
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/60015089ba85a08d25c94cb9

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
0015089ba85a08d25c94cee
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:21:22.826000+00:00  /lava-3060186/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/60015089ba85a08d25c94cf9
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:21:24.079000+00:00  /lava-3060186/1/../bin/lava-test-case
    2021-01-15 08:21:24.090000+00:00  <8>[   24.460804] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/60015089ba85a08d25c94cfb
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:21:25.142000+00:00  <8>[   25.512250] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/600154119740c9e19cc94d02

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-rk3399-g=
ru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
00154119740c9e19cc94d37
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:36:22.422000+00:00  <8>[   23.137902] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/600154119740c9e19cc94d42
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-15 08:36:23.663000+00:00  <8>[   24.379234] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/600154119740c9e19cc94d44
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | gcc-8    | defconf=
ig                    | 3          =


  Details:     https://kernelci.org/test/plan/id/6001566b0653a32612c94d60

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
001566b0653a32612c94d95
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-15 08:46:28.211000+00:00  <8>[   23.107075] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6001566b0653a32612c94da0
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6001566b0653a32612c94da2
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-15 08:46:30.507000+00:00  <8>[   25.403081] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015b763a76b82895c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015b763a76b82895c94=
cc6
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60015e17e612d68353c94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015e17e612d68353c94=
cc9
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600151f86e0b2000acc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600151f86e0b2000acc94=
ccf
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015a079709b0bdf2c94cd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h5=
-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015a079709b0bdf2c94=
cd7
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60015d3163dde72dd3c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015d3163dde72dd3c94=
cba
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | clang-10 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015474d0168af013c94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015474d0168af013c94=
ccf
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | clang-10 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600158c0af7b8a9ff9c94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600158c0af7b8a9ff9c94=
cbe
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015168cf09040f65c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015168cf09040f65c94=
cc6
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600153208acd649dfbc94cff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600153208acd649dfbc94=
d00
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600155c8ad20da45fbc94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-n=
anopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600155c8ad20da45fbc94=
cd0
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64 | lab-clabbe      | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6001571c999dbd57e5c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001571c999dbd57e5c94=
cc4
        failing since 2 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre    | clang-11 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60015733446248b7d7c94cd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60015733446248b7d7c94=
cd7
        failing since 64 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe      | clang-10 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6001594470caacafa7c94db5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210115/arm/=
multi_v7_defconfig/clang-10/lab-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6001594470caacafa7c94=
db6
        new failure (last pass: next-20210114) =

 =20
