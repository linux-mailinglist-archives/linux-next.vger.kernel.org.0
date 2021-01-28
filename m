Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5269B306B58
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 04:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhA1DDl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 22:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhA1DDj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 22:03:39 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FB1C061574
        for <linux-next@vger.kernel.org>; Wed, 27 Jan 2021 19:02:59 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id n10so3323649pgl.10
        for <linux-next@vger.kernel.org>; Wed, 27 Jan 2021 19:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=j9Lh2nnzVV3DAu1djVhkcSE/sjpCPRp5H65zGSw61pg=;
        b=HS1o7hAegDit89svX/95xdBd4V3g03F2Hy95AKjbIN8RRJlXiNgdjd3WaR+I3e+Wdi
         S8qefnG7+ESgJXAHwRV0TVt3VXjf355Fe56Oi0v3cc2KKID2kEnakPvJh4ISFFETFl8N
         /rGeenCzKnnM3aL9VbXi/tYOf4b7jxqCFIUG9M7MbPfpCnp87kPhqVxNgftLAc1SX0r6
         ag3oJD5gaERy2wMe+Ixliqod7xzT54ZBnrVsfYoPDcGRc0sqTzb5vYsags2omdjguBY1
         999L8tkKVGYI5w978MrAgAcyZP8Us/LGEHq5R7uemQlT+zP9apHNaajzC+ZIX/qV2GXS
         n0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=j9Lh2nnzVV3DAu1djVhkcSE/sjpCPRp5H65zGSw61pg=;
        b=p6DPM4hUvFlAdvmKkFKk4fOdSecLIsnKaLn8VliydGgaISY4jWcs2PDL2+UoDdwGP/
         L9RHeXVp2t5z6kBwbRpESp4/pACPWJmV0UNOnpi6bmNhRnEeK3JiF8XnXwcVevm/mcY2
         fjAEn7I+EzPw/PGllTLolS4GqcD/4ZM1ybBr4PfGSax2dfN9Vs9G+yLgzr1JDgrGkmlB
         5HyCnOiuDhcfAPt3bzmjzIE51y8nkJvQuitNBwAYaX/KLXjhEhceG824oyp91hVX50X5
         uHmBN/xf65FzTTDuuDhGxOOXO4TUHuisPNn9V0e4xgEllMNmHoqXLHwqLIkBF/0mlyvy
         5ZSg==
X-Gm-Message-State: AOAM530nFa3AnV2TNVLfg/k9KZVFZ9Ymmj91g8lrg7IiF3ntXpRrdEUa
        zV/OecirISzGi0J1C5naUbvxDhqn1ouBAyBn
X-Google-Smtp-Source: ABdhPJw4eK9nAyOF3/9YUxFP4TYPHLEqeoHvUlbuf5jgvlHGdCLJwO5IEG8QzfHpWC6VEULk+9JzWQ==
X-Received: by 2002:a63:1d47:: with SMTP id d7mr14372093pgm.251.1611802978722;
        Wed, 27 Jan 2021 19:02:58 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fh15sm3228672pjb.32.2021.01.27.19.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 19:02:58 -0800 (PST)
Message-ID: <60122962.1c69fb81.febb5.8647@mx.google.com>
Date:   Wed, 27 Jan 2021 19:02:58 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.11-rc5-322-gc9df5fe15328c
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 302 runs,
 10 regressions (v5.11-rc5-322-gc9df5fe15328c)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 302 runs, 10 regressions (v5.11-rc5-322-gc9df5=
fe15328c)

Regressions Summary
-------------------

platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig           | 2          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =

imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =

qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.11-rc5-322-gc9df5fe15328c/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.11-rc5-322-gc9df5fe15328c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c9df5fe15328cf2341698b5583a8a521a1e1a5ea =



Test Regressions
---------------- =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard | arm   | lab-baylibre    | gcc-8    | multi_v7_de=
fconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6011f1f20c9df24602d3dfed

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-=
var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-=
var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6011f1f20c9df24=
602d3dff1
        new failure (last pass: v5.11-rc5-278-g3e6d74db7e02)
        4 lines

    2021-01-27 23:04:26.053000+00:00  kern  :alert : Unable to handle kerne=
l NULL pointer dereference at virtual address 00000313
    2021-01-27 23:04:26.054000+00:00  kern  :alert : pgd =3D d0276194<8>[  =
 10.691202] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D4>
    2021-01-27 23:04:26.055000+00:00  =

    2021-01-27 23:04:26.056000+00:00  kern  :alert : [00000313] *pgd=3D0000=
0000   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6011f1f20c9df24=
602d3dff2
        new failure (last pass: v5.11-rc5-278-g3e6d74db7e02)
        47 lines

    2021-01-27 23:04:26.103000+00:00  kern  :emerg : Process kworker/1:2 (p=
id: 82, stack limit =3D 0x23d137fe)
    2021-01-27 23:04:26.104000+00:00  kern  :emerg : Stack: (0xc352dd58 to =
0xc352e000)
    2021-01-27 23:04:26.104000+00:00  kern  :emerg : dd40:                 =
                                      c3997db0 c3997db4
    2021-01-27 23:04:26.104000+00:00  kern  :emerg : dd60: c3997c00 c3997c1=
4 c14380c8 c09c4658 c352c000 ef8726e0 c09c5a18 c3997c00
    2021-01-27 23:04:26.105000+00:00  kern  :emerg : dd80: 000002f3 0000000=
c c19baf54 c2001d80 c3d3a700 ef872740 c09d1f88 c14380c8
    2021-01-27 23:04:26.146000+00:00  kern  :emerg : dda0: c19baf38 52c2f44=
b c19baf54 c3d37e40 c3a7aa80 c3997c00 c3997c14 c14380c8
    2021-01-27 23:04:26.146000+00:00  kern  :emerg : ddc0: c19baf38 0000000=
c c19baf54 c09d1f58 c1435d0c 00000000 c3997c0c c3997c00
    2021-01-27 23:04:26.147000+00:00  kern  :emerg : dde0: c22c5410 c32219c=
0 c398c880 c09a7ac8 c3997c00 fffffdfb c22c5410 bf022134
    2021-01-27 23:04:26.147000+00:00  kern  :emerg : de00: c3d37440 c3220f0=
8 00000120 c32219c0 c398c880 c0a01f2c c3d37440 c3d37440
    2021-01-27 23:04:26.147000+00:00  kern  :emerg : de20: 00000040 c3d3744=
0 c398c880 00000000 c19baf4c bf0c1084 bf0c2014 0000001f =

    ... (36 line(s) more)  =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/6011f1daced6c29df5d3dfdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011f1daced6c29df5d3d=
fdc
        new failure (last pass: v5.11-rc5-278-g3e6d74db7e02) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
imx8mp-evk               | arm64 | lab-nxp         | gcc-8    | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6011f41c9e8ba208dbd3dfd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011f41c9e8ba208dbd3d=
fd3
        new failure (last pass: v5.11-rc4-379-gdd9d91177430) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
meson-gxm-q200           | arm64 | lab-baylibre    | gcc-8    | defconfig+C=
ON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6011f33454d9011689d3dfea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011f33454d9011689d3d=
feb
        new failure (last pass: v5.11-rc5-278-g3e6d74db7e02) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-baylibre    | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6011ef0ee886f93657d3dfe1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011ef0ee886f93657d3d=
fe2
        failing since 72 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-broonie     | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6011eefde5fce0e159d3dfcc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011eefde5fce0e159d3d=
fcd
        failing since 72 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-cip         | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6011ef0452da9bfcf8d3dfd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011ef0452da9bfcf8d3d=
fd7
        failing since 72 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-collabora   | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6011eeb54f732cc0f2d3dfd0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011eeb54f732cc0f2d3d=
fd1
        failing since 72 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                 | arch  | lab             | compiler | defconfig  =
                  | regressions
-------------------------+-------+-----------------+----------+------------=
------------------+------------
qemu_arm-versatilepb     | arm   | lab-linaro-lkft | gcc-8    | versatile_d=
efconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6011eec8f4c156a034d3dfc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.11-rc5-3=
22-gc9df5fe15328c/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6011eec8f4c156a034d3d=
fca
        failing since 72 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
