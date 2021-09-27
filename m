Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA15418FCC
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 09:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233140AbhI0HXo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 03:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbhI0HXn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 03:23:43 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAA9C061570
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 00:22:06 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id me1so11780434pjb.4
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 00:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ec1W8tldNkHzZ7Vd6EjQbtH0ejrCD+9EuII6isePJe8=;
        b=PE+1RmD1XV7FBMxg1ev/7SUyv1HzNunL2aV6hCjCVHtEXK0plXEbtfTzeGkyoiVqeM
         ajHq3PraKyYTx6p5mARUxZxNrrB8F4aDYfEv2QFNgnIXO5r6/eGABNikVH06nANJHMbS
         o4pvJ2FGlf4PXsbkb7zKnxBSOPsfvzh5LT9O30azamP0h2xkEYekqWLegm/jWjlysyWN
         KnW+wgJxkgTI8vXow60334qCfSSX1wkDtLnYrYVpbr8O31JfNKhVopLI5XfRhixA5LO3
         4RqO3odwhBQkmMtVOOJbFOpC7fkkypbyKRBNMUw05OZuy+/V+3VBFF7nGfe7D57YamJJ
         MaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ec1W8tldNkHzZ7Vd6EjQbtH0ejrCD+9EuII6isePJe8=;
        b=VOlKJlJvQ/lyDGjqzuR/o2jLvowF0lPM7+WYpXOdFVM/gApCUutIzPI9FPA/u4yIPr
         Rb/un7qePvFSAuz9Ut+qFu8oPxynHMkHwwlPeGlt+qs63qDaHAXg3C5qC5FqVrDc1WAI
         CHejIz6cVcWzbrcJoe25hOIp5uia1LUo1uLSqRZZ9BRQqoEhNsjyei+4d5TjYI3+296A
         p56ReDeuilpXx8YHA+oC+4D7FxvvTmRwLUMbCp7kFZzV9cxZVI1Vlq/5PtVUh5sxZ4TV
         SReZXa63LmMP67i+qca50eQlItheoRncjUYToDlvSrQrWytRNeGFxo4YUTQLqZLnT1tF
         ci5A==
X-Gm-Message-State: AOAM5334v+IqSmBhmLd7zbc/iqddE3wavgc16q9/9G4KhsilRewzsliK
        s7m0IAgleq3vUa0Dfw5Xzl+vDGcHnwtpb6kX
X-Google-Smtp-Source: ABdhPJwaZ8aANyOo4BP62CPYqzswFb1N7OdkeutxSz0ytAMBRii3Yki53XNih94fQ81GH8sw8yGFEA==
X-Received: by 2002:a17:90a:1f4a:: with SMTP id y10mr17964026pjy.225.1632727325506;
        Mon, 27 Sep 2021 00:22:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b126sm17515826pga.67.2021.09.27.00.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 00:22:05 -0700 (PDT)
Message-ID: <6151711d.1c69fb81.162de.a9df@mx.google.com>
Date:   Mon, 27 Sep 2021 00:22:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.15-rc3-260-g1a398301185b
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 298 runs,
 14 regressions (v5.15-rc3-260-g1a398301185b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 298 runs, 14 regressions (v5.15-rc3-260-g1a398=
301185b)

Regressions Summary
-------------------

platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig    =
                | 1          =

hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

hp-11A-G6-EE-grunt      | x86_64 | lab-collabora | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =

rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 1          =

rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
onfig+crypto    | 1          =

rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
onfig+ima       | 1          =

rk3399-gru-kevin        | arm64  | lab-collabora | gcc-8    | defconfig    =
                | 2          =

rk3399-gru-kevin        | arm64  | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | gcc-8    | defconfig+ima=
                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.15-rc3-260-g1a398301185b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.15-rc3-260-g1a398301185b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      1a398301185bd12b3249a1cac272fcd333234ef7 =



Test Regressions
---------------- =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b         | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6151390e3925603cfe99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6151390e3925603cfe99a=
2e0
        failing since 234 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/615139edf3c326e7ec99a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615139edf3c326e7ec99a=
2e4
        failing since 87 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
hip07-d05               | arm64  | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61513f9813c6d22ed099a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61513f9813c6d22ed099a=
2de
        failing since 82 days (last pass: v5.13-1843-g646572bd9313, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
hp-11A-G6-EE-grunt      | x86_64 | lab-collabora | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6151385d671b5e87d099a2db

  Results:     17 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora=
/baseline-hp-11A-G6-EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6151385d671b5e8=
7d099a2ee
        new failure (last pass: v5.15-rc2-438-g281756d0de8c)
        1 lines

    2021-09-27T03:19:31.590331  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector
    2021-09-27T03:19:31.600267  <8>[   10.681251] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D1>   =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61513f941142a7f5eb99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288=
-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288=
-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61513f941142a7f5eb99a=
2db
        failing since 24 days (last pass: v5.14-rc7-111-g9541ebae8a1d, firs=
t fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6151475ddc5f2a247699a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6151475ddc5f2a247699a=
2db
        failing since 24 days (last pass: v5.14-rc7-111-g9541ebae8a1d, firs=
t fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
onfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/615148c35cb3620ea499a302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline=
-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615148c35cb3620ea499a=
303
        failing since 24 days (last pass: v5.14-rc7-111-g9541ebae8a1d, firs=
t fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61514b9f682c68e6bc99a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61514b9f682c68e6bc99a=
2ea
        failing since 24 days (last pass: v5.14-rc7-72-geeb46b4d4bd9, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq       | arm    | lab-collabora | gcc-8    | multi_v7_defc=
onfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/61514e853cff2f736e99a2e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-rk=
3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-rk=
3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61514e853cff2f736e99a=
2e2
        failing since 24 days (last pass: v5.14-rc7-111-g9541ebae8a1d, firs=
t fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
rk3399-gru-kevin        | arm64  | lab-collabora | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/6151392d445ec70ea899a314

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/6151392d445ec70ea899a31a
        failing since 76 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-27T03:23:01.888349  /lava-4587766/1/../bin/lava-test-case
    2021-09-27T03:23:01.900272  <8>[   25.282575] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/6151392d445ec70ea899a31b
        failing since 76 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-27T03:22:59.832137  <8>[   23.213264] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-09-27T03:23:00.853191  /lava-4587766/1/../bin/lava-test-case
    2021-09-27T03:23:00.864582  <8>[   24.247462] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
rk3399-gru-kevin        | arm64  | lab-collabora | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61513b32253fa7e78899a2db

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/61513b32253fa7e78899a2e1
        failing since 76 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-27T03:31:48.233051  <8>[   24.313257] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-09-27T03:31:49.253731  /lava-4587811/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/61513b32253fa7e78899a2e2
        failing since 76 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-27T03:31:48.220046  /lava-4587811/1/../bin/lava-test-case   =

 =



platform                | arch   | lab           | compiler | defconfig    =
                | regressions
------------------------+--------+---------------+----------+--------------=
----------------+------------
sun50i-a64-bananapi-m64 | arm64  | lab-clabbe    | gcc-8    | defconfig+ima=
                | 1          =


  Details:     https://kernelci.org/test/plan/id/615135a70cb040a92899a302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.15-rc3-2=
60-g1a398301185b/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-b=
ananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615135a70cb040a92899a=
303
        new failure (last pass: v5.15-rc2-438-g281756d0de8c) =

 =20
