Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6978E2F9F08
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 13:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403823AbhARME1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 07:04:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403812AbhARMEH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jan 2021 07:04:07 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D69CC061573
        for <linux-next@vger.kernel.org>; Mon, 18 Jan 2021 04:03:26 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id w14so1040589pfi.2
        for <linux-next@vger.kernel.org>; Mon, 18 Jan 2021 04:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=++xNF69LHsFz1HsbiGFeLwYgHDkeNes4cmNBq8TfE9I=;
        b=bivXKK90JZWPSs0WgLX2b5mQFyeWbXprdLLe3bxbBSpLbh9CBXYGAv9I5uLiV0XhRa
         k0JJW6Ih5jJpbxMviO19xiV/r1CLQuyX6zOk6l7yeBZCON1tAR/Njlz+HDpMyxhXvi6v
         kxnB6Dz5FN15g5avSMxGZHNzbIV28XyMlQvdg0EeN9tMCnpmbPtI9xQm9IIYVnWq6asZ
         EqnMjxWXhSrvDMa7EAsab+aA3jjID9bn1wlJ4sKU7GOcOD10PKTuxvuWpc01lVJAygub
         ge4yrL1v3znMXWFP5/ZMxA7bGKkGvWAPgxLBQcBt0lcIVvfvxcAJ/15uA+HizTnFnibi
         oeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=++xNF69LHsFz1HsbiGFeLwYgHDkeNes4cmNBq8TfE9I=;
        b=t2s2elZkwjlgQwEL8H1dtMQs/BgbAw4KPmiPWNmXkqXb/928QPNRfOthy5NZvqp1U6
         a1zR7BmVQRz0ti2V+lm4fOdRu0l6AxsyxBPYK3g4F7hmmtGqBLQWIxK2QxKMo4l52ENW
         OCm4WjpO8bjUSIDnAD6HBrXXvzPxR2jk8CW9sGLAOGGh2sx2xblsF1yipYwYgtLUvt//
         5i8pwz9i+hKQG24ek2RAHk42x6C88vwJwawhl3PgYww5dlBsL8a4m43zv0/yWsEAJJaA
         cl4awlMPfb+tyq6xMCv0XvaFQbyLSu0Mib1wZeCiuIQY5Q3tAtfvN/kugyZ3cwfBLpTF
         QRjw==
X-Gm-Message-State: AOAM53262Q9bMdI0CZzxRuv/tZ/Thwe6mIVAYnKP125i2RH3r/X1gE4k
        MtGs1c9wO4uq1nnRLhhxO0u6GNI9ByRqbQ==
X-Google-Smtp-Source: ABdhPJzgCz9OWsI+MY1gXtCDPh29/FY9iDUU5hmoSRDO4aq2oUPWBzBBnAm2jC7fP9dPKOkytHA2eg==
X-Received: by 2002:a63:1a44:: with SMTP id a4mr3564219pgm.41.1610971403987;
        Mon, 18 Jan 2021 04:03:23 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a18sm15831732pfg.107.2021.01.18.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 04:03:22 -0800 (PST)
Message-ID: <6005790a.1c69fb81.1dacc.71be@mx.google.com>
Date:   Mon, 18 Jan 2021 04:03:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210118
X-Kernelci-Report-Type: test
Subject: next/master baseline: 701 runs, 94 regressions (next-20210118)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 701 runs, 94 regressions (next-20210118)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre  | clang-11 | defconfi=
g+CONFIG_EFI=3Dn       | 1          =

hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

imx6sll-evk                  | arm    | lab-nxp       | clang-10 | multi_v7=
_defconfig           | 1          =

imx6sll-evk                  | arm    | lab-nxp       | clang-11 | multi_v7=
_defconfig           | 1          =

imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defconfig           | 1          =

imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | clang-10 | defconfi=
g                    | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64  | lab-nxp       | gcc-8    | defconfi=
g                    | 1          =

meson-gxm-q200               | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-gxm-q200               | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 2          =

meson8b-odroidc1             | arm    | lab-baylibre  | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

mt8173-elm-hana              | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

mt8173-elm-hana              | arm64  | lab-collabora | gcc-8    | defconfi=
g                    | 2          =

qemu_arm-versatilepb         | arm    | lab-baylibre  | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-broonie   | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-cip       | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-collabora | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-8    | x86_64_d=
efconfig             | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g                    | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =

rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g                    | 3          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-10 | defconfi=
g                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-11 | defconfi=
g                    | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | gcc-8    | defconfi=
g                    | 1          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210118/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210118
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      93bf8b946e5f9a0b0c68155597b53fd8ccce2827 =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre  | clang-11 | defconfi=
g+CONFIG_EFI=3Dn       | 1          =


  Details:     https://kernelci.org/test/plan/id/60053cba5bfc484a0bc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053cba5bfc484a0bc94=
ccf
        failing since 13 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
hifive-unleashed-a00         | riscv  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60053f57dbddda6d59c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053f57dbddda6d59c94=
cbb
        failing since 13 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | clang-10 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60054362c04f0a6d04c94d59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig/clang-10/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054362c04f0a6d04c94=
d5a
        failing since 4 days (last pass: next-20210108, first fail: next-20=
210114) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | clang-11 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6005497880b45c2c36c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig/clang-11/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005497880b45c2c36c94=
cc0
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/600540192714bca399c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600540192714bca399c94=
cba
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/600544df67497ab83fc94dc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600544df67497ab83fc94=
dc3
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx6sll-evk                  | arm    | lab-nxp       | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6005466d0cd3fd82a2c94cef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005466d0cd3fd82a2c94=
cf0
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600542adcaada3d366c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600542adcaada3d366c94=
cba
        new failure (last pass: next-20210115) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6005446488f456d244c94ce6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005446488f456d244c94=
ce7
        failing since 4 days (last pass: next-20210113, first fail: next-20=
210114) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60054645c9a5909fc7c94cc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054645c9a5909fc7c94=
cc3
        new failure (last pass: next-20210115) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053f78bfa5f2d7fac94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053f78bfa5f2d7fac94=
cea
        new failure (last pass: next-20210113) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
imx8mp-evk                   | arm64  | lab-nxp       | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600541323317a64486c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600541323317a64486c94=
cba
        failing since 10 days (last pass: next-20210107, first fail: next-2=
0210108) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6005406f6d1785ae9fc94d48

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6005406f6d1785a=
e9fc94d4d
        new failure (last pass: next-20210115)
        2 lines

    2021-01-18 08:01:46.022000+00:00  kern  :emerg : Code: bad PC value
    2021-01-18 08:01:46.023000+00:00  <8>[   45.943813] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-18 08:01:46.023000+00:00  + set +x
    2021-01-18 08:01:46.023000+00:00  <8>[   45.948051] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 602645_1.5.2.4.1>
    2021-01-18 08:01:46.127000+00:00  / # #   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6005424f133203757bc94ce3

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6005424f1332037=
57bc94ce7
        new failure (last pass: next-20210115)
        11 lines

    2021-01-18 08:09:45.854000+00:00  kern  :alert : Mem abort inf<8>[   16=
.585586] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dl=
ines MEASUREMENT=3D11>
    2021-01-18 08:09:45.855000+00:00  o:
    2021-01-18 08:09:45.855000+00:00  kern  :alert :   ESR =3D 0x96000007
    2021-01-18 08:09:45.855000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2021-01-18 08:09:45.855000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-18 08:09:45.855000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-18 08:09:45.855000+00:00  kern  :alert : Data abort info:
    2021-01-18 08:09:45.855000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000007   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6005424f1332037=
57bc94ce8
        new failure (last pass: next-20210115)
        2 lines

    2021-01-18 08:09:45.897000+00:00  kern <8>[   16.616557] <LAVA_SIGNAL_T=
ESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-18 08:09:45.897000+00:00   :alert : u<8>[   16.626043] <LAVA_SI=
GNAL_ENDRUN 0_dmesg 602726_1.5.2.4.1>
    2021-01-18 08:09:45.898000+00:00  ser pgtable: 64k pages, 48-bit VAs, p=
gdp=3D0000000030df2400
    2021-01-18 08:09:45.898000+00:00  kern  :alert : [0000000000000378] pgd=
=3D0000000032260003, p4d=3D0000000032260003, pud=3D0000000032260003, pmd=3D=
0000000032310003, pte=3D0000000000000000
    2021-01-18 08:09:45.898000+00:00  kern  :emerg : Internal error: Oops: =
96000007 [#1] PREEMPT SMP   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60054668c9a5909fc7c94ce1

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60054668c9a5909=
fc7c94ce5
        new failure (last pass: next-20210114)
        7 lines

    2021-01-18 08:27:13.684000+00:00  kern  :alert : Mem abort info:
    2021-01-18 08:27:13.684000+00:00  kern  :alert :   ESR =3D 0x86000004
    2021-01-18 08:27:13.684000+00:00  ker<8>[   16.365518] <LAVA_SIGNAL_TES=
TCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D7>
    2021-01-18 08:27:13.684000+00:00  n  :alert :   EC =3D 0x21: IABT (curr=
ent EL), IL =3D 32 bits
    2021-01-18 08:27:13.685000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-01-18 08:27:13.685000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-01-18 08:27:13.685000+00:00  kern  :alert : [007f8000102ad1f8] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60054668c9a5909=
fc7c94ce6
        new failure (last pass: next-20210114)
        2 lines

    2021-01-18 08:27:13.705000+00:00  kern  :emerg : Code: bad PC value
    2021-01-18 08:27:13.731000+00:00  <8>[   16.417989] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-01-18 08:27:13.731000+00:00  + set +x
    2021-01-18 08:27:13.731000+00:00  <8>[   16.425861] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 602819_1.5.2.4.1>
    2021-01-18 08:27:13.835000+00:00  / # #   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson8b-odroidc1             | arm    | lab-baylibre  | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/600544c8f2c06bf29bc94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-meson8b-odroi=
dc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600544c8f2c06bf29bc94=
cc0
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/600541d6f15ffdf1c0c94cc3

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/600541d7f15ffdf1c0c94cdb
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
541d7f15ffdf1c0c94ce1
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:07:48.095000+00:00  /lava-3080880/1/../bin/lava-test-case
    2021-01-18 08:07:48.104000+00:00  <8>[   27.474358] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/600541ea83a7f52793c94cec

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-mt81=
73-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-mt81=
73-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/600541ea83a7f52793c94d04
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:08:05.379000+00:00  /lava-3080886/1/../bin/lava-test-case
    2021-01-18 08:08:05.388000+00:00  <8>[   26.339938] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
541ea83a7f52793c94d0a
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:08:06.491000+00:00  /lava-3080886/1/../bin/lava-test-case=
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60053d94fb7f0ff44ac94cb9

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-mt8173-=
elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60053d94fb7f0ff44ac94cd1
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-18 07:49:30.935000+00:00  <8>[   26.390523] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
53d94fb7f0ff44ac94cd7
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-18 07:49:32.042000+00:00  /lava-3080724/1/../bin/lava-test-case=
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
mt8173-elm-hana              | arm64  | lab-collabora | gcc-8    | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/60053f1db7c0f0e86bc94cb9

  Results:     18 PASS, 10 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.clk-mt8173-mm-probed: https://kernelci.org/test/case/id=
/60053f1db7c0f0e86bc94cd1
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-18 07:56:09.475000+00:00  /lava-3080761/1/../bin/lava-test-case
    2021-01-18 07:56:09.483000+00:00  <8>[   26.361091] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dclk-mt8173-mm-probed RESULT=3Dfail>   =


  * baseline.bootrr.mtk-mmsys-probed: https://kernelci.org/test/case/id/600=
53f1db7c0f0e86bc94cd7
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-18 07:56:10.586000+00:00  /lava-3080761/1/../bin/lava-test-case
    2021-01-18 07:56:10.595000+00:00  <8>[   27.472696] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dmtk-mmsys-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-baylibre  | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60053f1b3020d94067c94d3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053f1b3020d94067c94=
d3b
        failing since 61 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-broonie   | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60053f381253774681c94cdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053f381253774681c94=
cde
        failing since 61 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-cip       | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60053f2ab7c0f0e86bc94cf4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053f2ab7c0f0e86bc94=
cf5
        failing since 61 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb         | arm    | lab-collabora | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60054165f6f87e588dc94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054165f6f87e588dc94=
cd4
        failing since 61 days (last pass: next-20201113, first fail: next-2=
0201117) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi             | x86_64 | lab-baylibre  | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60053dc96dbf4b9b54c94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053dc96dbf4b9b54c94=
cbe
        new failure (last pass: next-20210115) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre  | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60053f4b376287e59ac94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053f4b376287e59ac94=
cd4
        new failure (last pass: next-20210115) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600540dd2970a74c27c94cf5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600540dd2970a74c27c94=
cf6
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600542ad6113f52733c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600542ad6113f52733c94=
cba
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600542e640f1a72aa8c94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600542e640f1a72aa8c94=
cd3
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6005475cf3a17691a0c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005475cf3a17691a0c94=
cc0
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053e7f8097ed63fcc94cc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hiho=
pe-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053e7f8097ed63fcc94=
cc2
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60053ffe074ddb04b8c94cd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053ffe074ddb04b8c94=
cd6
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6005415df6f87e588dc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005415df6f87e588dc94=
ccf
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600542c16113f52733c94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600542c16113f52733c94=
cbe
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6005441e932ffa1646c94cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774b1-h=
ihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005441e932ffa1646c94=
cbd
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60054762665d3ba4dcc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054762665d3ba4dcc94=
cba
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053e85c707645110c94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774b1-hiho=
pe-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053e85c707645110c94=
cc5
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774b1-hihope-rzg2n-ex     | arm64  | lab-cip       | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60053ffeaf0dfbbccac94cf1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053ffeaf0dfbbccac94=
cf2
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600541718e2cdfc207c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600541718e2cdfc207c94=
cba
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600542eb40f1a72aa8c94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600542eb40f1a72aa8c94=
cd8
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6005443433efc088c3c94cbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005443433efc088c3c94=
cbc
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60054769665d3ba4dcc94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054769665d3ba4dcc94=
cc9
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053e91c707645110c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053e91c707645110c94=
ccd
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a774c0-ek874               | arm64  | lab-cip       | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60054005074ddb04b8c94ce3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054005074ddb04b8c94=
ce4
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600542632fab53748bc94cf3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600542632fab53748bc94=
cf4
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600543ac69799a164dc94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600543ac69799a164dc94=
cc4
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6005463ec9a5909fc7c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005463ec9a5909fc7c94=
cc0
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600548cb0503a6d6fcc94cbc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600548cb0503a6d6fcc94=
cbd
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053e4235fbdd3d5cc94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77950=
-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77950=
-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053e4235fbdd3d5cc94=
cca
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77950-salvator-x          | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60053fcb9df8bcb432c94cd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053fcb9df8bcb432c94=
cd9
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60054110b589202ab8c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054110b589202ab8c94=
cba
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600542a00af1e177adc94cfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600542a00af1e177adc94=
cff
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600543e1e9907557a2c94d34

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600543e1e9907557a2c94=
d35
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6005473efc2faef160c94dc1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005473efc2faef160c94=
dc2
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053e4905f527a5cdc94ce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77960=
-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-r8a77960=
-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053e4905f527a5cdc94=
ce1
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
r8a77960-ulcb                | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60053fcea6015d0485c94d07

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-r8a77960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053fcea6015d0485c94=
d08
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/6005405e6d1785ae9fc94cd5

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
005405f6d1785ae9fc94d0a
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:01:28.362000+00:00  /lava-3080811/1/../bin/lava-test-case
    2021-01-18 08:01:28.373000+00:00  <8>[   23.235987] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6005405f6d1785ae9fc94d15
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:01:29.629000+00:00  /lava-3080811/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6005405f6d1785ae9fc94d17
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:01:30.683000+00:00  /lava-3080811/1/../bin/lava-test-case=
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-10 | defconfi=
g                    | 3          =


  Details:     https://kernelci.org/test/plan/id/600541ca6786168a2bc94d0d

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
00541cb6786168a2bc94d42
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:07:32.442000+00:00  <8>[   22.988648] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/600541cb6786168a2bc94d4d
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:07:33.681000+00:00  <8>[   24.227359] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/600541cb6786168a2bc94d4f
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/600542ca0e6246257dc94ccd

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
00542ca0e6246257dc94d02
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/600542ca0e6246257dc94d0d
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:11:49.030000+00:00  <8>[   24.627981] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/600542ca0e6246257dc94d0f
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:11:50.070000+00:00  /lava-3080890/1/../bin/lava-test-case=
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | clang-11 | defconfi=
g                    | 3          =


  Details:     https://kernelci.org/test/plan/id/6005473ad9f6798222c94ceb

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
005473ad9f6798222c94d20
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/6005473ad9f6798222c94d2b
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:30:44.969000+00:00  /lava-3081141/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/6005473ad9f6798222c94d2d
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111)

    2021-01-18 08:30:46.026000+00:00  <8>[   26.381487] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/60053d9a5c7d6b4613c94cee

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-rk3399-=
gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
0053d9a5c7d6b4613c94d23
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-18 07:49:32.836000+00:00  <8>[   24.264366] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-dp-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/60053d9a5c7d6b4613c94d2e
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-18 07:49:34.084000+00:00  /lava-3080721/1/../bin/lava-test-case
    2021-01-18 07:49:34.096000+00:00  <8>[   25.523793] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-iodomain1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/60053d9a5c7d6b4613c94d30
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111)

    2021-01-18 07:49:35.135000+00:00  /lava-3080721/1/../bin/lava-test-case
    2021-01-18 07:49:35.146000+00:00  <8>[   26.574822] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
rk3399-gru-kevin             | arm64  | lab-collabora | gcc-8    | defconfi=
g                    | 3          =


  Details:     https://kernelci.org/test/plan/id/60053f183020d94067c94cd8

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/6=
0053f183020d94067c94d0d
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =


  * baseline.bootrr.rockchip-iodomain1-probed: https://kernelci.org/test/ca=
se/id/60053f183020d94067c94d18
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-18 07:56:02.620000+00:00  /lava-3080757/1/../bin/lava-test-case=
   =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/60053f183020d94067c94d1a
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112)

    2021-01-18 07:56:03.668000+00:00  /lava-3080757/1/../bin/lava-test-case=
   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600541ae6786168a2bc94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600541ae6786168a2bc94=
ccb
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6005452ea94f131c2bc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005452ea94f131c2bc94=
cba
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600545aa1efe350495c94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600545aa1efe350495c94=
cc7
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/600548ac26c9b2e279c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600548ac26c9b2e279c94=
cdb
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053e6b18f3376456c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053e6b18f3376456c94=
cc0
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64  | lab-baylibre  | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60054131b589202ab8c94ce6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-sun50i-h5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054131b589202ab8c94=
ce7
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-10 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60054136b589202ab8c94d00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60054136b589202ab8c94=
d01
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6005429e0af1e177adc94cf2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-10/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005429e0af1e177adc94=
cf3
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600543f3369d146b7dc94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600543f3369d146b7dc94=
cc5
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | clang-11 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6005473afc2faef160c94dbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/clang-11/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6005473afc2faef160c94=
dbf
        failing since 7 days (last pass: next-20210108, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053e52cc2ba0ec75c94cd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-h5-=
nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053e52cc2ba0ec75c94=
cd4
        failing since 7 days (last pass: next-20210107, first fail: next-20=
210111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h5-nanopi-neo-plus2   | arm64  | lab-clabbe    | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60053fe29794e05bd6c94cf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-h5-nanopi-neo-plus2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053fe29794e05bd6c94=
cf7
        failing since 5 days (last pass: next-20210108, first fail: next-20=
210112) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | clang-11 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/600545adc78f7b1c41c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.0.1-++20201218093139+43ff7=
5f2c3fe-1~exp1~20201218203817.155)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/600545adc78f7b1c41c94=
cc6
        failing since 67 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
sun50i-h6-pine-h64-model-b   | arm64  | lab-baylibre  | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60053f78bfa5f2d7fac94cec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-sun50i-h=
6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60053f78bfa5f2d7fac94=
ced
        failing since 67 days (last pass: next-20201110, first fail: next-2=
0201111) =

 =20
