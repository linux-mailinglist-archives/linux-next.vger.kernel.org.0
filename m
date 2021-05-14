Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9329E380F64
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 20:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhENSGm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 May 2021 14:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbhENSGl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 May 2021 14:06:41 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543BEC061574
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 11:05:29 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id a11so16516297plh.3
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 11:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ce3ryeU6eJkOs8OC4UK5C8g2nBO9zNZOxboKo5YweHo=;
        b=abXu7KOgXqAkS8zHDJnVnloN8h1Bcnds+KeoGhNHMwAj+mFLLFGN1hVxq+T6dEFwSm
         TmirpuwxhBT4Sc9JHvvWeTafoOk5DgW24U0JYsRi4/GvmOq6fDXPkJPA5MXBT7T/v1uo
         X3M0bflQGYwdPRzI63wye+cDJF0lEgmvmY1zTHHKc3q3k9oup9ev23wr9Hv/PzfKeY+m
         Fag9FyCvkKVSP+EPX9s+7KzBrbVY6+RI7cSmq3Y6yn03PkHxiHS2dCHz4U9N4sSiHLT6
         I25US/Mf8rvR2yLyrq21zaxCsPatKI+VUhuq3SA7MlavgRhwmKs0z8L3mbPTcR4othvb
         Cq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ce3ryeU6eJkOs8OC4UK5C8g2nBO9zNZOxboKo5YweHo=;
        b=fq7yCvSpUMjdpqEOv+w4yK0dvvtw7Fr8PYyk6D6ZI8mx9M5joNVDORdB0Ti+q4jlhH
         YKdah7Z19eqbANCD50U/H5mbEbJoj+wB9Z7iSTBodPFzb55ba/JIPHfLjhkc89wsT6j5
         YZ5Er7gt9Q2TScEKDriGo8wx8/5g7+w12WB8v+AzR2zIDVDxIUAzcE1vAZBnjKr8IbRr
         +4HC86VETkgqyOu+xMA9US7kpgaA+zpRqivwUoNJ8HMjHdLqanV8tUzvba6QfYmNQDIr
         Uy+iKUronRVkVCa3I64HA2JeGIVIwuTS7sW1hTBwkErX2PkPVMQyX90VeMA/TEO27cXs
         LK1w==
X-Gm-Message-State: AOAM531btYWcKV7gRzmEWOP54jcUP4es68PVM0mewz1lq2OpNPulpDw7
        LDcbHa7wBq0QD7W7ZADLh6QbmXnn6UH9lVjA
X-Google-Smtp-Source: ABdhPJyDCJkdsAS94IUXXqNPHSjPw0cI7zHl9ZdWAT5IkJPL/ku6lrK/IB0+DcIJyyvJrVHa1N6KjA==
X-Received: by 2002:a17:902:b412:b029:ef:1737:ed with SMTP id x18-20020a170902b412b02900ef173700edmr38136574plr.43.1621015528550;
        Fri, 14 May 2021 11:05:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o10sm5178291pjl.2.2021.05.14.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 11:05:28 -0700 (PDT)
Message-ID: <609ebbe8.1c69fb81.2b52f.1840@mx.google.com>
Date:   Fri, 14 May 2021 11:05:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210514
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
Subject: next/master baseline: 365 runs, 7 regressions (next-20210514)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 365 runs, 7 regressions (next-20210514)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | clang-12 | defconfig     =
               | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | clang-12 | defconfig     =
               | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210514/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210514
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cd557f1c605fc5a2c0eb0b540610f50dc67dd849 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/609e87e676c85c4d7eb3afb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210508012545+a1a19=
7b54ec6-1~exp1~20210507233254.88)
  Plain log:   https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609e87e676c85c4d7eb3a=
fb3
        failing since 2 days (last pass: next-20210510, first fail: next-20=
210512) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609e85a3b4bb2440dbb3afaa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609e85a3b4bb2440dbb3a=
fab
        failing since 1 day (last pass: next-20210512, first fail: next-202=
10513) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609e8037c9d0f3df18b3afb3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210514/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210514/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609e8037c9d0f3df18b3a=
fb4
        failing since 177 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609e804aafa847fbb9b3af9c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210514/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210514/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609e804aafa847fbb9b3a=
f9d
        failing since 177 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb     | arm   | lab-cip      | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609e8043c9d0f3df18b3afd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210514/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210514/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609e8043c9d0f3df18b3a=
fd2
        failing since 177 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | clang-12 | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/609e877defa6a39022b3af9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210508012545+a1a19=
7b54ec6-1~exp1~20210507233254.88)
  Plain log:   https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig/clang-12/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig/clang-12/lab-cip/baseline-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609e877defa6a39022b3a=
fa0
        new failure (last pass: next-20210513) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/609e8331c7c4ea05cab3afa8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210514/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-r8a774a1-hihop=
e-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609e8331c7c4ea05cab3a=
fa9
        new failure (last pass: next-20210513) =

 =20
