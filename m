Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E1038E543
	for <lists+linux-next@lfdr.de>; Mon, 24 May 2021 13:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232675AbhEXLWC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 May 2021 07:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbhEXLWB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 May 2021 07:22:01 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869C0C061574
        for <linux-next@vger.kernel.org>; Mon, 24 May 2021 04:20:33 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id l70so19871199pga.1
        for <linux-next@vger.kernel.org>; Mon, 24 May 2021 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=YFjjagYJq38WTWatXCiylacTPLDAiAMREcVwwZy/K4A=;
        b=0NmORjcfUX4yvnmWvbaK7o/oy9DvLbmBmH/6kbauIUC1xFukrt2MMnYMENENWoxUwe
         00fytr9egDUyU1kA51n1DQuTCRUPAJ8qBu0FSKi+gOeuXbFDT746yS//UiIro1WuhNLD
         jS+1gJP4rAYy97vpvqyQqHEyLqHT4Ew5cZoX8l3SIwMsm5gPVWN2A+31tMszKx7L2bur
         BdaZK+3Pdpqbv1t3NgVkx87m/KGuq5jpvZz7/I0vbvujNfljNX+lYIybt9I//dUHp+Dj
         D5ZX4l0mo/OKvW/6cdcbUffUunX7uVy7p5mxpWYpG9RdhLoGPtZuWJ9tH0VrFRpHPCf/
         m+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=YFjjagYJq38WTWatXCiylacTPLDAiAMREcVwwZy/K4A=;
        b=Rld/Mx7ea28A6MfQwbnS6Uy9XIjFBHB8JYsw4s4CKGKrCrE7VanJsnb+z5Rve2g68j
         d+gOnvdefsYM77Hpk2fZimUGSYcwsks6BcGZA84xS18tpvOu1EhH/yeioThbjsRc756D
         jmTqk+AFxM5saP6y20HRZe1FsKV24QO4DnW5N2yqjLkoG1ZNfp0ChLagK1MpAauAvZrd
         8lxekn6ObafIbwUbAO2CiYYQk1WQgVGvOctUSn1ut1BNYyURsDk3gcUe5Q36EYh89cez
         x9hgvHV2La7BjV2LXAMItEs/SnbLMwd2LC0k2j2oX2EUpJB86GSs3oDMWJeSkAwdHSRR
         oGQw==
X-Gm-Message-State: AOAM532y4slVjZ6B7ykBvG5MKn8Rgyrsii7C5E+UFDw3ttCcHNzHSvmx
        1GNzgxY4lK0l3VZ4h++miy7eUa2QZKLguBjl
X-Google-Smtp-Source: ABdhPJwVVBWR5vlY4EG7ipAfuy3LN1hxRUm4Q3//eech4eNdbfZlns66OjSZhH9aeMU3q90P4DP0rw==
X-Received: by 2002:a63:b10:: with SMTP id 16mr13003537pgl.90.1621855232717;
        Mon, 24 May 2021 04:20:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u1sm11416898pfc.63.2021.05.24.04.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 04:20:32 -0700 (PDT)
Message-ID: <60ab8c00.1c69fb81.d3368.4f53@mx.google.com>
Date:   Mon, 24 May 2021 04:20:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210524
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 339 runs, 9 regressions (next-20210524)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 339 runs, 9 regressions (next-20210524)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =

imx8mp-evk               | arm64 | lab-nxp      | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

imx8mp-evk               | arm64 | lab-nxp      | clang-10 | defconfig     =
               | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =

r8a77960-ulcb            | arm64 | lab-baylibre | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210524/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210524
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      674dc447b09fb668976c6ab1356b11e02ff209ed =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-sabresd            | arm   | lab-nxp      | gcc-8    | imx_v6_v7_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab530c6babadee22b3afa4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab530c6babadee22b3a=
fa5
        failing since 210 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | clang-10 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab5860f76d9dd6afb3afae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab5860f76d9dd6afb3a=
faf
        new failure (last pass: next-20210513) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | clang-10 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab5b93c732a546c6b3afa4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab5b93c732a546c6b3a=
fa5
        failing since 4 days (last pass: next-20210514, first fail: next-20=
210519) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab55dfb05a955583b3af97

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab55dfb05a955583b3a=
f98
        failing since 10 days (last pass: next-20210512, first fail: next-2=
0210513) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab4c8f015532d26eb3afc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab4c8f015532d26eb3a=
fc5
        failing since 187 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab4ca9a242a9ad63b3afb0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab4ca9a242a9ad63b3a=
fb1
        failing since 187 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab514ad1d8609124b3af98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab514ad1d8609124b3a=
f99
        new failure (last pass: next-20210521) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab50324b2532c563b3b022

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab50324b2532c563b3b=
023
        new failure (last pass: next-20210521) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a77960-ulcb            | arm64 | lab-baylibre | clang-12 | defconfig+CON.=
.._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ab57abf88422c005b3afc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210508012545+a1a19=
7b54ec6-1~exp1~20210507233254.88)
  Plain log:   https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-r8a77=
960-ulcb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210524/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-r8a77=
960-ulcb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ab57abf88422c005b3a=
fc9
        new failure (last pass: next-20210521) =

 =20
