Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E81734C3F2
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 08:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhC2GkP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 02:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhC2Gjq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 02:39:46 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5ABFC061574
        for <linux-next@vger.kernel.org>; Sun, 28 Mar 2021 23:39:45 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 33so2922149pgy.4
        for <linux-next@vger.kernel.org>; Sun, 28 Mar 2021 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KiNuTFOeBWU3bZIqyiPtYBeCUN6oe0qx3jbqda98ygE=;
        b=n43/OKUkYuAUXzmyIzx+3wJICfhAZs9y/tskMfv0dKDMUK+YhF4tWk6kvuEo0ZN9hx
         SdiBDOLwBkX7vXdd5trGaJunffHTWomd5jkubZeXgouQq5bJ1hd3fAhA5tsP+3cC+plU
         IjUw9RwkQymcyYxRy9KL+Xufc8QYQacO7tS/PUWluZyI4gjcmT8GOjVDUzM5Z8oGDkbh
         05F/r8CsC1c9A+RDuFF8S5rMKfN6eW5v0ipDOBWi88qS/+WQelpr1WntYnBriXXbtPUO
         izWoaS8r6rgorW8p3fATtVVpmc12kBojNZ48eF0UlMH0fvaot0ngpUYMEJjIO+injfB6
         dgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KiNuTFOeBWU3bZIqyiPtYBeCUN6oe0qx3jbqda98ygE=;
        b=SDwiUBSuKqH5gyQ4vmz2hgC5RMJmugBXaosPmZj5UNryLKRPxS8LkLZ5efgAxkp2eh
         ejqprhEnoU2tXCjWwBPNLkWyGZfAcaiWV3IJZ/jZsAUZ5y0eZtH1dvWkgxKw19frofff
         4qg85XLUja0EUFq7El1Etu+qQdd7RSJisXoht4tPrSgioysbYhgX3Oqo7sHDO+beqhro
         5bW/aFVlPTxIBTMsbAAtrYQxDMofjbpMxf9PjpjjMnjxBG5K/TnP76dAoUNzvZGxL/VP
         9R13/gJdwpdjxoHFeJNnLnKdBpwiZ6iMlIg6eAyL/uMuTxeYKElbFPlo402Kx+SLfVD6
         3glw==
X-Gm-Message-State: AOAM532YiQEN3bW772gJCq4IPNICqw6X2r2UVCZXi+dSq8PSuFHs7wPn
        q7YdCKQROHnayCqNsoKNL2Qk227CNXRzsg==
X-Google-Smtp-Source: ABdhPJyIDqEaRG17FkzLVwAA1psa6eluoFp4t/LlgALX4U8r/EGcqMbdAZxiTwFTryn1gnQmAAsnQg==
X-Received: by 2002:a62:3246:0:b029:224:6c6f:b3f2 with SMTP id y67-20020a6232460000b02902246c6fb3f2mr12749535pfy.68.1616999985221;
        Sun, 28 Mar 2021 23:39:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 193sm16647344pfa.148.2021.03.28.23.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 23:39:44 -0700 (PDT)
Message-ID: <60617630.1c69fb81.cebcc.a124@mx.google.com>
Date:   Sun, 28 Mar 2021 23:39:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.12-rc4-610-g9320f904087da
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 342 runs,
 4 regressions (v5.12-rc4-610-g9320f904087da)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 342 runs, 4 regressions (v5.12-rc4-610-g9320f9=
04087da)

Regressions Summary
-------------------

platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
imx8mp-evk             | arm64 | lab-nxp      | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =

imx8mp-evk             | arm64 | lab-nxp      | gcc-8    | defconfig       =
             | 1          =

meson-gxl-s905d-p230   | arm64 | lab-baylibre | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l | arm64 | lab-baylibre | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc4-610-g9320f904087da/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc4-610-g9320f904087da
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      9320f904087da573093d4efc9c80d37abb967854 =



Test Regressions
---------------- =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
imx8mp-evk             | arm64 | lab-nxp      | gcc-8    | defconfig+CON...=
OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60613d7b975e250580af02b5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60613d7b975e250580af0=
2b6
        new failure (last pass: v5.12-rc4-454-g68902dae0e76) =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
imx8mp-evk             | arm64 | lab-nxp      | gcc-8    | defconfig       =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/60613f3217b93426fdaf02ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60613f3217b93426fdaf0=
2eb
        failing since 5 days (last pass: v5.12-rc4-316-g8d59c115a79a, first=
 fail: v5.12-rc4-389-ga27dcf51dcf16) =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
meson-gxl-s905d-p230   | arm64 | lab-baylibre | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60613f0718ee097600af02e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60613f0718ee097600af0=
2e7
        new failure (last pass: v5.12-rc4-389-ga27dcf51dcf16) =

 =



platform               | arch  | lab          | compiler | defconfig       =
             | regressions
-----------------------+-------+--------------+----------+-----------------=
-------------+------------
meson-sm1-khadas-vim3l | arm64 | lab-baylibre | gcc-8    | defconfig+CON...=
BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60613e63994b6ca47aaf02b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc4-6=
10-g9320f904087da/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60613e63994b6ca47aaf0=
2b2
        new failure (last pass: v5.12-rc4-454-g68902dae0e76) =

 =20
