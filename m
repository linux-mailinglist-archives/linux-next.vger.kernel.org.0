Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8592478543
	for <lists+linux-next@lfdr.de>; Fri, 17 Dec 2021 07:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbhLQGpQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Dec 2021 01:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhLQGpQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Dec 2021 01:45:16 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45851C061574
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 22:45:16 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id m15so1224159pgu.11
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 22:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rZXawDz7GuA2AF0k3zVWhvEsg1K0vCsAJFOQHIqpaR4=;
        b=vRUZWg2PJFgeyCX5eHR+Ao9FNAGcMt9IrZR3dfU490Eh/6BbaGGIFUZ+eBr20XXkGI
         lYraMmFGz80yucuW4jiXkUZImEpAYqmQ9yFYmZWkyvvnZ06zbnLfyzlyUN4AKlVMyKZO
         eH8NKaqb8M+Cr5JENbUKjTUB8xpdS+J/stoHjzXmuY4TwMDcyzVr0wh6TIg3IsE1aUPa
         v8bLaVd0POxHxY/xb7xxGqVM/yNIhslLzhxaF9km/Zm1GrWpABKIh7K3QY9RpWTjrmO8
         ojUa/Ti3bp8rY+JMcHMtty8GmPrK7xQs42BF5EeH2EKoJmtIOo91gEakj2O7Fc0EqPId
         MKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rZXawDz7GuA2AF0k3zVWhvEsg1K0vCsAJFOQHIqpaR4=;
        b=sws5wHEx4QdJILZp/ipRqPP4V4UbnCQRM2fcXrJyRH3S5quot49GGVxMurNloWUgkx
         f5S/VXl7aVVLdrIk17fhyLQuUoeXdGQChYJxIXQyZr5w4DoKnzcNe3ApugrQTpxu6sRm
         uZoyx83tccTqKIFC5E3BSVKZ4OGU3pq23EdJvFM3FaKffDvWTsKX45Bt+Vz3XI9VuQ61
         JCqtrXfsf4t2i9tjkAc5macNdSOEBos7Nrdy3iFPnTM1m6pI+SV1nTXl/b3Ovmh5XZTZ
         /niy5FyzAOSpC+9ztaiRWrAU3KJhb1dIJSyNpg0lJJfIutGiTU4ronSFzvvUt1sQEO4c
         6YPg==
X-Gm-Message-State: AOAM530PZaots3Ueb5IDjQ1CwFI1hOCGlvDLCbhEIFI9IuyTjGLePdS8
        CJpkglAdEo+a078Pk2jLSwHyPVAg9rGxihCv
X-Google-Smtp-Source: ABdhPJxfcYkvR0NZ5paqTFpK0nhpdrKTe5N/SCytBU/Cr/XFP+DzITQ9ACYCuV2KeGpIOk9qYGS6oQ==
X-Received: by 2002:a63:ab0d:: with SMTP id p13mr1649392pgf.570.1639723515454;
        Thu, 16 Dec 2021 22:45:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b15sm8644113pfv.48.2021.12.16.22.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 22:45:15 -0800 (PST)
Message-ID: <61bc31fb.1c69fb81.d5321.80f3@mx.google.com>
Date:   Thu, 16 Dec 2021 22:45:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211216
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 795 runs, 20 regressions (next-20211216)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 795 runs, 20 regressions (next-20211216)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
beagle-xm                  | arm    | lab-baylibre  | clang-13 | multi_v7_d=
efconfig           | 1          =

minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config             | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip       | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip       | gcc-10   | defconfig+=
debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
ima                | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | clang-13 | defconfig =
                   | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
debug              | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig =
                   | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
crypto             | 1          =

zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
ima                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211216/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211216
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      fbf252e0967821ce890e23359d00c30132876014 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
beagle-xm                  | arm    | lab-baylibre  | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf87b3a094f05ac397151

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf87b3a094f05ac397=
152
        failing since 16 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826   | x86_64 | lab-collabora | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf0c3b6308480c3397136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3826.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3826.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf0c3b6308480c3397=
137
        new failure (last pass: next-20211214) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf6b35bd8d5e5d839714b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf6b35bd8d5e5d8397=
14c
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf949a2136c8754397136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf949a2136c8754397=
137
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip       | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf85850c04b90c439711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf85850c04b90c4397=
11f
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbfcb43b3a0d4d2f39711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbfcb43b3a0d4d2f397=
11f
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre  | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf68aaf3ea292dd397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf68aaf3ea292dd397=
149
        failing since 1 day (last pass: v5.16-rc5-6644-gbcd5ddb85fad, first=
 fail: next-20211214) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-broonie   | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf9325def74a2b2397186

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf9325def74a2b2397=
187
        failing since 1 day (last pass: v5.16-rc5-6644-gbcd5ddb85fad, first=
 fail: next-20211214) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip       | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf63834e68d8887397174

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf63834e68d8887397=
175
        failing since 1 day (last pass: v5.16-rc5-6644-gbcd5ddb85fad, first=
 fail: next-20211214) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbfc91da77256f8239711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbfc91da77256f82397=
11f
        failing since 1 day (last pass: v5.16-rc5-6644-gbcd5ddb85fad, first=
 fail: next-20211214) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbfff65f20c6a0d939716d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-r8a77950-salvator=
-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-baylibre/baseline-r8a77950-salvator=
-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbfff65f20c6a0d9397=
16e
        new failure (last pass: next-20211215) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre  | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61bc109d9ceed8459f397151

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bc109d9ceed8459f397=
152
        new failure (last pass: next-20211215) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbfa2051bb0f776239715c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbfa2051bb0f7762397=
15d
        failing since 23 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | clang-13 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbfb74a4c64b06aa39712d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbfb74a4c64b06aa397=
12e
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf354b6dd43387339719e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf354b6dd433873397=
19f
        failing since 23 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf598a876d8880739713a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf598a876d88807397=
13b
        failing since 23 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf728b4b79ce7f739714e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf728b4b79ce7f7397=
14f
        failing since 23 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf8901cecb98de639712f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf8901cecb98de6397=
130
        failing since 23 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbf9e486b2076a8d397164

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbf9e486b2076a8d397=
165
        failing since 23 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
zynqmp-zcu102              | arm64  | lab-cip       | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61bbfd1869a73381f4397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211216/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bbfd1869a73381f4397=
121
        failing since 23 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
