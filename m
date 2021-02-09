Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DBD314B5D
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 10:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbhBIJVE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 04:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbhBIJQh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 04:16:37 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B3BC06178A
        for <linux-next@vger.kernel.org>; Tue,  9 Feb 2021 01:15:56 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id x9so9403868plb.5
        for <linux-next@vger.kernel.org>; Tue, 09 Feb 2021 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CDouO9FAUaqphNHV2NuiCdbjSUrn0cdh95g20vVtw68=;
        b=Z0rh0lZx/fPRBS21g5fshiYeaQgyFzF83V3F5kc6mjhm2m1qgOf9YVWiE7pYx2nY28
         pig2h3aehcUQT52JU0GCEfBliv+3l4VtsoyKA0TZPZhHUv6lJitvijpbIqBRk/IR8OYz
         lk2gVYf2Jk+//hGGcCjuDIdTuzCSUWTU2Eq6L33y2imCvPiU21lbryXkB/S4IO3twafY
         nH/eSp3R8XoSIg88SOLSWHqVTBf968ErwfgVvNnR4tZ+kCrFfJ4KSt4Xwcwl/dIJLM3w
         5h33aHntbitsOmniTCxpe0JJqkCvzIfIxZFHX7ZKZgETl44C067PQ4Ert+XUaAxMt+yz
         H4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CDouO9FAUaqphNHV2NuiCdbjSUrn0cdh95g20vVtw68=;
        b=QTiLHzv1KZlz9OH7f5ej7ADO7ag23vMOddJQw003PhaS82UkVRiUHwA9PmauJXi75N
         GxEhE0ezGUPJdBB/09yXriL9+0Gj8wEOggDAjFNo7Y8OU/hq/qmHIFGWsWLPkOuS99VO
         DSJPYcC4Y8Ay13fHEgqYeFIdOEBoFoZJuWaNJ9drmKtvI4wiN8kLS4mS2sHhiwKnHKJT
         cspgj9Gdhi5CtiFpGOj5/jYjRyLUdE/kx2EyGR0ANtyECF06/gO9K1IIDLxw+nQ3zODK
         ZPakQqEVAsdtNFNvqt/6hieQK+xf2V61hAfbmmG5KCRRWaOuvK++vYWXid93bMh+XI49
         fIhw==
X-Gm-Message-State: AOAM533y9byGyzi8EPhpCgKl5utMqpgawFo4q4bRMcbr+/fYK1mEkzmp
        sJOBQiU25TFlZGPjWDym++jYm9+Ac0jASA==
X-Google-Smtp-Source: ABdhPJxLI/ohwxDaibOiQp6baPUa3AAuHh9QFg/egYUxpqH9kBurmOlQCcu7Xf3WEB3hn9N0uGb8bA==
X-Received: by 2002:a17:90b:11c9:: with SMTP id gv9mr3152827pjb.196.1612862156034;
        Tue, 09 Feb 2021 01:15:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g15sm20556695pfb.30.2021.02.09.01.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 01:15:55 -0800 (PST)
Message-ID: <602252cb.1c69fb81.d050f.e0c1@mx.google.com>
Date:   Tue, 09 Feb 2021 01:15:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.11-rc7-121-gdfed2943da0a
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 166 runs,
 6 regressions (v5.11-rc7-121-gdfed2943da0a)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 166 runs, 6 regressions (v5.11-rc7-121-gdfed29=
43da0a)

Regressions Summary
-------------------

platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 2          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 1          =

imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =

meson-gxl-s905d-p230     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200           | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc7-121-gdfed2943da0a/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc7-121-gdfed2943da0a
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dfed2943da0a57c59d9cdcd390cbbec2bf7d0da5 =



Test Regressions
---------------- =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
bcm2837-rpi-3-b-32       | arm   | lab-baylibre | gcc-8    | bcm2835_defcon=
fig            | 2          =


  Details:     https://kernelci.org/test/plan/id/60221d7a53bfe9a0ff3abe76

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60221d7a53bfe9a=
0ff3abe7c
        new failure (last pass: v5.11-rc6-436-gda0c88a4d23e)
        4 lines

    2021-02-09 05:28:14.185000+00:00  kern  :alert : Unable to handle kerne=
l paging request at virtual address 30240ffe
    2021-02-09 05:28:14.186000+00:00  kern  :ale<8>[   13.856218] <LAVA_SIG=
NAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D4>   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60221d7a53bfe9a=
0ff3abe7d
        new failure (last pass: v5.11-rc6-436-gda0c88a4d23e)
        39 lines

    2021-02-09 05:28:14.193000+00:00  kern  :alert : [30240ffe] *pgd=3D0000=
0000
    2021-02-09 05:28:14.235000+00:00  kern  :emerg : Internal error: Oops: =
80000005 [#1] ARM
    2021-02-09 05:28:14.237000+00:00  kern  :emerg : Process S10udev (pid: =
94, stack limit =3D 0xf7dc103<8>[   13.899133] <LAVA_SIGNAL_TESTCASE TEST_C=
ASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D39>
    2021-02-09 05:28:14.237000+00:00  d)   =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defco=
nfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/602221f0f6d980c77b3abe63

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-v=
ar-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602221f0f6d980c77b3ab=
e64
        new failure (last pass: v5.11-rc6-436-gda0c88a4d23e) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/602223acef32defcff3abe7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602223acef32defcff3ab=
e80
        failing since 19 days (last pass: v5.11-rc4-275-g31be679b2913, firs=
t fail: v5.11-rc4-315-gcbe1658e272d) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-gxl-s905d-p230     | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602223e4ef32defcff3abf76

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602223e4ef32defcff3ab=
f77
        new failure (last pass: v5.11-rc6-436-gda0c88a4d23e) =

 =



platform                 | arch  | lab          | compiler | defconfig     =
               | regressions
-------------------------+-------+--------------+----------+---------------=
---------------+------------
meson-gxm-q200           | arm64 | lab-baylibre | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/602221727e119ac9df3abe81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc7-1=
21-gdfed2943da0a/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/602221727e119ac9df3ab=
e82
        new failure (last pass: v5.11-rc6-436-gda0c88a4d23e) =

 =20
