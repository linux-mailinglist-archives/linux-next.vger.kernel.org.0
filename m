Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78CD82DB8E2
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 03:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgLPCUQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 21:20:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgLPCUM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 21:20:12 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525B4C061793
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 18:19:32 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id g18so16560156pgk.1
        for <linux-next@vger.kernel.org>; Tue, 15 Dec 2020 18:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Dz/B/qxB6v3O/B0C/444VNPxILK00PDBdKCQnRbtB9Y=;
        b=fbHQCAS79y/BSsBej/UIlXLXXgUPEsjITZ188D+kOyf9KZp4hqXEO5Oxn9F90LAcmR
         w7yCbDPFCnQkObe36jlsR3g6F3MXX2KHK5qgEGkD3szOHoo+Pr6LhF6CpTsy/OKlSgiL
         Qn/ynpxJg7D7HssmACC4F63Me1b9k7inlraS5kto3dSuBrIzn6PjifYAEpxy1UeXTcNn
         7WL8r5toUqNl7q57j14Fc7fzZm7X+lwqKM4/v+apY86xMKhQVm6VhN7cBmT86u8rCQta
         914Qj1NWJLAMFabhEnWz0JXzxA2hpDO9ZCxvfeIwGrqtHbE6ajv4zJ9z1T+4QNTkxwzZ
         L7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Dz/B/qxB6v3O/B0C/444VNPxILK00PDBdKCQnRbtB9Y=;
        b=MAqIfbcdcsLQAkWW+AffAn4//v2iRQgO+qfByZ/w5y7q8thUcxqRpDHcW0KDw3OZ8B
         M1d4Z72J/M9/yDXZQjrXctfSkjt0eG86jyrCeucHKFIqCrIy8CcpJhxWajIrGugbJ7Cl
         tejKe2zKQlgV/yCxuWgny+/HFu7BQhhrfunwwJxnoIwm4FI1mzkt0EfnGxxG9Ee6axHf
         ZyqU90TPsxtqvOq96oBxeUcD92Td0WryTU0G/VcgcL8dTAaiQErpzSyW5Vzo7SMlmdfB
         73ANJm/1/jE3PaWewTDBNTq7C11/Wu2OUFJNtNZB7QHT+dj2eQG+9Th+aVNbWhPae3Af
         urJA==
X-Gm-Message-State: AOAM530QbVb48EygM0FcaCGvx9s+NAU0FI4aOsMiiwK7KxXpkkojYV0z
        J7NJomhHsMo4foa4X3ahZMaFd6oKm5qd6g==
X-Google-Smtp-Source: ABdhPJyd2ciCxX8p0pANTUUH2VCDhIdnaX/2u9203DeTRLcZK4muA7zep5a2p5PADPyrRfMqzBd7iQ==
X-Received: by 2002:a63:d354:: with SMTP id u20mr29554546pgi.344.1608085171106;
        Tue, 15 Dec 2020 18:19:31 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e6sm193797pjr.34.2020.12.15.18.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 18:19:30 -0800 (PST)
Message-ID: <5fd96eb2.1c69fb81.78972.0cc0@mx.google.com>
Date:   Tue, 15 Dec 2020 18:19:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-3862-g077e992aebce4
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 271 runs,
 30 regressions (v5.10-3862-g077e992aebce4)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 271 runs, 30 regressions (v5.10-3862-g077e992a=
ebce4)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s805x-p241         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxl-s805x-p241         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s805x-p241         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.10-3862-g077e992aebce4/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.10-3862-g077e992aebce4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      077e992aebce48374837748fb608d714c61211d1 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9371d60e83a45f3c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/bas=
eline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9371d60e83a45f3c94=
cba
        failing since 6 days (last pass: v5.10-rc7-168-g5f4524a4d7e4e, firs=
t fail: v5.10-rc7-201-gc9b6935dc4f4) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd936867693bcc9e7c94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sx-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd936867693bcc9e7c94=
cbf
        failing since 2 days (last pass: v5.10-rc7-269-g52e72161fe54, first=
 fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd934b7701d1573d1c94cd7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd934b7701d1573d1c94=
cd8
        new failure (last pass: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd93356ad754790fbc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-m=
ax.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12a-x96-m=
ax.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd93356ad754790fbc94=
cba
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-x96-max           | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd937e33009f6bc80c94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12a-x96-max.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12a-x96-max.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd937e33009f6bc80c94=
cd0
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd937afc5e8a0d46cc94cc7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d=
-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-g12b-a311d=
-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd937afc5e8a0d46cc94=
cc8
        new failure (last pass: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd93aad6fe3fcc9ebc94ccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd93aad6fe3fcc9ebc94=
cd0
        new failure (last pass: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd933cf702fd48822c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-nanop=
i-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd933cf702fd48822c94=
cdb
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd938232b868e619fc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd938232b868e619fc94=
cba
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd939e0b4edf916abc94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd939e0b4edf916abc94=
cc4
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9339786deb6aea3c94cc8

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxbb-p200.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5fd9339786deb6a=
ea3c94ccd
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36)
        2 lines =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd937e5a76dd60a3dc94cbf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd937e5a76dd60a3dc94=
cc0
        new failure (last pass: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd933e70627626a7dc94cc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd933e70627626a7dc94=
cc4
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9384dee68676a30c94cba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9384dee68676a30c94=
cbb
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd939f64b4d712a09c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd939f64b4d712a09c94=
cba
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-p241         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd934bb12cbb5f946c94cdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-=
p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd934bb12cbb5f946c94=
ce0
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-p241         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd939486e5087c12ec94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd939486e5087c12ec94=
cba
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-p241         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd93aefbba4b9b7f8c94cd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s805x-p241.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd93aefbba4b9b7f8c94=
cda
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9336719d5e662c2c94cda

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-=
p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s905d-=
p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9336719d5e662c2c94=
cdb
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd937e63009f6bc80c94cd4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd937e63009f6bc80c94=
cd5
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s905d-p230         | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd93926201064daabc94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd93926201064daabc94=
ccc
        failing since 2 days (last pass: v5.10-rc7-241-g77fd83718a5f, first=
 fail: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd935c81064583c35c94ce7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-khadas=
-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-khadas=
-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd935c81064583c35c94=
ce8
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd938492b868e619fc94ccb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd938492b868e619fc94=
ccc
        new failure (last pass: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxm-q200               | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9370dca5a93fff0c94ccd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9370dca5a93fff0c94=
cce
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9346fc661811071c94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas=
-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-sm1-khadas=
-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9346fc661811071c94=
cbf
        failing since 0 day (last pass: v5.10-rc7-365-gdae669c2b0553, first=
 fail: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd938ef201064daabc94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre=
/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd938ef201064daabc94=
cba
        new failure (last pass: v5.10-rc7-365-gdae669c2b0553) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd93ae2bba4b9b7f8c94cd1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre=
/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd93ae2bba4b9b7f8c94=
cd2
        new failure (last pass: v5.10-3042-g0a8c6e551ed36) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd931c49d2cea0f58c94cb9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm=
-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd931c49d2cea0f58c94=
cba
        failing since 29 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd931c64963736190c94cdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vers=
atilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd931c64963736190c94=
cdd
        failing since 29 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/5fd9318d0c57990822c94cbe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.10-3862-=
g077e992aebce4/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fd9318d0c57990822c94=
cbf
        failing since 29 days (last pass: v5.10-rc3-420-g5364e201065c, firs=
t fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
