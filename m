Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6065351C89
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 20:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236478AbhDASSm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 14:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238587AbhDASJj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Apr 2021 14:09:39 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5990FC004983
        for <linux-next@vger.kernel.org>; Thu,  1 Apr 2021 07:19:33 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso1095759pjb.4
        for <linux-next@vger.kernel.org>; Thu, 01 Apr 2021 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SKvoVDYNcqgdG2H4pnhYxrEEeqr4litShJ5nYiJH3AM=;
        b=v0iwt56YxPzGKIp10iqZ/V5Cv6/PVvjtSdBKHc/GBHXNMp15hp61AfTw1UepUTDyXP
         MLblZblA3JLrgYU8obraTcc6/mbbawon6ArzWQl1Ta1pbQ3hymV7bL21FN/vJq1sXHl4
         YK0p1EXAr02Im4AnTW5KZUoZEil0MKcvAiGTSYe81tfLe/BaZZWzqYAmD/gEBgw/bc4d
         8GXb1TlR2agcXdfC0G/36+lu6JRrL6hcs+vVuziZR/U3OXlOQBz2SsjtUxcaBk5RdEFw
         fHijyNLnXH9IkAAfaXiRypu4fgIX8i3pY0KtygGOYTbAjexA5hr4YhPLafiuyMa9CC1a
         DjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SKvoVDYNcqgdG2H4pnhYxrEEeqr4litShJ5nYiJH3AM=;
        b=DYl/06y6/ANtrdz6EozA271NPHgwXURFWFPaOw5Qpgqa8lpi7+V4osY549liLHpeYC
         liJQSYb+A5p2SHaAFsmRLtUaOb2WM+69ET42ceaT0F1moV2ZYRrGZWTHuwYcI6ARrQVW
         1srbt8r3fWj7X0HcLfx3caBguL9F3XoM4lXW8Wnyv9mdfZyf2+ShrR1GJSU7RC/iWbaH
         uRhojcMMRbsRCCCyh2Miazsek/A3TsuQMgq68ncYQAvE8mGuSKRYa3JnKok0VbHuMnWW
         XW39Lnfm8TbIcXer+oqLQ000ELL58ZeVlT+sGW8S4U/xvNM65NMb9g6dJthWog+V2i90
         Bu2g==
X-Gm-Message-State: AOAM530vtE8LzkmJdJhQ06Cvbr5XxrWY/uFcjbM5D3lPqeRvFOIU9uo2
        kjgKg9ucDGkhWZmnJ/n1qEsMTnoxJaBjXQ==
X-Google-Smtp-Source: ABdhPJx8mr9BWN5W7BGGkGWR6N8FY6RTAS9+2AogYRjAX6jc7Qh3WW53KJAmMFmdBDes0e+hDbqc6g==
X-Received: by 2002:a17:90a:174c:: with SMTP id 12mr8943631pjm.40.1617286772333;
        Thu, 01 Apr 2021 07:19:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a13sm5460562pgm.43.2021.04.01.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:19:32 -0700 (PDT)
Message-ID: <6065d674.1c69fb81.f56df.e002@mx.google.com>
Date:   Thu, 01 Apr 2021 07:19:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20210401
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 335 runs, 7 regressions (next-20210401)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 335 runs, 7 regressions (next-20210401)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig      | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | clang-11 | defconfig+CONFI=
G_EFI=3Dn | 1          =

hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
        | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig    | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig    | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig    | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210401/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210401
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      454c576c3f5e51d60f00a4ac0dde07f4f9d70e9d =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
bcm2837-rpi-3-b-32   | arm   | lab-baylibre    | gcc-8    | bcm2835_defconf=
ig      | 1          =


  Details:     https://kernelci.org/test/plan/id/60659af794abb11c5fdac6b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210401/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210401/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60659af794abb11c5fdac=
6b2
        failing since 7 days (last pass: next-20210324, first fail: next-20=
210325) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | clang-11 | defconfig+CONFI=
G_EFI=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/606598dcec8b3d3bc4dac6ba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_EFI=3Dn
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210401/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210401/risc=
v/defconfig+CONFIG_EFI=3Dn/clang-11/lab-baylibre/baseline-hifive-unleashed-=
a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/606598dcec8b3d3bc4dac=
6bb
        failing since 86 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
hifive-unleashed-a00 | riscv | lab-baylibre    | gcc-8    | defconfig      =
        | 1          =


  Details:     https://kernelci.org/test/plan/id/6065981353dd6d1089dac6c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210401/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210401/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6065981353dd6d1089dac=
6ca
        failing since 8 days (last pass: next-20210312, first fail: next-20=
210323) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60659a11bbfa455a4bdac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60659a11bbfa455a4bdac=
6ce
        failing since 134 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/60659a164b0f3f762fdac6d0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60659a164b0f3f762fdac=
6d1
        failing since 134 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/6065b14a462b041fa3dac6d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6065b14a462b041fa3dac=
6d2
        failing since 134 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch  | lab             | compiler | defconfig      =
        | regressions
---------------------+-------+-----------------+----------+----------------=
--------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig    | 1          =


  Details:     https://kernelci.org/test/plan/id/6065a6006025dc5b41dac6cd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210401/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6065a6006025dc5b41dac=
6ce
        failing since 134 days (last pass: next-20201113, first fail: next-=
20201117) =

 =20
