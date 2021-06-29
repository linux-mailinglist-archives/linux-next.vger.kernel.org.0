Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C6C3B79DD
	for <lists+linux-next@lfdr.de>; Tue, 29 Jun 2021 23:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbhF2Vbm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Jun 2021 17:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbhF2Vbl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Jun 2021 17:31:41 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E9EC061760
        for <linux-next@vger.kernel.org>; Tue, 29 Jun 2021 14:29:12 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id g24-20020a17090ace98b029017225d0c013so1590311pju.1
        for <linux-next@vger.kernel.org>; Tue, 29 Jun 2021 14:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jzGcUuV8iY63CRvq+qu8fB3ZnuCsZVTmGdbwwWGBbLE=;
        b=eOk9cVg8yYkUoIXviYU/hcijd4UEjPiGWqgpF766iRJK8fwCQCUB4oIQtiSfrlYFOr
         +KnXFm/UzCaxwjvpwYLTRHk6PY3EU9JI3WXIltqHPs5acCN/C/Jk1s9kBgXPeKiVbsNr
         QY4QctoQfaR8rP2t5HK5DakMYhWMYs/wzMFIHBeYdOI4Qb0NVNK5gduX3k2oycdrqf3p
         vrJnOe54d/IeDvag9mFKRR0u2603/KxNKDWRr9IrkiMPdLqzvgdZX0S1EdFxfzj2+ZyM
         +YjW1UdhLNo+XnOKlrTtOC4JtVEJNafYwS373DOU8pmQK+7kVLcaVQDjk57cHQ/VoFMD
         YvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jzGcUuV8iY63CRvq+qu8fB3ZnuCsZVTmGdbwwWGBbLE=;
        b=njTmSEp3qSms/Rwy7gz+s05YPaWbnPtK0zNBWDCybjcSwJiNKFQvoNHyY4f8JYIusK
         Gt/hKULsgQagHHoiiiuefAzIRYqMyjUeaTvn6A+cSvEf+pB80GQ4ohAnH6/xkJMfsSw9
         b6QWg40R/LbjxQuFKXgx7Mpn0uT8a9lpYMmYICgKinBLZaHJND65BraK6Hs4tZZ8OpZN
         W3TQ6pvIxllrJAowTe5P0cuVzQMY8KWIHty0UfMW3Q0S3Vgdfe0rJ1YP1+nbVn0KsLdH
         oOX5LIL18DDxBY4W32uU39O8q5kpqJnVbsU/UFOgRFrkfi4hjz72od3sjRulG6kybIwQ
         aiYA==
X-Gm-Message-State: AOAM530+f/jLatzgTXCQNEviC77c9gRpPO2rvn9ePCyclmabyiYJAzgk
        UiGwOVx7ugdUg+486R7ITNoI6RnISGkhxaed
X-Google-Smtp-Source: ABdhPJxYp8Xfy4fBSK17ruQK/H0KHXWvzlGoSXwTVb7guVPRLdoTWgaY2JTB6OtJIZl0h1++qAvL5Q==
X-Received: by 2002:a17:902:8601:b029:11c:4b4:e967 with SMTP id f1-20020a1709028601b029011c04b4e967mr29836466plo.75.1625002151761;
        Tue, 29 Jun 2021 14:29:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g11sm19939602pgj.3.2021.06.29.14.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 14:29:11 -0700 (PDT)
Message-ID: <60db90a7.1c69fb81.14ba4.acf8@mx.google.com>
Date:   Tue, 29 Jun 2021 14:29:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210629
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 580 runs, 20 regressions (next-20210629)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 580 runs, 20 regressions (next-20210629)

Regressions Summary
-------------------

platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-10 | defconfig     =
               | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-12 | defconfig     =
               | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =

bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =

hifive-unleashed-a00  | riscv | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =

imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-10 | defconfig     =
               | 1          =

kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig     =
               | 1          =

meson-gxbb-p200       | arm64 | lab-baylibre    | clang-10 | defconfig     =
               | 1          =

qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =

r8a77950-salvator-x   | arm64 | lab-baylibre    | clang-10 | defconfig     =
               | 1          =

rk3328-rock64         | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210629/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210629
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      73748627df83aab934c81332ca83a44ab8c7b3e3 =



Test Regressions
---------------- =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2836-rpi-2-b       | arm   | lab-collabora   | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60db50cf4e6bf2263a23bbdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db50cf4e6bf2263a23b=
bdd
        failing since 124 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60db52205a8ea61e7923bbd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-baylibre/baseline-bcm28=
37-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db52205a8ea61e7923b=
bd7
        failing since 12 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db56d1bbf47168b323bbf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db56d1bbf47168b323b=
bf9
        failing since 12 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db58252c13e722cf23bbdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210626052608+b7c7b=
42db1d1-1~exp1~20210626034043.129)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db58252c13e722cf23b=
be0
        failing since 12 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60db4d4728e572fbb123bbdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db4d4728e572fbb123b=
bdc
        failing since 12 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60db557cf32f53bc7723bbee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db557cf32f53bc7723b=
bef
        failing since 12 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b       | arm64 | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db59798b64e91ae823bbe8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db59798b64e91ae823b=
be9
        failing since 12 days (last pass: next-20210611, first fail: next-2=
0210617) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32    | arm   | lab-baylibre    | gcc-8    | bcm2835_defcon=
fig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60db4dc1b3e5521dfd23bbca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db4dc1b3e5521dfd23b=
bcb
        failing since 19 days (last pass: next-20210609, first fail: next-2=
0210610) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
hifive-unleashed-a00  | riscv | lab-baylibre    | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db501f5d57513d4323bbbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db501f5d57513d4323b=
bbe
        failing since 60 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx6q-sabresd         | arm   | lab-nxp         | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60db53fc988ffb2ec723bbd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db53fc988ffb2ec723b=
bd8
        failing since 246 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
imx8mp-evk            | arm64 | lab-nxp         | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60db5ba87314114c8d23bbc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db5ba87314114c8d23b=
bc3
        new failure (last pass: next-20210628) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db578e24b6d5c02e23bbc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db578e24b6d5c02e23b=
bca
        failing since 0 day (last pass: next-20210625, first fail: next-202=
10628) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
kontron-kbox-a-230-ls | arm64 | lab-kontron     | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db5ab0c8710c267223bbbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db5ab0c8710c267223b=
bc0
        new failure (last pass: next-20210624) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
meson-gxbb-p200       | arm64 | lab-baylibre    | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db676887a2609cdc23bc35

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db676887a2609cdc23b=
c36
        new failure (last pass: next-20210628) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-baylibre    | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60db50de6ee9b9ab5823bbc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db50df6ee9b9ab5823b=
bc5
        failing since 223 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-cip         | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60db4b5dc1afc31e1523bbca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db4b5dc1afc31e1523b=
bcb
        failing since 223 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-collabora   | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60db4c047426baffc123bbd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db4c047426baffc123b=
bd1
        failing since 223 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb  | arm   | lab-linaro-lkft | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60db516d9ddf7d63d323bbd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db516d9ddf7d63d323b=
bd4
        failing since 223 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
r8a77950-salvator-x   | arm64 | lab-baylibre    | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60db5ee4fc23d8bb5523bbc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db5ee4fc23d8bb5523b=
bc3
        new failure (last pass: next-20210628) =

 =



platform              | arch  | lab             | compiler | defconfig     =
               | regressions
----------------------+-------+-----------------+----------+---------------=
---------------+------------
rk3328-rock64         | arm64 | lab-baylibre    | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60db4c346b2cfdebab23bbe7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210629/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60db4c346b2cfdebab23b=
be8
        failing since 14 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =20
