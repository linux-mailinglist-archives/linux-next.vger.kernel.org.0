Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51CA45D7EE
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 11:05:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354394AbhKYKJI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 05:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354430AbhKYKHI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 05:07:08 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D72BC0613F1
        for <linux-next@vger.kernel.org>; Thu, 25 Nov 2021 02:02:40 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id g19so5427398pfb.8
        for <linux-next@vger.kernel.org>; Thu, 25 Nov 2021 02:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=L4vKUH6ofrpfvMS2B0dpEO1I2Rs+MwbS7b8FsbyDaw8=;
        b=dUIFltFe+kUY3vUyR7gAhMCWovKPJDaXNOyTOU4DCTc9QzSvpiLmlKxzIB3uAIjRIU
         I8lfKuLAQowgWHUV1p0ARZJ6cqMkmvEEBRnyZumV7tyNpuszqXFzgSmrqheKeM7zTd6J
         nBQ8mI4UEGcSO61MNDEBI5rIiDSqg88s71H9SFOrlmZL+N6MMdtmT0M1tnkDRh9YfuTs
         YNs6STbOem+nSFmHc5csigya2iLB0h9O4XKaaMCXmlA01DzU13lPMzn4JJSnwsg4fGHw
         celYA/H0heBhSGktRLoMyC9s5TWDjX1ylQkW/rcSHMYzWPvzP822UbLyPUwLAnJz9GDk
         chXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=L4vKUH6ofrpfvMS2B0dpEO1I2Rs+MwbS7b8FsbyDaw8=;
        b=XsAsaYglNu7JCFVuE1AQ/6zHi8+g1cEHifybeRfmahK6ZxzaWSF5BhGzTH6Nc6WO9z
         wSL7XdOi6syk1304X+LGWVdEt+1j0EBmwhSjGDO/e9iipdUKFAoWD9awJDmlXb0iBQak
         B/XqAskPsZhby5wQD6D5wTG1yu6OrI1b9UoJgGf49PGhnoXyI+RmmagfPa+hzbxNnvzz
         3DuYkpOpTcCrAA9bXj/FC2XryclD6vZhEHs75lkG91+FHXb/qR96lqEpast4rXgnmqHo
         EmN34bktmPX6iCivDvJggQgUT7eOO27UgypmvtKBEmF4VfJ+eXvZ7DVPq65wcCvSR2LF
         q3Cg==
X-Gm-Message-State: AOAM531XmLXeBTVWc1eKtbDo/9s2UgeNj1e5TPNQyRHHmerNplk/m6g6
        ZKit1Bny8o89ZmT7XKyfdT4KeWSK8r701cg+hK8=
X-Google-Smtp-Source: ABdhPJwGJTwRL/jR2PEJfrWyKKc4dmGeMQHMmIC6Oal3Gu+2Dko++Dt340OgHVYC5S2qaBc9GhFUyQ==
X-Received: by 2002:a63:1158:: with SMTP id 24mr15262089pgr.193.1637834559636;
        Thu, 25 Nov 2021 02:02:39 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g22sm2907314pfj.29.2021.11.25.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 02:02:39 -0800 (PST)
Message-ID: <619f5f3f.1c69fb81.af9a5.7e5a@mx.google.com>
Date:   Thu, 25 Nov 2021 02:02:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211125
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 569 runs, 10 regressions (next-20211125)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 569 runs, 10 regressions (next-20211125)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-10   | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre | clang-13 | defconfig         =
           | 1          =

r8a77950-salvator-x  | arm64 | lab-baylibre | gcc-10   | defconfig+ima     =
           | 1          =

zynqmp-zcu102        | arm64 | lab-cip      | clang-13 | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =

zynqmp-zcu102        | arm64 | lab-cip      | clang-13 | defconfig         =
           | 1          =

zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =

zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+crypto  =
           | 1          =

zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =

zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+ima     =
           | 1          =

zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+debug   =
           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211125/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211125
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f81e94e91878bded599cc60f2881cfd50991aeb9 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-10   | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619f26953ea460fc0ff2efb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f26953ea460fc0ff2e=
fb9
        new failure (last pass: next-20211123) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre | clang-13 | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/619f2ee2df23e4aaa1f2efbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig/clang-13/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f2ee2df23e4aaa1f2e=
fc0
        new failure (last pass: next-20211124) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
r8a77950-salvator-x  | arm64 | lab-baylibre | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/619f2a594463e2109ef2efcb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f2a594463e2109ef2e=
fcc
        new failure (last pass: next-20211124) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
zynqmp-zcu102        | arm64 | lab-cip      | clang-13 | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619f2c145115df8757f2efb0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f2c145115df8757f2e=
fb1
        failing since 1 day (last pass: next-20211118, first fail: next-202=
11123) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
zynqmp-zcu102        | arm64 | lab-cip      | clang-13 | defconfig         =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/619f2d686a6741ecf4f2efab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f2d686a6741ecf4f2e=
fac
        failing since 1 day (last pass: next-20211118, first fail: next-202=
11124) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+CON..._6=
4K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619f2687eb67beaa09f2efa3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f2687eb67beaa09f2e=
fa4
        failing since 1 day (last pass: next-20211118, first fail: next-202=
11123) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+crypto  =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/619f2688eb67beaa09f2efa6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f2688eb67beaa09f2e=
fa7
        failing since 1 day (last pass: next-20211118, first fail: next-202=
11123) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+CON...OM=
IZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619f27f0a3cf8122b3f2efbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f27f0a3cf8122b3f2e=
fbc
        failing since 1 day (last pass: next-20211118, first fail: next-202=
11123) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+ima     =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/619f27f0bd4e52ac23f2ef9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f27f0bd4e52ac23f2e=
fa0
        failing since 1 day (last pass: next-20211118, first fail: next-202=
11123) =

 =



platform             | arch  | lab          | compiler | defconfig         =
           | regressions
---------------------+-------+--------------+----------+-------------------=
-----------+------------
zynqmp-zcu102        | arm64 | lab-cip      | gcc-10   | defconfig+debug   =
           | 1          =


  Details:     https://kernelci.org/test/plan/id/619f2dcc8e0d93ba54f2efb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211125/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619f2dcc8e0d93ba54f2e=
fb6
        failing since 1 day (last pass: next-20211118, first fail: next-202=
11123) =

 =20
