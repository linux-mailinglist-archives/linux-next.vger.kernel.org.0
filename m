Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8C93C7AA9
	for <lists+linux-next@lfdr.de>; Wed, 14 Jul 2021 02:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237127AbhGNAp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 20:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237113AbhGNAp6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 20:45:58 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48823C0613DD
        for <linux-next@vger.kernel.org>; Tue, 13 Jul 2021 17:43:06 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id w15so168803pgk.13
        for <linux-next@vger.kernel.org>; Tue, 13 Jul 2021 17:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rFzbENOsO34qwMqUCiw3z9mHGu51qFuQ9npqnece+y4=;
        b=WoEbRjR3Ped8vAeN5jrx44i4r7NUlx2Ta7TGOykQfTUSMIhexKPedPqeKFKKgwLLn5
         LOxw0Wy6yUTYuw6yYtCcapxkk2BCrnjxYsKeuqrwwIfNnX1e90ouD1IasIf2pRm+cwRM
         EpHcrWNG8keyzW4C4WO82cghAEO9ggc1+ql3Rc/68Ax2VK4ihUCRE4N/sadYoIVnHdoB
         LXES9RiVWmz2KGPEgd/7QqU3sGJNyGmrc9BjPFsTTyKL9LaMv3Sn2M44mpZHCAItt1Mx
         qyUxS9Qc3WPZwq3uvuqom/xyqASsJvD0g32iUIojnECwcjbNHjvhcRFt4wa3mUrjLvuR
         4CUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rFzbENOsO34qwMqUCiw3z9mHGu51qFuQ9npqnece+y4=;
        b=OZ91A59HO26WG6U79HX02g8rHB94gJG9MBRX0d3Kokqhg6kQHucW8Jo1+AsfnzgV34
         UUVOl/KL0mOfkkJB3SdLGAzPRfs2Km1C42c/jQS4gBs6ndQbVONxHuq7DaHrO+zN2Qup
         wLEK4OcZ528CXoIQKf5wb/7+nSYofght1OTRA1WqKzWzMhqicM4GXdPELL0rcu/Vc8iD
         K1ErMpwWbcNs3+/lEUqH0dlls0bhNNzLgs0BdaiSxQpLWG584V7grDEpSRqXSEDySO7i
         1J8zm5zxw0n1LJ37OM5Z812VlVV2cZ272kVZKaUVgw7oxHFrLBMW29hE4x7UwB9gK6Uy
         /LOA==
X-Gm-Message-State: AOAM531Leuvb0IA/zDAFFhJtHjHuYvuCHer6xmDHGTKXks98PACayFKq
        Qw++lU6KS24eSXmIW42gON9y0QDu1fbHGfKJ
X-Google-Smtp-Source: ABdhPJwW7T0d8jPSPu/Lv17p6vpf2j3IBIZUzSgWKP+Z0zu4YMQijsN9W8wKY74ulfknX+v7CrRVEQ==
X-Received: by 2002:a63:f348:: with SMTP id t8mr6643424pgj.23.1626223385300;
        Tue, 13 Jul 2021 17:43:05 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e30sm306437pga.63.2021.07.13.17.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 17:43:04 -0700 (PDT)
Message-ID: <60ee3318.1c69fb81.69077.1df0@mx.google.com>
Date:   Tue, 13 Jul 2021 17:43:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.14-rc1-262-g396208d3cbd4
Subject: next/pending-fixes baseline: 377 runs,
 29 regressions (v5.14-rc1-262-g396208d3cbd4)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 377 runs, 29 regressions (v5.14-rc1-262-g39620=
8d3cbd4)

Regressions Summary
-------------------

platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained | arm    | lab-baylibre    | gcc-8    | sama5_defconf=
ig              | 1          =

bcm2836-rpi-2-b       | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =

bcm2837-rpi-3-b-32    | arm    | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
onfig           | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | omap2plus_def=
config          | 1          =

d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
fig             | 1          =

d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =

d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =

imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =

kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200        | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 2          =

meson-gxm-q200        | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 2          =

qemu_arm-versatilepb  | arm    | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-cip         | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-collabora   | gcc-8    | versatile_def=
config          | 1          =

qemu_arm-versatilepb  | arm    | lab-linaro-lkft | gcc-8    | versatile_def=
config          | 1          =

rk3288-veyron-jaq     | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc1-262-g396208d3cbd4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc1-262-g396208d3cbd4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      396208d3cbd4226c5bb79b1143954539d1856335 =



Test Regressions
---------------- =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained | arm    | lab-baylibre    | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfb7306ebe7cf4c8a93a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfb7306ebe7cf4c8a9=
3a5
        failing since 434 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfb9df0a6f5f5618a93c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfb9df0a6f5f5618a9=
3c5
        failing since 159 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfea4348dea49428a93b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfea4348dea49428a9=
3ba
        failing since 7 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee009717c39b5b918a93cf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee009717c39b5b918a9=
3d0
        failing since 7 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b-32    | arm    | lab-baylibre    | gcc-8    | bcm2835_defco=
nfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60edf929310cb3784e8a93ac

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edf929310cb3784e8a9=
3ad
        failing since 7 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfc643175974d2a8a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfc643175974d2a8a9=
39c
        failing since 1 day (last pass: v5.10-rc7-201-gc9b6935dc4f4, first =
fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfe1bce974d28e78a939d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-=
xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfe1bce974d28e78a9=
39e
        failing since 1 day (last pass: v5.10-rc7-201-gc9b6935dc4f4, first =
fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfdb8d4219535768a93b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfdb8d4219535768a9=
3b1
        new failure (last pass: v5.14-rc1-225-g25a1eba130d1) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
fig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfbc350a93fa2fe8a93c7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfbc350a93fa2fe8a9=
3c8
        failing since 7 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfd1a7c6b033b1d8a93e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/bas=
eline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/bas=
eline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfd1a7c6b033b1d8a9=
3e4
        failing since 7 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60edff4752f6b24d228a93ce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/ba=
seline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/ba=
seline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edff4752f6b24d228a9=
3cf
        failing since 7 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee002451ab70fb538a939c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee002451ab70fb538a9=
39d
        failing since 7 days (last pass: v5.13-1843-g646572bd9313, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee04d15a2f7aab038a93ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee04d15a2f7aab038a9=
3af
        failing since 12 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfc0f031cc3fc908a93b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfc0f031cc3fc908a9=
3ba
        failing since 260 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60edff575c14b28c438a939f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edff575c14b28c438a9=
3a0
        new failure (last pass: v5.14-rc1-225-g25a1eba130d1) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
meson-gxm-q200        | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60edfcb38b66b4b34e8a93b5

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60edfcb38b66b4b=
34e8a93b9
        new failure (last pass: v5.13-12625-g5f5e6a60f828)
        11 lines

    2021-07-13T20:50:48.225862  <8>[   45.103134] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2021-07-13T20:50:48.268508  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address 000302aae00317d2
    2021-07-13T20:50:48.268965  kern  :alert : Mem abort info:
    2021-07-13T20:50:48.269178  kern  <8>[   45.131815] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D11>
    2021-07-13T20:50:48.269340  :alert :   ESR =3D 0x96000004
    2021-07-13T20:50:48.269573  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-07-13T20:50:48.269730  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-07-13T20:50:48.269878  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-07-13T20:50:48.270770  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60edfcb38b66b4b=
34e8a93ba
        new failure (last pass: v5.13-12625-g5f5e6a60f828)
        2 lines =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
meson-gxm-q200        | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/60edfffcf803da4a418a93a8

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/60edfffcf803da4=
a418a93ac
        new failure (last pass: v5.14-rc1-225-g25a1eba130d1)
        12 lines

    2021-07-13T21:04:37.928335  kern  :alert : Unable to handle kernel pagi=
ng request at virtual address ffff009008da6020
    2021-07-13T21:04:37.928658  kern  :alert : Mem abort info:
    2021-07-13T21:04:37.928893  kern  :alert :   ESR =3D 0x96000004
    2021-07-13T21:04:37.929147  ker<8>[   45.188873] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2021-07-13T21:04:37.929348  n  :alert :   EC =3D 0x25: DABT (current EL=
), IL =3D 32 bits
    2021-07-13T21:04:37.929546  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-07-13T21:04:37.929742  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2021-07-13T21:04:37.929944  kern  :alert :   FSC =3D 0x04: level 0 tran=
slation fault
    2021-07-13T21:04:37.930139  kern  :alert : Data abort info:   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/60edfffcf803da4=
a418a93ad
        new failure (last pass: v5.14-rc1-225-g25a1eba130d1)
        2 lines

    2021-07-13T21:04:37.971222  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
004
    2021-07-13T21:04:37.971576  kern  :alert :   CM =3D 0, WnR =3D 0
    2021-07-13T21:04:37.971846  <8>[   45.225062] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2>
    2021-07-13T21:04:37.972057  kern  :alert : swapper pgta<8>[   45.234140=
] <LAVA_SIGNAL_ENDRUN 0_dmesg 556546_1.5.2.4.1>
    2021-07-13T21:04:37.972281  ble: 4k pages, 48-bit VAs, pgdp=3D000000000=
26fb000
    2021-07-13T21:04:37.972501  kern  :alert : [ffff009008da6020] pgd=3D000=
0000000000000, p4d=3D0000000000000000
    2021-07-13T21:04:37.972697  kern  :emerg : Internal error: Oops: 960000=
04 [#1] PREEMPT SMP   =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60edf8759cc28eefff8a93b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edf8759cc28eefff8a9=
3b9
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfa27a06f88ea488a93c8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edfa27a06f88ea488a9=
3c9
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-cip         | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60edf6eb48eb6fe8808a93e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edf6eb48eb6fe8808a9=
3e6
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-collabora   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60edf69d0857ece5068a93af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60edf69d0857ece5068a9=
3b0
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-linaro-lkft | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee15a88e6766826f8a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee15a98e6766826f8a9=
39c
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq     | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60edfb7606ebe7cf4c8a93af

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
60edfb7606ebe7cf4c8a93ef
        new failure (last pass: v5.14-rc1-225-g25a1eba130d1)

    2021-07-13T20:45:27.430202  /lava-4192050/1/../bin/lava-test-case<8>[  =
 12.488635] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>
    2021-07-13T20:45:27.430991     =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60edfe6e83411fb2be8a93c2

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60edfe6e83411fb2be8a93cc
        failing since 0 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-13T20:58:13.429631  <8>[   23.912207] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-13T20:58:14.454081  /lava-4192135/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60edfe6e83411fb2be8a93cd
        failing since 0 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-13T20:58:13.417732  /lava-4192135/1/../bin/lava-test-case   =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/60edffe3cd579c41958a943e

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-2=
62-g396208d3cbd4/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60edffe3cd579c41958a9447
        failing since 0 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-13T21:04:31.680980  /lava-4192199/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60edffe3cd579c41958a9448
        failing since 0 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-13T21:04:30.646069  /lava-4192199/1/../bin/lava-test-case
    2021-07-13T21:04:30.657481  <8>[   24.080215] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =20
