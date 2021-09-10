Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B1C406685
	for <lists+linux-next@lfdr.de>; Fri, 10 Sep 2021 06:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhIJEhE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Sep 2021 00:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhIJEhD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Sep 2021 00:37:03 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B4AC061574
        for <linux-next@vger.kernel.org>; Thu,  9 Sep 2021 21:35:53 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id mi6-20020a17090b4b4600b00199280a31cbso521166pjb.0
        for <linux-next@vger.kernel.org>; Thu, 09 Sep 2021 21:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ECgMpwsC1RQ1ori0kFI6xvujqm/nncvhp5c7dP/I9AE=;
        b=kzJENEDLUdEuvfTVxWtAgOTr2AA1lKoh6WTg96qhJvaf16ED+X4Zzl4y0DyjFrXLNt
         fjOzceO3o6Ba0yi4y/cEjlGBHCqAPwGanRxZDNTaySRXp6HE7QxrBTCRdf00g4C17r+t
         0DcjxMe62IBNMhnU4liOosSsL/Ezjb6hKHB3uOS3Mp5EzwnPoigAR6zyqr1nhMcsVr+R
         emhj6+h21pf26m2uVXAmZ1PcKkaDINTMW9aslHxIbJpbrXfHrKyfq+QMV4I9WCqMNMs/
         cs4aYMKd49Ht9p+3zJvV4/C8PzrKYN2uOQHxQoq72mrQ7qjlQ7WmEjqEJja2nuYrj+Z8
         X7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ECgMpwsC1RQ1ori0kFI6xvujqm/nncvhp5c7dP/I9AE=;
        b=XGb0qInXQiEc1wMFlGe5iQtG4WrfFWxQkGT3f/xmS8OAibrt8yORxpaHD2DhGDBlV9
         B4Lc5l8IQer5wfHuHiChB788ucGQWrr/qNrHhommWbt8mNghKty94xJxd2jpD78B/97q
         SjK97FLqvT5TTYkofmQy1kR96nDHXnm9V2iGrI++J4lxlsZWc04/dK6y/QM6X2yYvVkU
         eezdBGvsxGshl9EfGPrbhXteaUZn4ghqX6Wn6dFaFV2PBsyo/uFkd9cNcRRG/qET+SNz
         srMiQqzk7/CIvqQPyKy27ejERHL3sBeGbzDB5avvJGJW9os9CX7vK3/lqLTWrrS8L2PQ
         nDIA==
X-Gm-Message-State: AOAM532MwcbEsa9LQSBVBeDAA3jnh5ew8UX+1ht7HZuAEXeWdUjwV/gs
        x4OEig2lDmi+2kQ8YUBCE49hqVhXCyCfPwYA
X-Google-Smtp-Source: ABdhPJxMDLya2Z4ULvjoJoJAGCJ6i7dZe3hulkoaSvA0+e9+2tnMo95vsYNpztWoVNBxco6XBtxY4Q==
X-Received: by 2002:a17:903:183:b0:13a:1a0c:35f6 with SMTP id z3-20020a170903018300b0013a1a0c35f6mr5832065plg.69.1631248552233;
        Thu, 09 Sep 2021 21:35:52 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c24sm4327912pgj.63.2021.09.09.21.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 21:35:51 -0700 (PDT)
Message-ID: <613ae0a7.1c69fb81.4fc24.daac@mx.google.com>
Date:   Thu, 09 Sep 2021 21:35:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.14-10891-g7e703ab62392
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 614 runs,
 31 regressions (v5.14-10891-g7e703ab62392)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 614 runs, 31 regressions (v5.14-10891-g7e703ab=
62392)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =

hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx8mn-ddr4-evk         | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 2          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 1          =

imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+ima       | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+crypto    | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config           | 1          =

rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =

rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+im=
a                | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-10891-g7e703ab62392/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-10891-g7e703ab62392
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7e703ab62392862840640d00acf80f478bfb0a8d =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/613aae4d0f9315f8c1d59672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aae4d0f9315f8c1d59=
673
        failing since 217 days (last pass: v5.11-rc6-256-gf889022827dc, fir=
st fail: v5.11-rc6-298-g490f4659faae) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/613aaa1b831cde6708d597a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aaa1b831cde6708d59=
7a4
        failing since 65 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2837-rpi-3-b         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613aab83212317c670d59671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aab83212317c670d59=
672
        failing since 65 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa50e906344cb57d59685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagl=
e-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagl=
e-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa50e906344cb57d59=
686
        failing since 1 day (last pass: v5.14-10251-gfd7f1d781c08, first fa=
il: v5.14-10568-g1006eb19726f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa6db0e8e8f87b8d5968f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa6db0e8e8f87b8d59=
690
        new failure (last pass: v5.14-10568-g1006eb19726f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa997da64ee1c11d59666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa997da64ee1c11d59=
667
        failing since 59 days (last pass: v5.10-rc7-201-gc9b6935dc4f4, firs=
t fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa82f3985dd4a42d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-x=
m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-x=
m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa82f3985dd4a42d59=
666
        failing since 6 days (last pass: v5.14-6828-g521f6987a116, first fa=
il: v5.14-8174-g2f453ff3ea7f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/613ab3853f416d1a3bd59681

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-collabora/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613ab3853f416d1a3bd59=
682
        failing since 70 days (last pass: v5.13-rc7-277-gfd6ae26c403a, firs=
t fail: v5.13-2793-g5c4584a79cad) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hip07-d05               | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613ab7e998742e9651d59673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-hip07-d05.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-hip07-d05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613ab7e998742e9651d59=
674
        failing since 65 days (last pass: v5.13-1843-g646572bd9313, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx6q-sabresd           | arm   | lab-nxp         | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa71e6b8789417ed59670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa71e6b8789417ed59=
671
        failing since 319 days (last pass: v5.9-13195-g0281c5220c40, first =
fail: v5.9-14860-gd56fc2efcc70) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/613aa978988c05559dd596ca

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/613aa978988c055=
59dd596d1
        new failure (last pass: v5.14-10568-g1006eb19726f)
        12 lines

    2021-09-10T00:40:10.345443  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.525347] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2021-09-10T00:40:10.345927  at virtual address 0000000000000098   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/613aa978988c055=
59dd596d2
        new failure (last pass: v5.14-10568-g1006eb19726f)
        2 lines

    2021-09-10T00:40:10.347575  kern  :alert : Mem abort info:
    2021-09-10T00:40:10.347963  kern  :alert :   ESR =3D 0x96000046
    2021-09-10T00:40:10.348228  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-09-10T00:40:10.348475  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-09-10T00:40:10.348985  kern  :alert :   EA<8>[   14.551067] <LAVA_=
SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMEN=
T=3D2>
    2021-09-10T00:40:10.349269   =3D 0, S1PTW =3D 0   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/613aab6c1c03343facd5968d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aab6c1c03343facd59=
68e
        new failure (last pass: v5.14-10568-g1006eb19726f) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/613aae030f9315f8c1d59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aae030f9315f8c1d59=
666
        failing since 7 days (last pass: v5.14-619-gacb79da497df, first fai=
l: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mp-evk              | arm64 | lab-nxp         | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613aafcb01fa68617cd59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aafcb01fa68617cd59=
666
        failing since 4 days (last pass: v5.14-8174-g2f453ff3ea7f, first fa=
il: v5.14-9800-g9a811bf862bf) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa76f881a812156d5968e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa76f881a812156d59=
68f
        failing since 297 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613acdd2035a21b243d59667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613acdd2035a21b243d59=
668
        failing since 297 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa9168cb6600a95d59675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa9168cb6600a95d59=
676
        failing since 297 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-collabora   | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613aac0b51fbbf0481d59680

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_ar=
m-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aac0b51fbbf0481d59=
681
        failing since 297 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/613ac13fb6db25a4fad596a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613ac13fb6db25a4fad59=
6aa
        failing since 297 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/613aca94aaa07c80e2d59672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-rk32=
88-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+ima/gcc-8/lab-collabora/baseline-rk32=
88-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aca94aaa07c80e2d59=
673
        failing since 7 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/613acafb56a3b1b656d59671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline-r=
k3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+crypto/gcc-8/lab-collabora/baseline-r=
k3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613acafb56a3b1b656d59=
672
        failing since 7 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/613acdce7a9e6685f1d59670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gc=
c-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613acdce7a9e6685f1d59=
671
        failing since 7 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/613ad2fcd241c5b3e2d59666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-v=
eyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-v=
eyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613ad2fcd241c5b3e2d59=
667
        failing since 7 days (last pass: v5.14-rc7-111-g9541ebae8a1d, first=
 fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq       | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/613ad6485b1aed004dd59665

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/ba=
seline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613ad6485b1aed004dd59=
666
        failing since 7 days (last pass: v5.14-rc7-72-geeb46b4d4bd9, first =
fail: v5.14-6828-g521f6987a116) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig   =
                 | 2          =


  Details:     https://kernelci.org/test/plan/id/613aaee87499b25dd2d59672

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevi=
n.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevi=
n.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/613aaee87499b25dd2d59678
        failing since 59 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-10T01:03:20.124739  /lava-4487513/1/../bin/lava-test-case
    2021-09-10T01:03:20.136206  <8>[   52.576864] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy1-probed RESULT=3Dfail>   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/613aaee87499b25dd2d59679
        failing since 59 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-10T01:03:19.089563  /lava-4487513/1/../bin/lava-test-case
    2021-09-10T01:03:19.101137  <8>[   51.541669] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3399-gru-kevin        | arm64 | lab-collabora   | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/613aaf76cf65b3814fd59665

  Results:     89 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabor=
a/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-usb2phy1-probed: https://kernelci.org/test/cas=
e/id/613aaf76cf65b3814fd5966b
        failing since 59 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-10T01:05:48.280633  /lava-4487535/1/../bin/lava-test-case   =


  * baseline.bootrr.rockchip-usb2phy0-probed: https://kernelci.org/test/cas=
e/id/613aaf76cf65b3814fd5966c
        failing since 59 days (last pass: v5.13-12625-g5f5e6a60f828, first =
fail: v5.14-rc1-225-g25a1eba130d1)

    2021-09-10T01:05:47.244024  /lava-4487535/1/../bin/lava-test-case
    2021-09-10T01:05:47.255873  <8>[   51.552629] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-usb2phy0-probed RESULT=3Dfail>   =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa7a8accebebd91d59682

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-ban=
anapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-ban=
anapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa7a8accebebd91d59=
683
        failing since 3 days (last pass: v5.14-9800-g9a811bf862bf, first fa=
il: v5.14-9872-gea617cdef108) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/613aa9d8a031e0dda2d59691

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-10891=
-g7e703ab62392/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananap=
i-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/613aa9d8a031e0dda2d59=
692
        failing since 1 day (last pass: v5.14-9872-gea617cdef108, first fai=
l: v5.14-10568-g1006eb19726f) =

 =20
