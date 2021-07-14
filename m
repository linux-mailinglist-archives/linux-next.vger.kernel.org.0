Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03DF3C7DA3
	for <lists+linux-next@lfdr.de>; Wed, 14 Jul 2021 06:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237857AbhGNEye (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 00:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhGNEyd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jul 2021 00:54:33 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF64C0613DD
        for <linux-next@vger.kernel.org>; Tue, 13 Jul 2021 21:51:42 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 62so1191322pgf.1
        for <linux-next@vger.kernel.org>; Tue, 13 Jul 2021 21:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jurl1CyVA48rsq6sPnAmaqfArnqHIoZCeNYjrjUWHkk=;
        b=BLbtNeRLfPFDFxsJ51ncgnQ+NL4jUNoG+GjnIggfQu2sgBNY3ke+VLMv9Rh1EL+8oj
         xzxYoVOWtLs48438+ifbCkFgw+xVN4sHZQ6uC4SJVZOiGCJ9VsC5QkMj0QHfIQ7oOuo+
         evX68LF3TuHWQYMK4F21rTU+6atGIoahojhubY0zif4DIKjErlypIupfjhnnfWgQ8B21
         lJSRS3Lu+/3T0w3SimL8RvRMTuNOA3oF5zHBIEWUUIA5MoP1hpTZaqIxm3zfopOiWOn2
         eFau8btu8mC6sj4azfOTmYY4I6CCLXczL2m4XR+McwLzq9TN+/j3kAJuovdo+6WkJQJB
         xPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jurl1CyVA48rsq6sPnAmaqfArnqHIoZCeNYjrjUWHkk=;
        b=pyVT4jpXSojSaVvbRQ/s+hm+LOklst5njNVNCxgWm1hOEr59YihRRr3efzoJ6AAI/y
         lFUFaoiahtTCV6UScjQfLBazceiJrN/osYog76cFnwgemvLsbFcZnDIehcOMkDpn2gmh
         a3QllD5uPmMNChzT/83cCNeZSWJnngU5UJHrZsK/iG0cDyJd5XwtuHWqSxjLB9cSspx+
         O26uwpqj/6Fe8iG3bN+l4/ZaTosa/P5aUmW2M/iPKJd6ztZq20E0BWO2q9/VH1ia7tq9
         N6YyEjxokqY87fPMN5RU1ug/KkJynws/Zy65XCbKpOXjYCJopwBHAAsS+yaBauBeP/Xx
         UG5Q==
X-Gm-Message-State: AOAM533ChzHdsleGS0uR2VDJKq4mxxnAFdB6frPmR7LlQ5e50bnbS+53
        3YngGfjlfOo3cKap2R+j4lUI32rNquIzVig7
X-Google-Smtp-Source: ABdhPJxXTjj3hUQBDjPKUTmIsz5aAM6H+aJ22dya4CbMSmPgleWVXp9Ck0ILE+LIa9P1HDspV8tUjg==
X-Received: by 2002:a62:1a4b:0:b029:328:da0b:d83b with SMTP id a72-20020a621a4b0000b0290328da0bd83bmr8065202pfa.59.1626238301251;
        Tue, 13 Jul 2021 21:51:41 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v13sm4371375pja.44.2021.07.13.21.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 21:51:40 -0700 (PDT)
Message-ID: <60ee6d5c.1c69fb81.88cd1.f50c@mx.google.com>
Date:   Tue, 13 Jul 2021 21:51:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.14-rc1-304-g902b4f67cc56
Subject: next/pending-fixes baseline: 350 runs,
 23 regressions (v5.14-rc1-304-g902b4f67cc56)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 350 runs, 23 regressions (v5.14-rc1-304-g902b4=
f67cc56)

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

beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beagle-xm             | arm    | lab-baylibre    | gcc-8    | omap2plus_def=
config          | 1          =

d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =

imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =

kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig    =
                | 1          =

meson-gxm-q200        | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =

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
...G_ARM_LPAE=3Dy | 1          =

rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =

rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 2          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-rc1-304-g902b4f67cc56/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-rc1-304-g902b4f67cc56
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      902b4f67cc56066e637e15355def456cb1fa150f =



Test Regressions
---------------- =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
at91-sama5d4_xplained | arm    | lab-baylibre    | gcc-8    | sama5_defconf=
ig              | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee36b81b26a41abd8a93bd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5=
d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee36b81b26a41abd8a9=
3be
        failing since 434 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2836-rpi-2-b       | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3ea95e22ede1fe8a939b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/=
baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3ea95e22ede1fe8a9=
39c
        failing since 159 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee395aa24f669fd18a93e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee395aa24f669fd18a9=
3e5
        failing since 7 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2837-rpi-3-b       | arm64  | lab-baylibre    | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3aae69847b77358a93a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3aae69847b77358a9=
3a9
        failing since 7 days (last pass: v5.13-3495-gfbf137d9483a, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3ac9d2ae86e02a8a93a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/b=
aseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3ac9d2ae86e02a8a9=
3a2
        failing since 1 day (last pass: v5.10-rc7-201-gc9b6935dc4f4, first =
fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beagle-xm             | arm    | lab-baylibre    | gcc-8    | omap2plus_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3a01389aa660d38a93a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3a01389aa660d38a9=
3a7
        failing since 0 day (last pass: v5.14-rc1-225-g25a1eba130d1, first =
fail: v5.14-rc1-262-g396208d3cbd4) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
d2500cc               | x86_64 | lab-clabbe      | gcc-8    | x86_64_defcon=
...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee39c20bbd888d788a93d7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/bas=
eline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/bas=
eline-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee39c20bbd888d788a9=
3d8
        failing since 7 days (last pass: v5.13-rc4-286-g6bd26f0b60ab, first=
 fail: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3ae069847b77358a9432

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3ae069847b77358a9=
433
        failing since 7 days (last pass: v5.13-1843-g646572bd9313, first fa=
il: v5.13-11972-g079b16c442fd) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hip07-d05             | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee414650d350bcfe8a939d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee414650d350bcfe8a9=
39e
        failing since 12 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6q-sabresd         | arm    | lab-nxp         | gcc-8    | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3a1c38f8fd10d88a93a7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3a1c38f8fd10d88a9=
3a8
        failing since 261 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3970221bb8c1898a943e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-kontro=
n/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3970221bb8c1898a9=
43f
        failing since 0 day (last pass: v5.14-rc1-225-g25a1eba130d1, first =
fail: v5.14-rc1-262-g396208d3cbd4) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
kontron-kbox-a-230-ls | arm64  | lab-kontron     | gcc-8    | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3bf18866fcd3c68a93f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-=
230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-kbox-a-=
230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3bf18866fcd3c68a9=
3f8
        new failure (last pass: v5.14-rc1-262-g396208d3cbd4) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
meson-gxm-q200        | arm64  | lab-baylibre    | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee389843be5d25898a93d1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylib=
re/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee389843be5d25898a9=
3d2
        new failure (last pass: v5.14-rc1-262-g396208d3cbd4) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-baylibre    | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee345bb603701ecc8a93a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee345bb603701ecc8a9=
3a4
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-broonie     | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee3469ec1a4bbe4b8a93c3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee3469ec1a4bbe4b8a9=
3c4
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-cip         | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee345fec1a4bbe4b8a93b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-ve=
rsatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee345fec1a4bbe4b8a9=
3b7
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-collabora   | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee340bf80bdc047f8a93a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee340bf80bdc047f8a9=
3a2
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-versatilepb  | arm    | lab-linaro-lkft | gcc-8    | versatile_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee45582a41e930df8a93b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qem=
u_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60ee45582a41e930df8a9=
3ba
        failing since 239 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3288-veyron-jaq     | arm    | lab-collabora   | gcc-8    | multi_v7_defc=
...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60ee408661c030f5ab8a939b

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/=
gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
60ee408661c030f5ab8a93dc
        new failure (last pass: v5.14-rc1-225-g25a1eba130d1)

    2021-07-14T01:40:11.839903  /lava-4193427/1/../bin/lava-test-case
    2021-07-14T01:40:11.864519  <8>[   10.555129] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-keyb-probed RESULT=3Dfail>   =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig+CON=
...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee388736a74ef6698a93b9

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collab=
ora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ee388736a74ef6698a93c3
        failing since 1 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-14T01:06:03.129295  /lava-4193493/1/../bin/lava-test-case
    2021-07-14T01:06:03.140640  <8>[   24.719492] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ee388736a74ef6698a93c4
        failing since 1 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-14T01:06:02.094213  /lava-4193493/1/../bin/lava-test-case
    2021-07-14T01:06:02.105871  <8>[   23.684191] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
rk3399-gru-kevin      | arm64  | lab-collabora   | gcc-8    | defconfig    =
                | 2          =


  Details:     https://kernelci.org/test/plan/id/60ee3c99dde7a4f5428a93ab

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-rc1-3=
04-g902b4f67cc56/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-ke=
vin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/60ee3c99dde7a4f5428a93b5
        failing since 1 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-14T01:23:12.414896  <8>[   23.583643] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>
    2021-07-14T01:23:13.437118  /lava-4193549/1/../bin/lava-test-case
    2021-07-14T01:23:13.448819  <8>[   24.619160] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/60ee3c99dde7a4f5428a93b6
        failing since 1 day (last pass: v5.13-12625-g5f5e6a60f828, first fa=
il: v5.14-rc1-225-g25a1eba130d1)

    2021-07-14T01:23:11.379164  <8>[   22.547542] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy-driver-present RESULT=3Dpass>
    2021-07-14T01:23:12.401603  /lava-4193549/1/../bin/lava-test-case   =

 =20
