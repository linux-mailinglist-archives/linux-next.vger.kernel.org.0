Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34DE93BCB58
	for <lists+linux-next@lfdr.de>; Tue,  6 Jul 2021 13:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbhGFLFw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Jul 2021 07:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhGFLFv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Jul 2021 07:05:51 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DDACC061574
        for <linux-next@vger.kernel.org>; Tue,  6 Jul 2021 04:03:12 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 17so18900209pfz.4
        for <linux-next@vger.kernel.org>; Tue, 06 Jul 2021 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7NC/bRF9CldwsGCy7ztd3wxZ1MK4zl9mYa/Ku11AGOY=;
        b=T2IVVv9741LX5rCtlTCG3eZtH4pGP+Bm+As0PFfVbbrBqkkRGz9KRbcMEX3iihwm/j
         wdBWiqKpiM7RAs9qydKAYI42e5q42UR3loK7WDl+949+YIOb7HkLYjWnVPsh54AgmlA9
         P/f/ZNKl+8jtPFqfdanf1yTwk67xYnOhZP2DxofpYIWxdFuRvYqmYoiJP9094VuRgxgt
         HJFDQ7tnqXoO3XUURpNJFXQSHQyrINWmwmN0qt+uWUtwy6e543bu6ztfCTjdPUI+aiFw
         HYpeeEwh3+o2nxfVV+dTYyVaIkaCT13FEv10tpKFvkHSmVSFHaFoN7eEugwaGw2Wjcxj
         6/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7NC/bRF9CldwsGCy7ztd3wxZ1MK4zl9mYa/Ku11AGOY=;
        b=BjTP+nmv9+gOifRj3MwE+5BmDJBi2BqYTOojQNs1jxFvsFFCsRzLGmPGS4FN6KZo97
         9DtqMnaEVONJqhTnKJMin8QlOIcgP6YmE3BcZBZLMJiPelyrDN5jD6Eq6dii7hXag3Ql
         L+z86hNrw09py+Wfmek/j6R3FV5mG4Qoqq3Lo0Me/CWjysWhSv41o+YPYwgTO2wW+pHx
         3zI3nlr1U4vKqrq9X6Cu7McJSJZDT7QjDGbnjR1boUjxBSPGtMmYfuFy2Vqar9vFPA1g
         l94kt12LMvL8m6GlueUpORyNS/xM5AE70sou9QShpmy6cq/K9vAfZMj4znE1q1SulIPH
         XURA==
X-Gm-Message-State: AOAM533q35ZrABCjWFNZUtri7Xb7NamPDgGMC5y3CXZ8xKtU/VsGVe5y
        YTmIaVkhq0njqL0Fm48K+q2lHqtguH7JhjyI
X-Google-Smtp-Source: ABdhPJzFD9p+85cFhJKS2oqxTPfUGVTSwxJEFYGhi7v6yjfSejWhhL2s2rLm/vqBSV0n/3Jok7fWMg==
X-Received: by 2002:a65:4949:: with SMTP id q9mr19710115pgs.327.1625569391489;
        Tue, 06 Jul 2021 04:03:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w5sm16039907pfu.121.2021.07.06.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 04:03:10 -0700 (PDT)
Message-ID: <60e4386e.1c69fb81.955a0.f6a3@mx.google.com>
Date:   Tue, 06 Jul 2021 04:03:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.13-11972-g079b16c442fd
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 335 runs,
 23 regressions (v5.13-11972-g079b16c442fd)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 335 runs, 23 regressions (v5.13-11972-g079b16c=
442fd)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15          | arm    | lab-linaro-lkft | gcc-8    | omap2plu=
s_defconfig          | 1          =

bcm2836-rpi-2-b            | arm    | lab-collabora   | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b-32         | arm    | lab-baylibre    | gcc-8    | bcm2835_=
defconfig            | 1          =

beaglebone-black           | arm    | lab-cip         | gcc-8    | multi_v7=
_defconfig           | 1          =

beaglebone-black           | arm    | lab-cip         | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black           | arm    | lab-cip         | gcc-8    | omap2plu=
s_defconfig          | 1          =

d2500cc                    | x86_64 | lab-clabbe      | gcc-8    | x86_64_d=
efconfig             | 1          =

d2500cc                    | x86_64 | lab-clabbe      | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

d2500cc                    | x86_64 | lab-clabbe      | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =

hip07-d05                  | arm64  | lab-collabora   | gcc-8    | defconfi=
g                    | 1          =

hip07-d05                  | arm64  | lab-collabora   | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd              | arm    | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

meson-gxl-s805x-p241       | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230       | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2      | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-collabora   | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.13-11972-g079b16c442fd/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.13-11972-g079b16c442fd
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      079b16c442fd41cb8d731fcd947f4e3e3f4382e0 =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
am57xx-beagle-x15          | arm    | lab-linaro-lkft | gcc-8    | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4277d09fbbbda6c11796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/omap2plus_defconfig/gcc-8/lab-linaro-lkft/baseline-am57x=
x-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4277d09fbbbda6c117=
96b
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora   | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e405a6388d38c31c117995

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e405a6388d38c31c117=
996
        failing since 151 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60e3fe7a964a82c1a711798a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e3fe7a964a82c1a7117=
98b
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4028b14ab48de35117995

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4028b14ab48de35117=
996
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b-32         | arm    | lab-baylibre    | gcc-8    | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/60e3ff2ed8cece824c1179a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e3ff2ed8cece824c117=
9a7
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
beaglebone-black           | arm    | lab-cip         | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/60e400a701b6584480117977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-bla=
ck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/multi_v7_defconfig/gcc-8/lab-cip/baseline-beaglebone-bla=
ck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e400a701b6584480117=
978
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
beaglebone-black           | arm    | lab-cip         | gcc-8    | multi_v7=
_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4034f87040abf211179c1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline=
-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-cip/baseline=
-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4034f87040abf21117=
9c2
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
beaglebone-black           | arm    | lab-cip         | gcc-8    | omap2plu=
s_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e40226d17471ff191179bc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/omap2plus_defconfig/gcc-8/lab-cip/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e40226d17471ff19117=
9bd
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
d2500cc                    | x86_64 | lab-clabbe      | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4000c80be8c991a11796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/x86_64/x86_64_defconfig/gcc-8/lab-clabbe/baseline-d2500cc.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4000c80be8c991a117=
96b
        new failure (last pass: v5.13-rc4-286-g6bd26f0b60ab) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
d2500cc                    | x86_64 | lab-clabbe      | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4016308c7c9ce45117976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/base=
line-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-clabbe/base=
line-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4016308c7c9ce45117=
977
        new failure (last pass: v5.13-rc4-286-g6bd26f0b60ab) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
d2500cc                    | x86_64 | lab-clabbe      | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/60e402b5f75335cf03117993

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/basel=
ine-d2500cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/x86_64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-clabbe/basel=
ine-d2500cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e402b5f75335cf03117=
994
        new failure (last pass: v5.13-rc4-286-g6bd26f0b60ab) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
hip07-d05                  | arm64  | lab-collabora   | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4017bb0a91cddbc11796f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4017bb0a91cddbc117=
970
        failing since 4 days (last pass: v5.13-rc7-277-gfd6ae26c403a, first=
 fail: v5.13-2793-g5c4584a79cad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
hip07-d05                  | arm64  | lab-collabora   | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e40464cc1817091411796b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e40464cc18170914117=
96c
        new failure (last pass: v5.13-1843-g646572bd9313) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx6q-sabresd              | arm    | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e40574c25e4fceff11796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e40574c25e4fceff117=
96b
        failing since 253 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxl-s805x-p241       | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e406d99c29f53e0211796a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e406d99c29f53e02117=
96b
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxl-s905d-p230       | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e406db9c29f53e0211796d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e406db9c29f53e02117=
96e
        new failure (last pass: v5.13-2793-g5c4584a79cad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxl-s905x-khadas-vim | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4078a29b1499eaa11797e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4078a29b1499eaa117=
97f
        new failure (last pass: v5.13-3495-gfbf137d9483a) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
meson-gxm-khadas-vim2      | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/60e40c9fc8c88b53cc117982

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e40c9fc8c88b53cc117=
983
        new failure (last pass: v5.13-2793-g5c4584a79cad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4002a80be8c991a1179a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4002a80be8c991a117=
9a7
        failing since 231 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4002d80be8c991a1179fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4002d80be8c991a117=
9fd
        failing since 231 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e4002f80be8c991a117a09

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e4002f80be8c991a117=
a0a
        failing since 231 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-collabora   | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e3ffce8b37fee965117979

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e3ffce8b37fee965117=
97a
        failing since 231 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/60e410b6026c1b02c3117987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.13-11972=
-g079b16c442fd/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/60e410b6026c1b02c3117=
988
        failing since 231 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
