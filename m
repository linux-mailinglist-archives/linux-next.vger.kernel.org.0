Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4815534379A
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 04:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCVDsF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 23:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhCVDru (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Mar 2021 23:47:50 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAEAC061574
        for <linux-next@vger.kernel.org>; Sun, 21 Mar 2021 20:47:50 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id r17so7757427pgi.0
        for <linux-next@vger.kernel.org>; Sun, 21 Mar 2021 20:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Vk3HbNn4+Yz1vAS7qBpjXcdmyUEt6+mwx7AjUaK/6yE=;
        b=MU5fqaS+RXHJRaGoPXnQGKlw1yUYQTDWZ7I88OosLeXQPWq2hC/Vu6L7INSq8txidR
         05wrLT9oycwcwlPUXrXCOdnYvIHWT6xkl9F7a5cIBHxs088dIvfKkLtg6/f/mlQUzn1r
         f0/T3H4/9ezpyFl1L6E22FkmmlOCMxITaDbieZZooCghFtVnjLj49E8TjYoR9qLty9XH
         NcWSC2hYHZ3Vd+CIzrE5jIZhTcilEkjhveEvjmCLxBvu3Yo3S2RXUcpx7jKRt7BVJJbZ
         LPykMheikOHrqCzv5atoksHRMTf5e5cqhwiM6HtcLN/yZ9D8adV2324kTxx+SMeLmNuZ
         5Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Vk3HbNn4+Yz1vAS7qBpjXcdmyUEt6+mwx7AjUaK/6yE=;
        b=Ns6/QK8d5WtEiMxROKwJzHHLok4hNpRko/8+K2J+Ji3ZtvFDiexhckl9MKc5YK8XOG
         B0nUa76hZYX1LzU8EislobyohCnSRp4nmkZ5npoU7yz+A4RZPHLfDPiw/Je9JictUFc1
         d3sJguKIQcDyyV5vkTzRe9CUTjk+j46HF1zCMwdjxLp8AStwAZmHcnzD+2eAJzWKuLy2
         kxkULm7RA/YenG3ARWAr12MHHVNPoQGLG9vEcTTrJYPbSW+t4y/v1xPFnYZTjtb41KCk
         iyBhDnJQbEgwlG8QpkaO9XFL0V1QooO0VRbfUEcM33zUn0Dg86EqVTHurxfGBN//UKRu
         8Jzw==
X-Gm-Message-State: AOAM530mfuvjOySWZbIyeKAo1t2WqXyyqEX8iHdGFEV1F4YOV8oIr65s
        VrBV8dl97XGa/Cahe/TKDWKYmYBfGVsTMg==
X-Google-Smtp-Source: ABdhPJztfInjshfxHo7yejPhFdbuhH2wloQ8wOaNVPFOHaJIigrZy4NuBFXPwqZmzR5EnAFu+XCbZQ==
X-Received: by 2002:aa7:9841:0:b029:1f8:f326:a3b3 with SMTP id n1-20020aa798410000b02901f8f326a3b3mr19576923pfq.7.1616384869319;
        Sun, 21 Mar 2021 20:47:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l25sm2383748pgu.72.2021.03.21.20.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 20:47:48 -0700 (PDT)
Message-ID: <60581364.1c69fb81.13a54.6a68@mx.google.com>
Date:   Sun, 21 Mar 2021 20:47:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc4-294-g4fdba9ae9794
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 370 runs,
 14 regressions (v5.12-rc4-294-g4fdba9ae9794)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 370 runs, 14 regressions (v5.12-rc4-294-g4fdba=
9ae9794)

Regressions Summary
-------------------

platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =

r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc4-294-g4fdba9ae9794/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc4-294-g4fdba9ae9794
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4fdba9ae979419717d0a192f73f14b78540c4b6b =



Test Regressions
---------------- =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx6ul-pico-hobbit         | arm   | lab-pengutronix | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dceaf15928a786addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/imx_v6_v7_defconfig/gcc-8/lab-pengutronix/baseline-imx=
6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dceaf15928a786add=
cb2
        new failure (last pass: v5.12-rc3-420-gc8c0b27c5173) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
imx8mp-evk                 | arm64 | lab-nxp         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6057ded7fc5a877da5addd0e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/ba=
seline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057ded7fc5a877da5add=
d0f
        failing since 2 days (last pass: v5.12-rc3-369-g92c4e9f16f369, firs=
t fail: v5.12-rc3-420-gc8c0b27c5173) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim | arm64 | lab-baylibre    | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6057e3937afed2a05faddcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057e3937afed2a05fadd=
cc2
        new failure (last pass: v5.12-rc3-420-gc8c0b27c5173) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-baylibre    | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dbb74d7956f6a2addcb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dbb74d7956f6a2add=
cb8
        failing since 125 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-broonie     | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dbba5081fbfb11addcb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dbba5081fbfb11add=
cba
        failing since 125 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-cip         | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dbc0c1c2b0195daddcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dbc0c1c2b0195dadd=
cbc
        failing since 125 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-collabora   | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6057eba4103bfe4f5baddccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057eba4103bfe4f5badd=
cce
        failing since 125 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb       | arm   | lab-linaro-lkft | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6057db573ae0f8fed9addcc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057db573ae0f8fed9add=
cc2
        failing since 125 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6057ebbbf49cafa778addcc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057ebbbf49cafa778add=
cca
        failing since 31 days (last pass: v5.11-629-gdcd372394d935, first f=
ail: v5.11-2286-g3c15bb8df3365) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6057ecbfa52aa9dbd7addcbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg=
2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057ecbfa52aa9dbd7add=
cbe
        failing since 26 days (last pass: v5.11-647-g6dc8678b08f1f, first f=
ail: v5.11-9380-gef8173f75639) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dd849746580c96addcb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dd859746580c96add=
cb7
        failing since 31 days (last pass: v5.11-629-gdcd372394d935, first f=
ail: v5.11-2286-g3c15bb8df3365) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774b1-hihope-rzg2n-ex   | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dfa338739b7237addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg=
2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dfa338739b7237add=
cb2
        failing since 26 days (last pass: v5.11-647-g6dc8678b08f1f, first f=
ail: v5.11-9380-gef8173f75639) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dd839746580c96addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/ba=
seline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dd839746580c96add=
cb2
        failing since 31 days (last pass: v5.11-629-gdcd372394d935, first f=
ail: v5.11-2286-g3c15bb8df3365) =

 =



platform                   | arch  | lab             | compiler | defconfig=
                    | regressions
---------------------------+-------+-----------------+----------+----------=
--------------------+------------
r8a774c0-ek874             | arm64 | lab-cip         | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6057dfb5eccdc39ffaaddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-2=
94-g4fdba9ae9794/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6057dfb5eccdc39ffaadd=
cb2
        failing since 26 days (last pass: v5.11-647-g6dc8678b08f1f, first f=
ail: v5.11-9380-gef8173f75639) =

 =20
