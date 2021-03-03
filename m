Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479CA32BB72
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237294AbhCCM3I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344570AbhCCFAB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 00:00:01 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6035C061756
        for <linux-next@vger.kernel.org>; Tue,  2 Mar 2021 20:59:08 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id o188so8746616pfg.2
        for <linux-next@vger.kernel.org>; Tue, 02 Mar 2021 20:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lakeyi92yX6+U5dx5s3HbAEYAR8FnUBhhYTLUR7Xgvo=;
        b=dJL2wzWtUj/tzZS2jkZZKqu3/Fh5DHWDWZd+Frko6hi7iOy3XMDULO8Ekm8ac8A0SE
         2RkZzdizRyYcARGRpfHgCx4ltXwaZFeD3uSED5A3u6n6aroTa1IEzCYKHUY8VjsaXwPs
         4xslxk2GrfoWq1VlGinEQvUyo4/JfnGhJ/uimCy1leQWHuWWwtHL8bVodmLCMhK1EdIz
         pkw1eyrlNO9bjupkcx71CjL6FY5kQrqrGnqK98pMOxfPcdXvBJz9FaHndJVdTLFRq9gT
         T4pr641QGK6lltVslvNj/pgCP12i0eaq8bxqXl/xIPN2BpTj/kAlWCrZzJ6Vnb8Repn2
         wTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lakeyi92yX6+U5dx5s3HbAEYAR8FnUBhhYTLUR7Xgvo=;
        b=U6sYklr5XdHlOdt/c5Fz+VhlW0t7wOnRyDjsYCjrVZiVZKgi5QagB605zYQfgH3gP7
         p44HayxkvjEGhtEEfM2GEWcOtaC554eh/7g4aFjcbYElNU9PZxJOEmZsfz9ahnd3Gxtt
         xSpeF2GjvVTbqgxKG9sNM/2gNVppv4iSGFYEQbMvd+b98EPoaUWm6JJuWCpTWho5mZwy
         /wRUODvZ3r7UlGjoAV/K3nC2rC6vxxPhmQDyvvbfTyAL5uSQmg80+vnT7+DamEjSoww/
         ie1sx1InPinLXDiCe9gNabWmShTE3dInh78jqH9TTncvd/4yXDj5n+J/ZbvgWSUfd8VC
         OlNw==
X-Gm-Message-State: AOAM531rIM1K9NPPSZWtSDnqyKonaiUXHNc4hRxFuwn6U4IYQFV8DS+Q
        Y5oX2kYs5zo4glgNw1GF0XB2mSaNNIYrJQ==
X-Google-Smtp-Source: ABdhPJxe0znhFHlrsvz9HiaMccLH/bR+PRGadZbWLX9+nvM5O7GCbBuEIinHvAVsby5CFjtjf6iUUA==
X-Received: by 2002:a62:8445:0:b029:1c1:c862:8fc4 with SMTP id k66-20020a6284450000b02901c1c8628fc4mr22670293pfd.77.1614747547797;
        Tue, 02 Mar 2021 20:59:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h12sm21074175pgs.7.2021.03.02.20.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 20:59:07 -0800 (PST)
Message-ID: <603f179b.1c69fb81.770f8.198a@mx.google.com>
Date:   Tue, 02 Mar 2021 20:59:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.12-rc1-302-gdec4d73ab259b
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 277 runs,
 9 regressions (v5.12-rc1-302-gdec4d73ab259b)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 277 runs, 9 regressions (v5.12-rc1-302-gdec4d7=
3ab259b)

Regressions Summary
-------------------

platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
imx8mp-evk             | arm64  | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2   | arm64  | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230   | arm64  | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb   | arm    | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb   | arm    | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_arm-versatilepb   | arm    | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =

qemu_x86_64            | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon.=
..6-chromebook | 1          =

qemu_x86_64-uefi-mixed | x86_64 | lab-baylibre  | gcc-8    | x86_64_defconf=
ig             | 1          =

r8a77950-salvator-x    | arm64  | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.12-rc1-302-gdec4d73ab259b/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.12-rc1-302-gdec4d73ab259b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      dec4d73ab259b977b300ebc753ab162264f8a2a7 =



Test Regressions
---------------- =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
imx8mp-evk             | arm64  | lab-nxp       | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee79b01ed5d9124addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/b=
aseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee79b01ed5d9124add=
cb2
        failing since 1 day (last pass: v5.11-11896-g31549ef5d561, first fa=
il: v5.12-rc1-190-ge8638196c4142) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
meson-g12b-odroid-n2   | arm64  | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee472f825fab87baddcc0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee472f825fab87badd=
cc1
        new failure (last pass: v5.11-11896-g31549ef5d561) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
meson-gxl-s905d-p230   | arm64  | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee70515dda6925eaddcd3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee70515dda6925eadd=
cd4
        new failure (last pass: v5.11-11896-g31549ef5d561) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb   | arm    | lab-baylibre  | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee162529a6a3b47addcd6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee162529a6a3b47add=
cd7
        failing since 106 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb   | arm    | lab-cip       | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee1520bbabb8397addcba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee1520bbabb8397add=
cbb
        failing since 106 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_arm-versatilepb   | arm    | lab-collabora | gcc-8    | versatile_defc=
onfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee10df01b36da79addcc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm/versatile_defconfig/gcc-8/lab-collabora/baseline-qemu=
_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee10df01b36da79add=
cc8
        failing since 106 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64            | x86_64 | lab-baylibre  | gcc-8    | x86_64_defcon.=
..6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee188d5e8863deeaddcc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre=
/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/x86_64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre=
/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee188d5e8863deeadd=
cc9
        new failure (last pass: v5.11-rc6-436-gda0c88a4d23e) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
qemu_x86_64-uefi-mixed | x86_64 | lab-baylibre  | gcc-8    | x86_64_defconf=
ig             | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee5694b68a64129addcdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_=
x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee5694b68a64129add=
cdd
        new failure (last pass: v5.11-rc6-436-gda0c88a4d23e) =

 =



platform               | arch   | lab           | compiler | defconfig     =
               | regressions
-----------------------+--------+---------------+----------+---------------=
---------------+------------
r8a77950-salvator-x    | arm64  | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603ee7f5546b3acbc9addcb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.12-rc1-3=
02-gdec4d73ab259b/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603ee7f5546b3acbc9add=
cba
        new failure (last pass: v5.11-11896-g31549ef5d561) =

 =20
