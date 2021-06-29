Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307CF3B6B9F
	for <lists+linux-next@lfdr.de>; Tue, 29 Jun 2021 02:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhF2AMl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 20:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhF2AMk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Jun 2021 20:12:40 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD0CC061574
        for <linux-next@vger.kernel.org>; Mon, 28 Jun 2021 17:10:13 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id a2so16890254pgi.6
        for <linux-next@vger.kernel.org>; Mon, 28 Jun 2021 17:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=09Vr7KYQE1Q7Pg/rJ3lHRGRs8/J+9SFPdcxklCK/1AI=;
        b=rPVEqVe92BwyFHTpChZ+peZGe6rsgEpDiEA4KjGF6nevBHWUwqh8qXNdNR1QBiVIC+
         h3jR1cCYEqXFHICYh1GTKyS3W8Rh4xhHSakAR/0I0TrbjR7T1sJdRJ1hVZ/8mBhbkHnE
         XCVHdJFG432HWnkmXkUAIyTkTJGH/P+rdfVsA2+Z9mlAN5gu2pyma7NrxDFRAXMvLCIK
         0MB+MApSSLC3n7+rk6oU6tlwZJG9SDyxfSFvAyK8wQCFmGKjtHrwN0i7zxfjtX8ccznx
         Jhie08sIVQrwZEW3HzHYnzCJnBTTWw5ZcIgu+knHVvQPlb0pQ09AJhTy3lusqa72JMbf
         XPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=09Vr7KYQE1Q7Pg/rJ3lHRGRs8/J+9SFPdcxklCK/1AI=;
        b=co5bgsTeFXFI7ZYvML/9gZI+dxT9bB7Kzu2XZ2wiHazvvvPyNSePKn4FXoXS+TrYWI
         +sOuPA2kETSwpSV8lhsLb7TDFT18u5pnmFbQpTtOdmtcgAaJrTooNsktQ4M3rUv1Ilf/
         2diJr0kapsgACdz4BcQB2B+cJsIXZ+6MGJExepwC0ZYhXiF/IzC/Lp1rR6HwyrPbHhcS
         fMkGdCqhiAXfjp+RE8gbF67p55UJFbBtk9yJEJdB06+Dd3rKGh1D8Wd5q7D6T8SDF/Tl
         /oQpjtmBMUZEDeZBfac0cdk0zkgSzuQ1uWzRNd7pPexrH5rcqBIYLFPNuF/UC2bpBvAh
         mySw==
X-Gm-Message-State: AOAM533uxXl1fu47PFmYOs9A0Wwht70q0CA89R2Kv185V7eBcnaFBbzL
        aSUu5hElIbroc4rCwtBpcSKgAEXS3NccTtmY
X-Google-Smtp-Source: ABdhPJy2EVW9XO7NikYK0NbylnUxpMf5QoOnAsOAEwDIyn23DMBji7QpNhkK+vAqH8AJBU1lnY1BkQ==
X-Received: by 2002:a62:d451:0:b029:2ff:4da3:5330 with SMTP id u17-20020a62d4510000b02902ff4da35330mr27396862pfl.6.1624925412760;
        Mon, 28 Jun 2021 17:10:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a31sm15899998pgm.73.2021.06.28.17.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 17:10:12 -0700 (PDT)
Message-ID: <60da64e4.1c69fb81.ecc76.e509@mx.google.com>
Date:   Mon, 28 Jun 2021 17:10:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210628
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 487 runs, 20 regressions (next-20210628)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 487 runs, 20 regressions (next-20210628)

Regressions Summary
-------------------

platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-12 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-12 | defconfig       =
             | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 1          =

hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =

hip07-d05             | arm64 | lab-collabora | clang-10 | defconfig       =
             | 1          =

imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =

imx8mp-evk            | arm64 | lab-nxp       | clang-12 | defconfig       =
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-10 | defconfig       =
             | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 2          =

meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =

rk3328-rock64         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210628/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210628
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      3579aa488520feeda433ceca23ef4704bf8cd280 =



Test Regressions
---------------- =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60da32b870da87439e23bbcf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da32b870da87439e23b=
bd0
        failing since 124 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-10 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60da23b3fd4c5f1d9423bc67

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da23b3fd4c5f1d9423b=
c68
        failing since 11 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-12 | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60da225e327471c50423bbda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da225e327471c50423b=
bdb
        failing since 11 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | clang-12 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60da2827bf3e68ba7d23bbd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da2827bf3e68ba7d23b=
bd9
        failing since 11 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60da207d6c6235c98023bc0d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da207d6c6235c98023b=
c0e
        failing since 11 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60da25075bc3b14acc23bbbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da25075bc3b14acc23b=
bbe
        failing since 11 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre  | gcc-8    | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/60da1fa2b8e5c85a8623bc0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da1fa2b8e5c85a8623b=
c0d
        failing since 18 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre  | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60da1cf622808a9bb923bbbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da1cf622808a9bb923b=
bbe
        failing since 59 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
hip07-d05             | arm64 | lab-collabora | clang-10 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60da57c3a86045127323bbca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-10/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da57c3a86045127323b=
bcb
        failing since 76 days (last pass: next-20210409, first fail: next-2=
0210412) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx6q-sabresd         | arm   | lab-nxp       | gcc-8    | imx_v6_v7_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60da235575388bad2323bbf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da235575388bad2323b=
bf1
        failing since 245 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
imx8mp-evk            | arm64 | lab-nxp       | clang-12 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60da2c351b6064f38723bbd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da2c351b6064f38723b=
bd5
        new failure (last pass: next-20210625) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | clang-10 | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60da244e3cd9ca969623bbca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da244e3cd9ca969623b=
bcb
        new failure (last pass: next-20210625) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron   | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60da262f8e402512a923bbbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontron/baseline-kontron-kb=
ox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da262f8e402512a923b=
bbf
        failing since 3 days (last pass: next-20210624, first fail: next-20=
210625) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
meson-gxbb-p200       | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60da2bed1e0a943c5023bbbe

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxb=
b-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/60da2bed1e0a943c=
5023bbc4
        new failure (last pass: next-20210625)
        1 lines

    2021-06-28T20:06:49.630769  / # =

    2021-06-28T20:06:49.751550  #
    2021-06-28T20:06:49.858403  export SHELL=3D/bin/sh
    2021-06-28T20:06:49.860511  =

    2021-06-28T20:06:49.861730  / # #
    2021-06-28T20:06:49.965575  / # export SHELL=3D/bin/sh. /lava-495737/en=
vironment
    2021-06-28T20:06:50.069749  /lava-495737/bin/lava-test-runner /lava-495=
737/0
    2021-06-28T20:06:50.076068  =

    2021-06-28T20:06:50.077294  / # . /lava-495737/environment
    2021-06-28T20:06:50.080920  / # /lava-495737/bin/lava-test-runner /lava=
-495737/0 =

    ... (8 line(s) more)  =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60da2bed1e0a943=
c5023bbc6
        new failure (last pass: next-20210625)
        2 lines

    2021-06-28T20:06:50.212961  kern  :emerg : Internal error: Oops - BUG: =
0 [#1] PREEMPT SMP
    2021-06-28T20:06:50.214185  kern  :emerg : Code: 54fffd01 aa1b03e0 97f9=
7618 17ffffe5 (d4210000<8>[   16.805718] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-06-28T20:06:50.215508  ) =

    2021-06-28T20:06:50.216720  + set +x<8>[   16.815021] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 495737_1.5.2.4.1>
    2021-06-28T20:06:50.217958     =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
meson-gxl-s905d-p230  | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60da307537c4d467d823bbd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da307537c4d467d823b=
bd6
        new failure (last pass: next-20210625) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre  | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60da1afe20bf8b250523bbda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da1afe20bf8b250523b=
bdb
        failing since 222 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-cip       | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60da1ad8e40c8bbd0223bbe4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da1ad8e40c8bbd0223b=
be5
        failing since 222 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60da1ad2e40c8bbd0223bbdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da1ad2e40c8bbd0223b=
be0
        failing since 222 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab           | compiler | defconfig       =
             | regressions
----------------------+-------+---------------+----------+-----------------=
-------------+------------
rk3328-rock64         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON...=
_64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60da1f1208ac0bb32f23bcb0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210628/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60da1f1208ac0bb32f23b=
cb1
        failing since 13 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =20
