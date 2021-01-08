Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90F3D2EF059
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 11:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbhAHKCO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Jan 2021 05:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbhAHKCO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2021 05:02:14 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B243DC0612F4
        for <linux-next@vger.kernel.org>; Fri,  8 Jan 2021 02:01:33 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id x12so5398382plr.10
        for <linux-next@vger.kernel.org>; Fri, 08 Jan 2021 02:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rRjA+SA5VwiSICxSuwkV6LygHC2Xk6EbApu06PzQCrY=;
        b=yWj/swam4a/7whYfKe6zTwIahT/6MDgaFC8+KUgObygyZ/B0v3way/CH7cKDGBGKEy
         ipllbVvpFaIuvXG40FIXYG9bdp7FfBVg+PRXTTTvTlCjIriwOnUDX3Yh5lwAQcPnKWG+
         GvHVwvmAOgcfu4W8GcxnTBa8mgjDrjwD3uVWWGcUGF3hprMqDIVsEJZfQn9ZDWbmOHTj
         6nF++98TqbgVmAHesTzT/99fuDNKhHESgeVaeOgNAHfLRCNLCpirVXRjj34Kc2hmgYBg
         Z3MZArXtdm7jLmvMBddw7fHr4zU7SkDKvZ2MSJZuipdBcLt0B4jCPyKuyRtsc0nkwMBA
         nQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rRjA+SA5VwiSICxSuwkV6LygHC2Xk6EbApu06PzQCrY=;
        b=ovKPxVY2yZWlimGt8DJ7WNoGEzn4OyVJ7jwGDu3f78ekEsk13ziy4gz5djk5kai+VR
         VqUu49DGU4N+70QQmwFT+0QQKGEVKrop5m7xm7sv3o6ES2+Rq3Ht2TD6g4e67mOGEouY
         8hDYrRD45V9EbyFG6kQPL/x9Wypzb6kMS6TH5+0Osl4kNr50+qt0dKZwkize/KxZzGJm
         6d0CpL4d74/NGtDeuTks8DQ6W6Jl+q7s65oldQzLgVdun9Amuojrrf2v3f9XKo8XcjV7
         7+wZHPB31azi6DpWHumqn3Lg73G7HXdh8/FXxMNLZ0aJwth/UUx0jPlHJ0wr1kNoO6lX
         sTHw==
X-Gm-Message-State: AOAM532OChtOBpN5qhbQyvmorg+WxZo+TdRyeNSfe9FZvG5XOaaMJX7/
        p3E3H48f2+lSymlp3pB6/QXs83FXy6TE2w==
X-Google-Smtp-Source: ABdhPJx/AOc9bsmhdZveNYtUl04Ks7ZxDuz1YLiHcxmHsViP9fDzusOUc6cuZ0mSfXqIUMPSi/YGPg==
X-Received: by 2002:a17:902:ab97:b029:de:30a:5234 with SMTP id f23-20020a170902ab97b02900de030a5234mr1042131plr.55.1610100090931;
        Fri, 08 Jan 2021 02:01:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x15sm7905855pfn.118.2021.01.08.02.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 02:01:30 -0800 (PST)
Message-ID: <5ff82d7a.1c69fb81.abb90.377b@mx.google.com>
Date:   Fri, 08 Jan 2021 02:01:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210108
X-Kernelci-Report-Type: test
Subject: next/master baseline: 780 runs, 31 regressions (next-20210108)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 780 runs, 31 regressions (next-20210108)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | clang-11 | defcon=
fig+CONFIG_EFI=3Dn       | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =

hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =

imx6q-sabresd                | arm    | lab-nxp         | gcc-8    | imx_v6=
_v7_defconfig          | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-10 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | clang-11 | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-10 | defcon=
fig                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre    | clang-10 | defcon=
fig                    | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-11 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb         | arm    | lab-baylibre    | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-broonie     | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-cip         | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-collabora   | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-linaro-lkft | gcc-8    | versat=
ile_defconfig          | 1          =

qemu_x86_64                  | x86_64 | lab-baylibre    | clang-11 | x86_64=
_defconfig             | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-10 | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | clang-11 | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defconfig           | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-10 | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | clang-11 | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defconfig           | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre    | clang-11 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =

tegra124-nyan-big            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210108/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210108
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1c925d2030afd354a02c23500386e620e662622b =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | clang-11 | defcon=
fig+CONFIG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f3fedaa0f7ad2dc94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f3fedaa0f7ad2dc94=
cc8
        failing since 3 days (last pass: next-20201223, first fail: next-20=
210104) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre    | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f2c4ab7b640fb4c94cd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f2c4ab7b640fb4c94=
cd7
        failing since 3 days (last pass: next-20201223, first fail: next-20=
210104) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
hp-11A-G6-EE-grunt           | x86_64 | lab-collabora   | gcc-8    | x86_64=
_defcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f2bebb70a6560ac94cfa

  Results:     16 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-11A-G6-E=
E-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-hp-11A-G6-E=
E-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5ff7f2bebb70a65=
60ac94cff
        new failure (last pass: next-20210107)
        1 lines

    2021-01-08 05:50:48.655000+00:00  <8>[   11.023341] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6q-sabresd                | arm    | lab-nxp         | gcc-8    | imx_v6=
_v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f6ef3202606227c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f6ef3202606227c94=
cc4
        failing since 74 days (last pass: next-20201023, first fail: next-2=
0201026) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-10 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f5d5d4cfcda998c94cee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f5d5d4cfcda998c94=
cef
        failing since 2 days (last pass: next-20210105, first fail: next-20=
210106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-10 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7fc6776735feb17c94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7fc6776735feb17c94=
cd0
        new failure (last pass: next-20210107) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | clang-11 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7fad7531b649850c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7fad7531b649850c94=
cce
        failing since 1 day (last pass: next-20210106, first fail: next-202=
10107) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f3e035891aeb0ec94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f3e035891aeb0ec94=
cc2
        new failure (last pass: next-20210107) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx8mp-evk                   | arm64  | lab-nxp         | gcc-8    | defcon=
fig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f81d7ddffb6c28c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f81d7ddffb6c28c94=
cba
        new failure (last pass: next-20210106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-baylibre    | clang-10 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f708a216d5d6d0c94d02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f708a216d5d6d0c94=
d03
        new failure (last pass: next-20210107) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre    | clang-10 | defcon=
fig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f56678393fc47ec94ce4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f56678393fc47ec94=
ce5
        new failure (last pass: next-20210106) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre    | clang-11 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f54a90d848ae25c94cd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f54a90d848ae25c94=
cd6
        failing since 1 day (last pass: next-20210106, first fail: next-202=
10107) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre    | gcc-8    | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff801d6e9da92469bc94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxm=
-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff801d6e9da92469bc94=
cbf
        new failure (last pass: next-20210107) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-baylibre    | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f29bbe662c1c63c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f29bbe662c1c63c94=
cbb
        failing since 51 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-broonie     | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f29c9c3b50ef1ec94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f29c9c3b50ef1ec94=
ccf
        failing since 51 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-cip         | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f290fb211386a3c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f290fb211386a3c94=
cba
        failing since 51 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-collabora   | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f2bfab7b640fb4c94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f2bfab7b640fb4c94=
cc1
        failing since 51 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-versatilepb         | arm    | lab-linaro-lkft | gcc-8    | versat=
ile_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff8087cc1ea6afa65c94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff8087cc1ea6afa65c94=
cc5
        failing since 51 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_x86_64                  | x86_64 | lab-baylibre    | clang-11 | x86_64=
_defconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f28876a9074b60c94cf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/x86_=
64/x86_64_defconfig/clang-11/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/x86_=
64/x86_64_defconfig/clang-11/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f28876a9074b60c94=
cf3
        new failure (last pass: next-20210107) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-10 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7fcde99b747e50bc94d4d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7fcde99b747e50bc94=
d4e
        failing since 21 days (last pass: next-20201208, first fail: next-2=
0201217) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | clang-11 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff8027d2a2820d16bc94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff8027d2a2820d16bc94=
cc1
        failing since 24 days (last pass: next-20201208, first fail: next-2=
0201214) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f76cdc0be7cb24c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f76cdc0be7cb24c94=
cba
        failing since 21 days (last pass: next-20201208, first fail: next-2=
0201217) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7fa3eb83aea2689c94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7fa3eb83aea2689c94=
cc9
        failing since 24 days (last pass: next-20201208, first fail: next-2=
0201214) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff8011dc839120eb4c94cc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-rock2=
-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff8011dc839120eb4c94=
cc1
        failing since 24 days (last pass: next-20201208, first fail: next-2=
0201214) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-10 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff800df9664aecc68c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff800df9664aecc68c94=
cc4
        failing since 21 days (last pass: next-20201208, first fail: next-2=
0201217) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | clang-11 | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff807db41c603f806c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/clang-11/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff807db41c603f806c94=
cc4
        failing since 24 days (last pass: next-20201208, first fail: next-2=
0201214) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f6022965afa34bc94cef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f6022965afa34bc94=
cf0
        failing since 21 days (last pass: next-20201208, first fail: next-2=
0201217) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f7714ed5175c94c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f7714ed5175c94c94=
cc7
        failing since 24 days (last pass: next-20201208, first fail: next-2=
0201214) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff803bf66879606afc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff803bf66879606afc94=
cba
        failing since 24 days (last pass: next-20201208, first fail: next-2=
0201214) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre    | clang-11 | defcon=
fig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7fc2d0cf24dc1bdc94cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7fc2d0cf24dc1bdc94=
cbd
        failing since 57 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
tegra124-nyan-big            | arm    | lab-collabora   | gcc-8    | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5ff7f886ddd964d338c94d26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210108/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5ff7f886ddd964d338c94=
d27
        failing since 21 days (last pass: next-20201208, first fail: next-2=
0201217) =

 =20
