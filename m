Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B519E327753
	for <lists+linux-next@lfdr.de>; Mon,  1 Mar 2021 07:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhCAF7e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Mar 2021 00:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbhCAF73 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Mar 2021 00:59:29 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B7CC06174A
        for <linux-next@vger.kernel.org>; Sun, 28 Feb 2021 21:58:31 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id g4so10831815pgj.0
        for <linux-next@vger.kernel.org>; Sun, 28 Feb 2021 21:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Lu7FBHbqET8OI3ThfQFQdKGuOf4GfXPBhZLEMKo7ah0=;
        b=Abch0QQl5ndXmJJVVvGW7ad0yJvWKFFNkDmLrT5LA3EuT/dGeRY9EL1HC8EMUQzyFc
         7kqmmwFNEDzbGxRfIjk8GjvyIn1wnWw7d51IYAU/w5qTAZyVZeNHCaNQTbi6YNyA+5Oc
         3RnZjt1IGh8gduJTCeTa8t+9xouqFLEFX3fSq+36Uw2ahvAAPTm3/NOs24AQIuujZHtM
         w5mGRxSq4IvrOrAJLQzJAoyVfSVumwXV6IWbKR2MRnbKJ7KKgD52qZ+bveHpBynwjCqz
         eN34nZdLHSMx5P328pvfsPJ1LQxwzjx/5dVxSJkkMmTfzjM5A5NYNKQ+Hnto+wUwFP/o
         eJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Lu7FBHbqET8OI3ThfQFQdKGuOf4GfXPBhZLEMKo7ah0=;
        b=Ul7I5a/uSp8xuXfNz1QYnnj+Y3PkWQjRuYMbDUKO4l5XmSNwfbUStRbSE5Fr9ZO48i
         xNejmmbfggPyxCV06uMGZhue1+bhk772UiFXcqUmGedGYNA384wbFJIpY7eYqH1LBG3H
         67HHQ4MSt52SIzVh631yeAhQWNlDsufELlxLX0hEyNE2krh3xYx+MgLesZIx+KiZiaDo
         XDT26y0uTqownguzEqgHXTF0PhdZxjviDdTAEgejBXbcdsO6rbx7g/Qu/LyPFexJ9FHC
         dIGcVSydBD6esVnRDrzobg/Z4OVRKwxP3e0KXcP58PDBs2mlZL8iJvCG9dyZzdrv/Ujw
         7yFA==
X-Gm-Message-State: AOAM533g5qjS8y/5ySWP18iySbjEOjupqV3nDnWocZDqbqOB6aXN1sed
        B0pWR+KEABcy4+4o4T4TsEwBVjasPOnSCA==
X-Google-Smtp-Source: ABdhPJx7SM9y06MW7cMPo6oDuXqmM3Eaf30RkJEDN46FczMcEmNWUB1NAEzPp/XnCKeApEvmBuEH/g==
X-Received: by 2002:a63:e554:: with SMTP id z20mr12468641pgj.448.1614578310918;
        Sun, 28 Feb 2021 21:58:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id n6sm16402475pfo.201.2021.02.28.21.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 21:58:30 -0800 (PST)
Message-ID: <603c8286.1c69fb81.6d90c.7307@mx.google.com>
Date:   Sun, 28 Feb 2021 21:58:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210301
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 372 runs, 12 regressions (next-20210301)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 372 runs, 12 regressions (next-20210301)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp      | clang-10 | defconfig =
                   | 1          =

meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-10 | defconfig =
                   | 1          =

r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-11 | defconfig =
                   | 1          =

r8a774c0-ek874               | arm64 | lab-cip      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210301/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210301
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      26ada2d1f143b558aa64c68f87c9f1335c1226eb =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603c42d1ed16b09154addd23

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c42d2ed16b09154add=
d24
        failing since 55 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c44b7cb75f9a30aaddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c44b7cb75f9a30aadd=
cb2
        failing since 6 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
imx8mp-evk                   | arm64 | lab-nxp      | clang-10 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603c498f03f83783feaddcb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c498f03f83783feadd=
cb3
        failing since 6 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-khadas-vim   | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c48fbed663ede55addcd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c48fbed663ede55add=
cd6
        new failure (last pass: next-20210226) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
meson-gxl-s905x-libretech-cc | arm64 | lab-baylibre | gcc-8    | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c47204b1f5689d4addcc2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-meson-gxl=
-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c47204b1f5689d4add=
cc3
        new failure (last pass: next-20210226) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c43f358f6dfd020addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774a1-h=
ihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c43f358f6dfd020add=
cb2
        failing since 48 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-10 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603c728cca8cc6141daddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig/clang-10/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c728cca8cc6141dadd=
cb2
        failing since 48 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774a1-hihope-rzg2m-ex     | arm64 | lab-cip      | clang-11 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603c72d81699d772c6addcda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig/clang-11/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c72d81699d772c6add=
cdb
        failing since 48 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
r8a774c0-ek874               | arm64 | lab-cip      | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c44068acc6e1143addcde

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-cip/baseline-r8a774c0-e=
k874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c44068acc6e1143add=
cdf
        failing since 48 days (last pass: next-20210108, first fail: next-2=
0210111) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c44ac70e4ee0ca8addce1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c44ac70e4ee0ca8add=
ce2
        failing since 18 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe   | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c467801e9717a13addcb8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c467801e9717a13add=
cb9
        failing since 18 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                     | arch  | lab          | compiler | defconfig =
                   | regressions
-----------------------------+-------+--------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b   | arm64 | lab-baylibre | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603c4aaeed50b08fbbaddcd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210301/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603c4aaeed50b08fbbadd=
cd1
        failing since 109 days (last pass: next-20201110, first fail: next-=
20201111) =

 =20
