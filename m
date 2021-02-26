Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB077325C24
	for <lists+linux-next@lfdr.de>; Fri, 26 Feb 2021 04:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBZDt7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 22:49:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBZDt5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 22:49:57 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D416C061574
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 19:49:17 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id g20so4597296plo.2
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 19:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ikfN/7v7LcHVeqvIUnDl+Q8CEA0O5e1EKNdvvD7vUD0=;
        b=egriolem1jRTs497MYeQ6asp7dsCIxJDMG8uFWHGhI4pQ0uFGJvnUvN2DYIWHNjFCV
         V9Hmd7CIXJ1esPI3VHxHrc9vnua0FYLznqvbA0aM5Q/X6rt86bGiSJ0h3J4TOBoQ2cGp
         35lQSGVLOJCrnqwCumUq3mbjhknJrBEseUvUyDeqxyauQSfUu8PSxggAsE6q9h3fyzxM
         kUTHn8dJFtGdAKHjZbHErJ6q8Ygfudak6reKRG+lhHQ9YGTbWjd7e4/60L0IXecWyxpn
         WlyUP/nNbcL5WUwB3e+OGnzwwwBU8n7/i903VTxcLW+3pehm+szuZdoFcEjWqXnm77Ow
         UkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ikfN/7v7LcHVeqvIUnDl+Q8CEA0O5e1EKNdvvD7vUD0=;
        b=ZvAToOPdyjz+jgrWm3f1YrMMtStLFwsGn5E1NJ6xDkMR/cesKX0ByAihOsA+4Migup
         XQNKVkwg3C6k6wIma1USJWTegplB/oAKQHFRS9GM/He1ks5ddfcxrop5Vq/QjL6XZZIr
         EDEC36u9VLyH2znrLadwUWXkPT8FcDK8LW+RalfwZ6awZZ3zpM7WuW0pHLBi1rBiDXY6
         pdNY7lhUnTibgUv172Sld8eqcL8z9MQN7JGRKox2VOCh0kzVgaJaarAUxEB7Ud8MlrmA
         CxjJ23kbdZKrJQLi580RI1mOy5cIXLvK18Wxq4q7XEX6XUBgzVYCRl4i/aPHX5YJa+bH
         fX8A==
X-Gm-Message-State: AOAM531OzVvYRxBUjcgUqVhmlYmpKQ52M3VQsLe6NrzKOKoO0L60+S/C
        N9hEKWocEUUUnhqlajarA5h7+OYSMPhvIw==
X-Google-Smtp-Source: ABdhPJysRQg+9rkfwRRQEAiFXtvmsG7RgE/5+dg4cs/1f82tYSN1xcNZ6CHjhwxrW9pchTI7jnBouA==
X-Received: by 2002:a17:90a:db8f:: with SMTP id h15mr1285802pjv.212.1614311356486;
        Thu, 25 Feb 2021 19:49:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ga17sm7272507pjb.7.2021.02.25.19.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 19:49:16 -0800 (PST)
Message-ID: <60386fbc.1c69fb81.40900.11cb@mx.google.com>
Date:   Thu, 25 Feb 2021 19:49:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-11308-g1e0436e950f3
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 219 runs,
 9 regressions (v5.11-11308-g1e0436e950f3)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 219 runs, 9 regressions (v5.11-11308-g1e0436e9=
50f3)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =

imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =

r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =

r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =

r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-11308-g1e0436e950f3/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-11308-g1e0436e950f3
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1e0436e950f36162c20a569d265cb0c30e27c66a =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60384048ca3d4d7474addcd5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60384048ca3d4d7474add=
cd6
        new failure (last pass: v5.11-9380-gef8173f75639) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx8mp-evk               | arm64 | lab-nxp      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603841d8e6df40bf13addcb7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603841d8e6df40bf13add=
cb8
        failing since 1 day (last pass: v5.11-9380-gef8173f75639, first fai=
l: v5.11-10049-g5933851d9e7bf) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60383ef6f9422bdcc8addd48

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m=
-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774a1-hihope-rzg2m=
-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60383ef6f9422bdcc8add=
d49
        failing since 2 days (last pass: v5.11-647-g6dc8678b08f1f, first fa=
il: v5.11-9380-gef8173f75639) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774a1-hihope-rzg2m-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60383f80b6713398a1addcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774a1-hihope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774a1-hihope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60383f80b6713398a1add=
cc4
        failing since 7 days (last pass: v5.11-629-gdcd372394d935, first fa=
il: v5.11-2286-g3c15bb8df3365) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60383f0037bf8a79d3addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n=
-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774b1-hihope-rzg2n=
-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60383f0037bf8a79d3add=
cbc
        failing since 2 days (last pass: v5.11-647-g6dc8678b08f1f, first fa=
il: v5.11-9380-gef8173f75639) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774b1-hihope-rzg2n-ex | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6038400a39da3d7c12addcce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774b1-hihope-rzg2n-ex.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774b1-hihope-rzg2n-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6038400a39da3d7c12add=
ccf
        failing since 7 days (last pass: v5.11-629-gdcd372394d935, first fa=
il: v5.11-2286-g3c15bb8df3365) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig     =
               | 1          =


  Details:     https://kernelci.org/test/plan/id/60383f0d37bf8a79d3addcca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig/gcc-8/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60383f0d37bf8a79d3add=
ccb
        failing since 2 days (last pass: v5.11-647-g6dc8678b08f1f, first fa=
il: v5.11-9380-gef8173f75639) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a774c0-ek874           | arm64 | lab-cip      | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6038402b5c5c900516addcd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/base=
line-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6038402b5c5c900516add=
cd9
        failing since 7 days (last pass: v5.11-629-gdcd372394d935, first fa=
il: v5.11-2286-g3c15bb8df3365) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
r8a77950-salvator-x      | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603845fcfa5fc12ac3addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-11308=
-g1e0436e950f3/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603845fcfa5fc12ac3add=
cbc
        new failure (last pass: v5.11-10823-g633a3e57c64c0) =

 =20
