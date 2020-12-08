Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E9A2D216D
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 04:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgLHD0Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 22:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLHD0Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 22:26:24 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58774C061749
        for <linux-next@vger.kernel.org>; Mon,  7 Dec 2020 19:25:44 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id t37so10927826pga.7
        for <linux-next@vger.kernel.org>; Mon, 07 Dec 2020 19:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3zZW7Wg5MipGJntke3JQOdl41pDJi4mm6O5K9RMBK88=;
        b=CybQMvIpH1FO0cvecEjDMpJQcxE5fr0js+gLMRCuBpNcv6Sxnh6qoVrzL+iMJpeCze
         fz3g6jUI6Bn4c3CHFBFSL7wwKC7l+6eNh4BEvX5+oUixPwm/z+DlLAkBLBLghKDfsCfl
         +rLeJkrr4ZpBWvGqatuhzN4kGym7PzdcM0r1p+wPWcgngoAf5WKbgGYL6AgN3reNn+i6
         O/1FrroRRBE8HoP4MoPeWxE4tcNbpH+ul+iPgAwhmZRRoVJIRcYLTUbyejxDxT5UMGQa
         PDOBxZ+YM+hOCF50Tt7fX1ax9Bgp01ugWshVDgXq1kIJibWlQgqUm62GKLhc7aNX6CA1
         4Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3zZW7Wg5MipGJntke3JQOdl41pDJi4mm6O5K9RMBK88=;
        b=K08WUJPgtcOOqNcFr+3a5RT4z0q8QQ9Hi1k2hat0ODSKVWXcidAwurfifecy1FVOdL
         69RImhFshvj9AZ8sIQ6kr9uC0AgTzJVTp9cDCenuJ4sjAsULEhreEccpI1JjAATwL9c2
         AXguO/FmFgFZAMiP2zsyNUOasAXa9xR+RKHPYa24FPdBvGWevZmVbKKGDL1Otd15I+Dj
         XRuwUYeH9dToAmzNkSVJ7XrEOQ1RdgYqXJ2CK8Q0Ud4BsTnelDLLnCWSuNIrZznR4Jgy
         pUhDG1JuLcv7cSwoBEs1i6EugGlkatnmEB7FO8nutMnT0TPqQL4K3dowP0XNIlhVTMK8
         wuNQ==
X-Gm-Message-State: AOAM5313Z0r/BPm22pEgWG9cFfktfK59tt7C/mUlIsTzxdXYyKqeKq+0
        eyrHrAAXajAvLdtAw6Mn5YGNOUB+LcKe/Q==
X-Google-Smtp-Source: ABdhPJzRSO6dTCoGn8V7Nc7pgkGCzZvAEvWW7ilOtd0nDumz51gaayvScHHgXZzAyU5NAd+GLLxnaw==
X-Received: by 2002:a63:d23:: with SMTP id c35mr6879338pgl.91.1607397943423;
        Mon, 07 Dec 2020 19:25:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j11sm15311730pfe.26.2020.12.07.19.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 19:25:42 -0800 (PST)
Message-ID: <5fcef236.1c69fb81.891d1.4e06@mx.google.com>
Date:   Mon, 07 Dec 2020 19:25:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-rc7-168-g5f4524a4d7e4e
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 322 runs,
 14 regressions (v5.10-rc7-168-g5f4524a4d7e4e)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 322 runs, 14 regressions (v5.10-rc7-168-g5f452=
4a4d7e4e)

Regressions Summary
-------------------

platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-8    | sama5_de=
fconfig              | 1          =

imx6q-sabresd               | arm   | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =

imx6q-sabresd               | arm   | lab-nxp         | gcc-8    | multi_v7=
_defconfig           | 1          =

imx8mp-evk                  | arm64 | lab-nxp         | gcc-8    | defconfi=
g                    | 1          =

imx8mp-evk                  | arm64 | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200              | arm64 | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200              | arm64 | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =

meson-gxm-q200              | arm64 | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =

qemu_arm-versatilepb        | arm   | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb        | arm   | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb        | arm   | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb        | arm   | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =

sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-8    | multi_v7=
_defc...BIG_ENDIAN=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-rc7-168-g5f4524a4d7e4e/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-rc7-168-g5f4524a4d7e4e
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5f4524a4d7e4e7e5ae5e3a905580705cdd269385 =



Test Regressions
---------------- =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
at91-sama5d4_xplained       | arm   | lab-baylibre    | gcc-8    | sama5_de=
fconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebe51e0b7c5beb4c94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama=
5d4_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebe51e0b7c5beb4c94=
cea
        failing since 216 days (last pass: v5.7-rc3-277-ga37f92ef57b2, firs=
t fail: v5.7-rc4-211-g6d4315023bc9) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6q-sabresd               | arm   | lab-nxp         | gcc-8    | imx_v6_v=
7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebfd879d616f122c94cf0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabr=
esd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebfd879d616f122c94=
cf1
        failing since 43 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx6q-sabresd               | arm   | lab-nxp         | gcc-8    | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebe380abc784f99c94cc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabre=
sd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebe380abc784f99c94=
cc9
        new failure (last pass: v5.10-rc6-420-gb2779a0d410f) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                  | arm64 | lab-nxp         | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebd5bfc4fe6d476c94cdb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebd5bfc4fe6d476c94=
cdc
        failing since 1 day (last pass: v5.10-rc6-310-g01e6f29caf8f, first =
fail: v5.10-rc6-420-gb2779a0d410f) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                  | arm64 | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcec324b527352107c94cbd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcec324b527352107c94=
cbe
        failing since 6 days (last pass: v5.10-rc5-501-g8b4247fa6afd, first=
 fail: v5.10-rc6-167-g607b9a2b9696) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
meson-gxm-q200              | arm64 | lab-baylibre    | gcc-8    | defconfi=
g+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebc669b7b71ac24c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebc669b7b71ac24c94=
cba
        new failure (last pass: v5.10-rc6-420-gb2779a0d410f) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
meson-gxm-q200              | arm64 | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebcbd0f5108647dc94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q20=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebcbd0f5108647dc94=
cc0
        new failure (last pass: v5.10-rc6-420-gb2779a0d410f) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
meson-gxm-q200              | arm64 | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/5fcec1569942c1df2ec94d12

  Results:     3 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5fcec1569942c1d=
f2ec94d16
        new failure (last pass: v5.10-rc6-420-gb2779a0d410f)
        10 lines

    2020-12-07 23:57:05.279000+00:00  kern  :alert : Mem abort info:
    2020-12-07 23:57:05.279000+00:00  kern  :alert :   ESR =3D 0x96000004
    2020-12-07 23:57:05.320000+00:00  kern  :alert :   EC =3D 0x25: DABT (c=
urrent EL), IL =3D 32 bits
    2020-12-07 23:57:05.321000+00:00  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-12-07 23:57:05.321000+00:00  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-12-07 23:57:05.321000+00:00  kern  :alert : Data abort info:
    2020-12-07 23:57:05.321000+00:00  kern  :alert :   ISV =3D 0, ISS =3D 0=
x00000004
    2020-12-07 23:57:05.321000+00:00  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-12-07 23:57:05.321000+00:00  kern  :alert : [000b22e5f9063587] add=
ress between user and kernel address ranges   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fcec1569942c1d=
f2ec94d17
        new failure (last pass: v5.10-rc6-420-gb2779a0d410f)
        2 lines

    2020-12-07 23:57:05.322000+00:00  kern  :emerg : Code: f9400463 0a02000=
0 f8607860 b40000e0 (b9404402) =

    2020-12-07 23:57:05.347000+00:00  + set +x   =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb        | arm   | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebb11115794478dc94d54

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebb11115794478dc94=
d55
        failing since 21 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb        | arm   | lab-broonie     | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebb1530c3f53c2fc94cc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebb1530c3f53c2fc94=
cca
        failing since 21 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb        | arm   | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebb18874c86c3fcc94cc6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebb18874c86c3fcc94=
cc7
        failing since 21 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb        | arm   | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebadcf73f8342d6c94cee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qe=
mu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebadcf73f8342d6c94=
cef
        failing since 21 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                    | arch  | lab             | compiler | defconfi=
g                    | regressions
----------------------------+-------+-----------------+----------+---------=
---------------------+------------
sun8i-r40-bananapi-m2-ultra | arm   | lab-clabbe      | gcc-8    | multi_v7=
_defc...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fcebf9b3fc0a3bfc9c94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/la=
b-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-rc7-1=
68-g5f4524a4d7e4e/arm/multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/la=
b-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armeb/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fcebf9b3fc0a3bfc9c94=
cd0
        new failure (last pass: v5.10-rc6-420-gb2779a0d410f) =

 =20
