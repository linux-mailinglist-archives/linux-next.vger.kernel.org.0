Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2572DA6A4
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 04:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgLODHp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 22:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgLODHo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 22:07:44 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A682C06179C
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 19:07:04 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id m5so8083535pjv.5
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 19:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HH42rZD+NCTrsP9glRTkcNGod4g2nir1f+vs0UgpO4U=;
        b=qp628UF0x6RGEPbVUnu1hsGr11YcTvF2DlXkJbvs4GJs5JSBqy9hn/Bde+INUaH8YX
         QYJub/QehHaz0hrDr0Yez3+zELItJt4UoklZ4rn0upA2WY75851i2nd977d8ZM58QLDj
         mKC43XnWr9MN2r+5011r0W6H0V/9meEcG6eid5UyfQvY5l5l+DDTLYr28g6TSEhQlMpy
         q7LyhPEGJwm50ZU6A+nj5lp5XQhRjn3xE43PJkf1sSEoNnC5AqdM2zn2yDeVmgrcclMJ
         IQS2n8eibLSTnMzSixITShIM6xyyZI0a0wapbI8yh99y0w3PyiqrfgEWLjKRQIBuAJQt
         S3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HH42rZD+NCTrsP9glRTkcNGod4g2nir1f+vs0UgpO4U=;
        b=nWtfvoam8DgKuT6QnT5gYO5jT7zBr6+ZOLfnFTgkzoFj+Z+x7LusIVPqxu7x84aP+e
         b/zpIYEe4TP6VjlrNVYHj8YlE0pYtIsknUAfuh+USp25IRmFN7loT5l+tD5oY4uDaQuR
         B+JMuKe0jd0rKFwc/OaWFJMuPQzCQQe+5XEoAODruTOI3Vea+I/iu2QvttxryXUN2603
         IG4V5neIihYJim+ncUCaQp4GmrHE2HZOSOxqXMaffqsDqz7ohQU+twhowq2W7cStCSUu
         qp+oEsSZvV9ArrXwyW9nSoAUqNSHdmUrdBaVe4ig83F484EivMPLHDKbcu9RoIFM+arW
         YF3A==
X-Gm-Message-State: AOAM531UcQBLPDnmtAaQK2yQNy6ktJQ00rdMnK2oBfXnN6+aLPGvbZFn
        QNMvcixWtpsPOxN4CqQPuh2069dUeYwhBg==
X-Google-Smtp-Source: ABdhPJwnvrS+xkQ2BT/iyybSesOTsxYKfuNfOtfY21arsTxsFsUpteXVtl16QVcMAssGnc8/hdLk4w==
X-Received: by 2002:a17:902:8203:b029:db:ebc9:1ce5 with SMTP id x3-20020a1709028203b02900dbebc91ce5mr16050587pln.84.1608001622745;
        Mon, 14 Dec 2020 19:07:02 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b4sm19379909pju.33.2020.12.14.19.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 19:07:02 -0800 (PST)
Message-ID: <5fd82856.1c69fb81.eaf4d.8c8d@mx.google.com>
Date:   Mon, 14 Dec 2020 19:07:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-3042-g0a8c6e551ed36
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 254 runs,
 37 regressions (v5.10-3042-g0a8c6e551ed36)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 254 runs, 37 regressions (v5.10-3042-g0a8c6e55=
1ed36)

Regressions Summary
-------------------

platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32           | arm    | lab-baylibre | gcc-8    | bcm2835_d=
efconfig            | 1          =

imx6q-sabresd                | arm    | lab-nxp      | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6q-var-dt6customboard     | arm    | lab-baylibre | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                   | arm    | lab-nxp      | gcc-8    | imx_v6_v7=
_defconfig          | 1          =

imx6sx-sdb                   | arm    | lab-nxp      | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                   | arm    | lab-nxp      | gcc-8    | multi_v7_=
defconfig           | 1          =

imx8mp-evk                   | arm64  | lab-nxp      | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-g12a-x96-max           | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-odroid-n2         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxbb-nanopi-k2         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxl-s805x-p241         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxl-s905d-p230         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxm-khadas-vim2        | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-q200               | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

meson-gxm-q200               | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =

qemu_arm-versatilepb         | arm    | lab-baylibre | gcc-8    | versatile=
_defconfig          | 1          =

qemu_arm-versatilepb         | arm    | lab-cip      | gcc-8    | versatile=
_defconfig          | 1          =

qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig+kvm_guest   | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-3042-g0a8c6e551ed36/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-3042-g0a8c6e551ed36
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0a8c6e551ed36d88eb081b326c304a94bfa4bb4b =



Test Regressions
---------------- =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
bcm2837-rpi-3-b-32           | arm    | lab-baylibre | gcc-8    | bcm2835_d=
efconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7e9b8bcad2649cbc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rp=
i-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7e9b8bcad2649cbc94=
ccf
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
imx6q-sabresd                | arm    | lab-nxp      | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f1b60c8940dd56c94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f1b60c8940dd56c94=
cc6
        failing since 49 days (last pass: v5.9-13195-g0281c5220c40, first f=
ail: v5.9-14860-gd56fc2efcc70) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm    | lab-baylibre | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f0454ad9b27538c94cdd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f0454ad9b27538c94=
cde
        failing since 5 days (last pass: v5.10-rc7-168-g5f4524a4d7e4e, firs=
t fail: v5.10-rc7-201-gc9b6935dc4f4) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm    | lab-nxp      | gcc-8    | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f27099abe9e98cc94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f27099abe9e98cc94=
cea
        failing since 1 day (last pass: v5.10-rc7-269-g52e72161fe54, first =
fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm    | lab-nxp      | gcc-8    | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f023c497b20b93c94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline=
-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-nxp/baseline=
-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f023c497b20b93c94=
cc8
        failing since 1 day (last pass: v5.10-rc7-269-g52e72161fe54, first =
fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
imx6sx-sdb                   | arm    | lab-nxp      | gcc-8    | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f552b444a42e94c94cca

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f552b444a42e94c94=
ccb
        failing since 1 day (last pass: v5.10-rc7-269-g52e72161fe54, first =
fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
imx8mp-evk                   | arm64  | lab-nxp      | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f5ca8dade88199c94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/base=
line-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f5ca8dade88199c94=
cd2
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f29d284af7d956c94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-m=
ax.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-m=
ax.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f29d284af7d956c94=
cc4
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-g12a-x96-max           | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f335e1817109d2c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f335e1817109d2c94=
cbb
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-g12b-odroid-n2         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f337e1817109d2c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f337e1817109d2c94=
cc0
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f7f286877a4fc5c94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f7f286877a4fc5c94=
cc0
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxbb-nanopi-k2         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7fa018035a8c678c94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7fa018035a8c678c94=
ccf
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f1d7d61b2ba4bcc94cf1

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd7f1d7d61b2ba=
4bcc94cf6
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553)
        2 lines =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f2866182fe07c5c94cd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f2866182fe07c5c94=
cd5
        failing since 1 day (last pass: v5.10-rc7-241-g77fd83718a5f, first =
fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxbb-p200              | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f2e46e56255314c94ce4

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd7f2e46e56255=
314c94ce9
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553)
        2 lines =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f2bae436cec01ec94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f2bae436cec01ec94=
cba
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f467fad086ac2cc94cce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f467fad086ac2cc94=
ccf
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f5e3cf0f4d2f8ac94cc5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f5e3cf0f4d2f8ac94=
cc6
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f2e1fe6c2af042c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f2e1fe6c2af042c94=
cba
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f4821a8e0db11fc94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f4821a8e0db11fc94=
cce
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s805x-p241         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f740a6dcdeda9ec94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f740a6dcdeda9ec94=
cbb
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f2312586ab701ac94cf6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f2312586ab701ac94=
cf7
        failing since 1 day (last pass: v5.10-rc7-241-g77fd83718a5f, first =
fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f349e1817109d2c94cd8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-=
p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-=
p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f349e1817109d2c94=
cd9
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s905d-p230         | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f3d543e46da986c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f3d543e46da986c94=
cba
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f177874a9b70f1c94ccc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f177874a9b70f1c94=
ccd
        failing since 5 days (last pass: v5.10-rc7-168-g5f4524a4d7e4e, firs=
t fail: v5.10-rc7-201-gc9b6935dc4f4) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s905x-khadas-vim   | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f210321cb6c30dc94d00

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-=
khadas-vim.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905x-=
khadas-vim.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f210321cb6c30dc94=
d01
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxl-s905x-libretech-cc | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f364dbf90eef9ec94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-libretech-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905x-libretech-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f364dbf90eef9ec94=
cce
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f4401d957a25f5c94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f4401d957a25f5c94=
cd2
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f619b104ddd497c94cfd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-khadas=
-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-khadas=
-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f619b104ddd497c94=
cfe
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f76ea47096f6f8c94cc8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd7f76ea47096f=
6f8c94ccd
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553)
        2 lines =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f14c8dcdf9020cc94ce5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f14c8dcdf9020cc94=
ce6
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f2abe324ab4b25c94cea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f2abe324ab4b25c94=
ceb
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-gxm-q200               | arm64  | lab-baylibre | gcc-8    | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f51c3f28180209c94cc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f51c3f28180209c94=
cc5
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre | gcc-8    | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7f42522096f5f99c94cd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas=
-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas=
-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7f42522096f5f99c94=
cd3
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm    | lab-baylibre | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7e73584bd33514cc94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7e73584bd33514cc94=
cc8
        failing since 28 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_arm-versatilepb         | arm    | lab-cip      | gcc-8    | versatile=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7e725709ed88c4fc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7e725709ed88c4fc94=
cba
        failing since 28 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch   | lab          | compiler | defconfig=
                    | regressions
-----------------------------+--------+--------------+----------+----------=
--------------------+------------
qemu_x86_64-uefi-mixed       | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig+kvm_guest   | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd7ee428f2bf481dbc94ce9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/x86_64/x86_64_defconfig+kvm_guest/gcc-8/lab-baylibre/baselin=
e-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3042-=
g0a8c6e551ed36/x86_64/x86_64_defconfig+kvm_guest/gcc-8/lab-baylibre/baselin=
e-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd7ee428f2bf481dbc94=
cea
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =20
