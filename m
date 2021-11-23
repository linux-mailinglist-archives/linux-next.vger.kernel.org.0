Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A26C45A2B4
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 13:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbhKWMiA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 07:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236764AbhKWMiA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 07:38:00 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C948C061574
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 04:34:52 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso2781050pjb.2
        for <linux-next@vger.kernel.org>; Tue, 23 Nov 2021 04:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XtpbUFFnEk2tMUyiPyERp6baEtHOIz3qPLK1nRklM4k=;
        b=VYmwFcnF8Mo5zoFRAsAMkVx3s1gxGjjoZIkpGo4ThXYs6ZsaVSCl5wt95JRAhVC84a
         EGxf9rmUkbX+dRfpnsQIPlhXDRtAEjfZiirPxd9vwS6sVLbIZs6qKJpGSyrYyEZsiscC
         D5YLQVs4Q1Z5iwdWnr/+725JQBxyMbyZPrByWLHvB0R9h0R2GX+vsLovTufGqidaldYV
         IB9eNrsCyQAXegwD2+z5/u0Gl/Lwcmxi6rr4bgtbIwlqh3NVSnKajwDsyEkv9D4kyPAS
         hpLJ9vFGQXDShucarnDxcHsbRXGnpTbOqg+myGi5Y/CU94uXnJ6ooB4gbdr5DsLRQ9ai
         fb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XtpbUFFnEk2tMUyiPyERp6baEtHOIz3qPLK1nRklM4k=;
        b=tHhDCOJrv6tipzLfle3TBm3bfcS6SBGHN6bZlcx6i7PtT5dUeQ+UPg7KnK7lhyZ1jF
         xQ5BFzQOcfikLgHqh9hjoTd036yTR3Hn9x/BuCtUywm4rzjRts2PxaiKs0+A/KnvX5p1
         LZb6iSXlRCAA/8DM8vYqhrzGybFMt7EghYM7JrpehnU0yIpAt/Kchoczw+q0U3pB9g7v
         j94II2m1OzN7CfTdRQNYi3ZxsxR+5xNfy4CeUuiHEY8ht+/ZXxE/rd41WUekyjKlC9ng
         5pQbOQ5SGA3+67XFCfyxUof6y+J3ri/cwizEBolrsbGaUhMOntn6RvYQ9MvMtO+q1MMm
         xaHQ==
X-Gm-Message-State: AOAM532VEZ11279Cohxb0mC+otfYofiIOd0u1OeW9eKELPuq6YhlditZ
        saLYvg1tUl3nc9j/3BIe9CJeR9iYnN9LToC+
X-Google-Smtp-Source: ABdhPJweSKT7FjPMghpLs8O9jjIiTrTttCoq8YpwqAPO49RxnWkQ94mc+Dd7ivjcQ/Q9mauHK1Zu0Q==
X-Received: by 2002:a17:90a:fe0a:: with SMTP id ck10mr2490835pjb.216.1637670891736;
        Tue, 23 Nov 2021 04:34:51 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mq14sm1349067pjb.54.2021.11.23.04.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 04:34:51 -0800 (PST)
Message-ID: <619cdfeb.1c69fb81.487a5.2578@mx.google.com>
Date:   Tue, 23 Nov 2021 04:34:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211123
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 805 runs, 15 regressions (next-20211123)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 805 runs, 15 regressions (next-20211123)

Regressions Summary
-------------------

platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
beagle-xm                  | arm   | lab-baylibre | clang-13 | multi_v7_def=
config           | 1          =

meson-gxbb-p200            | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

meson-gxl-s905d-p230       | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =

meson-gxl-s905d-p230       | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie  | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm-virt-gicv3-uefi   | arm   | lab-cip      | gcc-10   | multi_v7_def=
config+debug     | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip      | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =

zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =

zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+de=
bug              | 1          =

zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211123/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211123
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      aacdecce8147c20b01f865b4e214bb8dbe8c4af1 =



Test Regressions
---------------- =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
beagle-xm                  | arm   | lab-baylibre | clang-13 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca85c3934de60e9f2efc9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca85c3934de60e9f2e=
fca
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619c9d652fe108e6aaf2efb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619c9d652fe108e6aaf2e=
fb7
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca3b8520328fea9f2eff2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+crypto/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca3b8520328fea9f2e=
ff3
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
meson-gxl-s905d-p230       | arm64 | lab-baylibre | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca64d670d122441f2ef9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca64d670d122441f2e=
fa0
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-baylibre | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/619cab27833a67f2bcf2efa5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619cab27833a67f2bcf2e=
fa6
        failing since 5 days (last pass: next-20211117, first fail: next-20=
211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-broonie  | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/619cad18b52065e3a1f2efad

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619cad18b52065e3a1f2e=
fae
        failing since 5 days (last pass: next-20211117, first fail: next-20=
211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm-virt-gicv3-uefi   | arm   | lab-cip      | gcc-10   | multi_v7_def=
config+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/619cab28833a67f2bcf2efb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm/=
multi_v7_defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619cab28833a67f2bcf2e=
fb3
        failing since 5 days (last pass: next-20211117, first fail: next-20=
211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie  | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619cab9abbd545393af2ef9f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-broonie/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619cab9abbd545393af2e=
fa0
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
zynqmp-zcu102              | arm64 | lab-cip      | clang-13 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca743948500075df2eff6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211110062941+9dc7d=
6d5e326-1~exp1~20211110183517.26)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca743948500075df2e=
ff7
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619c9d1b7df6db4a1ff2effc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619c9d1b7df6db4a1ff2e=
ffd
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/619c9f9baa5a8bdbe4f2efc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619c9f9baa5a8bdbe4f2e=
fc5
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca0efcfd09a4c3ef2efe6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca0efcfd09a4c3ef2e=
fe7
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca3ab520328fea9f2efdf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca3ab520328fea9f2e=
fe0
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig+de=
bug              | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca423be36c9f862f2efab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca423be36c9f862f2e=
fac
        new failure (last pass: next-20211118) =

 =



platform                   | arch  | lab          | compiler | defconfig   =
                 | regressions
---------------------------+-------+--------------+----------+-------------=
-----------------+------------
zynqmp-zcu102              | arm64 | lab-cip      | gcc-10   | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/619ca5dc1078608670f2efb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211123/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/619ca5dc1078608670f2e=
fb6
        new failure (last pass: next-20211118) =

 =20
