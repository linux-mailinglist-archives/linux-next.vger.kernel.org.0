Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02CA476F14
	for <lists+linux-next@lfdr.de>; Thu, 16 Dec 2021 11:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbhLPKoV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Dec 2021 05:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236223AbhLPKoS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Dec 2021 05:44:18 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24E7C061574
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 02:44:17 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id r34-20020a17090a43a500b001b0f0837ce8so2181049pjg.2
        for <linux-next@vger.kernel.org>; Thu, 16 Dec 2021 02:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zjWqjvfS25rPd+PmnFvLqP95PEPldou8EXjtDae32/M=;
        b=LOUQbl/48l89TNVH+5JXChiPIcf7y/SwV7Q9RAtlXhD0jsnhJyGAfDfBhazlGub5Qd
         VW2xDWREGfGSNlg+U2XscVDGDUiwhkGy3BVS9asvjemqvb+sYrhzusirkn3jhvQjr0SK
         zi6eXsfEH+BXp5anREetu+9wVBT8fJDaBwBrKigHxgZ0G9VQz662/znqSYOMhWXO2FiN
         pHhx4GN3lNG4iVGcli1Lg0HKGONCicegMAOBWUpDQYnnZbC33fa2ekIRB6hiGLNOvOXh
         RbxckKsNC9kk7KYNN6oFBRKrXhfYI8dP7qOTz5P59+BeHJ7hGHxylxNFknS9nkCnpHIz
         UYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zjWqjvfS25rPd+PmnFvLqP95PEPldou8EXjtDae32/M=;
        b=OtPU5xgn+op9DLyjr7XfYRJ+hG7LSiSwq7KGddeJI51x+/ED8eKU5eSOhSIqjrbDYO
         rEOtQlgDCL4laGTkk9iE6s4ExoP1vicTlw6i0WibQMkIKx/pmTZVoISb2Hf4Je9HFbfm
         5Vp0ZJ1Z6LuTb5HQBivU5lUZT9siUnqHCa/pK5KbT34bQLTT3KkO/eOn2NlRVUQgdOK5
         nX7wd+OGo9NE9+Y89Xx/xHJtDS4qx5f5DWvxzTi+BVggybKyD7zx4VcJ/SvWltmIHw0G
         3bULeziEduKyn5vKolTLoq/OB4TLAf+Ch1wioUQ6Zzb4Jp0magHDLjrdboLSKP0L5loy
         80aw==
X-Gm-Message-State: AOAM531XqQcxMPJDtsUUpH/oRVdzw6bvXcBUm6TMbXMQDFQshuXqidr0
        5D5H03xEL/B2FD/HPwj/6MisJZVGo1KVUgF6
X-Google-Smtp-Source: ABdhPJzEbDsZynZEpNeo7pfyUVY9wYxq2CQKh9oN5DYaxshPxvchXV0pVyAsu2RQ0P9PM6x0FlpL/Q==
X-Received: by 2002:a17:903:2448:b0:148:a658:8d31 with SMTP id l8-20020a170903244800b00148a6588d31mr7869138pls.133.1639651456633;
        Thu, 16 Dec 2021 02:44:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g13sm4959262pjc.39.2021.12.16.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 02:44:16 -0800 (PST)
Message-ID: <61bb1880.1c69fb81.c81d5.d6da@mx.google.com>
Date:   Thu, 16 Dec 2021 02:44:16 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211215
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 847 runs, 30 regressions (next-20211215)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 847 runs, 30 regressions (next-20211215)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | clang-13 | defconfig =
                   | 1          =

bcm2711-rpi-4-b          | arm64  | lab-collabora   | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | clang-13 | defconfig =
                   | 1          =

bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
crypto             | 1          =

bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
ima                | 1          =

bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig =
                   | 1          =

bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
crypto             | 1          =

bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
arm64-chromebook   | 1          =

bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
ima                | 1          =

bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig =
                   | 1          =

beagle-xm                | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =

kontron-kbox-a-230-ls    | arm64  | lab-kontron     | gcc-10   | defconfig+=
ima                | 1          =

meson-gxbb-p200          | arm64  | lab-baylibre    | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+crypto      | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =

qemu_arm-virt-gicv3      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =

qemu_arm-virt-gicv3      | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =

r8a77950-salvator-x      | arm64  | lab-baylibre    | gcc-10   | defconfig =
                   | 1          =

zynqmp-zcu102            | arm64  | lab-cip         | clang-13 | defconfig =
                   | 1          =

zynqmp-zcu102            | arm64  | lab-cip         | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
crypto             | 1          =

zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
ima                | 1          =

zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig =
                   | 1          =

zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211215/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211215
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      93bf6eee76c0e716f6b32de690b1c52991547bb4 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | clang-13 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae37e46e9f04ed3397142

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae37e46e9f04ed3397=
143
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae46eee40a3ba5d3971b4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-bcm2=
711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-bcm2=
711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae46eee40a3ba5d397=
1b5
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | clang-13 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae376dc4bea3853397121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae376dc4bea3853397=
122
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae46cee40a3ba5d397155

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-bc=
m2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-bc=
m2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae46cee40a3ba5d397=
156
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61badf1b45b7ca9fcf3971af

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-collabora/baseline-bcm2711=
-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61badf1b45b7ca9fcf397=
1b0
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae0ad698dac19a6397123

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae0ad698dac19a6397=
124
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae0ae54d4dd631f39714f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae0ae54d4dd631f397=
150
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae2788185a5d11339711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae2788185a5d113397=
11f
        failing since 0 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: next-20211214) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-collabora   | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae2def1a25663e339711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae2def1a25663e3397=
11f
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61badf3ede1ea30fa139712f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-bcm27=
11-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-linaro-lkft/baseline-bcm27=
11-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61badf3ede1ea30fa1397=
130
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae098bb81554920397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae098bb81554920397=
129
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae0a9795c40018b39712a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae0a9795c40018b397=
12b
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae2647c563883f739712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae2647c563883f7397=
12c
        failing since 0 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: next-20211214) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
bcm2711-rpi-4-b          | arm64  | lab-linaro-lkft | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae2c8fba74e219739712f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae2c8fba74e2197397=
130
        failing since 2 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
beagle-xm                | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae3635e568cf6de397125

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae3635e568cf6de397=
126
        failing since 15 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
kontron-kbox-a-230-ls    | arm64  | lab-kontron     | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae1e77e7c599b0c39711e

  Results:     92 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.sl28cpld-wdt-probed: https://kernelci.org/test/case/id/=
61bae1e77e7c599b0c397168
        new failure (last pass: next-20211214)

    2021-12-16T06:51:15.460699  /lava-68381/1/../bin/lava-test-case
    2021-12-16T06:51:15.461458  <8>[   18.252004] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-wdt-probed RESULT=3Dfail>
    2021-12-16T06:51:15.461770  /lava-68381/1/../bin/lava-test-case
    2021-12-16T06:51:15.462016  <8>[   18.268068] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-fan-driver-present RESULT=3Dpass>
    2021-12-16T06:51:15.462271  /lava-68381/1/../bin/lava-test-case
    2021-12-16T06:51:15.462504  <8>[   18.284073] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsl28cpld-fan-probed RESULT=3Dpass>
    2021-12-16T06:51:15.462735  /lava-68381/1/../bin/lava-test-case   =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
meson-gxbb-p200          | arm64  | lab-baylibre    | gcc-10   | defconfig+=
CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61baeabf67d16951ae397153

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baeabf67d16951ae397=
154
        new failure (last pass: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61bade91b57f817327397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bade91b57f817327397=
149
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/61baea07a6a42f5038397138

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv2-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baea07a6a42f5038397=
139
        failing since 8 days (last pass: next-20211201, first fail: next-20=
211207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/61baedc5c541498c13397135

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv2-ue=
fi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baedc5c541498c13397=
136
        failing since 8 days (last pass: next-20211201, first fail: next-20=
211207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/61baea06e4df26980339711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm-virt-gicv3.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baea06e4df269803397=
11f
        failing since 8 days (last pass: next-20211201, first fail: next-20=
211207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/61baed768a4ce7e30a397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm/=
multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm-virt-gicv3.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baed768a4ce7e30a397=
133
        failing since 8 days (last pass: next-20211201, first fail: next-20=
211207) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
r8a77950-salvator-x      | arm64  | lab-baylibre    | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61baf3d0cccbae4a02397128

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61baf3d0cccbae4a02397=
129
        new failure (last pass: next-20211214) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
zynqmp-zcu102            | arm64  | lab-cip         | clang-13 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae563fa4fec9f61397175

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae563fa4fec9f61397=
176
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
zynqmp-zcu102            | arm64  | lab-cip         | clang-13 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae6cb0dc099caf1397157

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae6cb0dc099caf1397=
158
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61badf2308946ecea3397121

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61badf2308946ecea3397=
122
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae0b3795c40018b39714e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae0b3795c40018b397=
14f
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae26b5e4597068f397166

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae26b5e4597068f397=
167
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae2cf3e1f887ef8397148

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae2cf3e1f887ef8397=
149
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
zynqmp-zcu102            | arm64  | lab-cip         | gcc-10   | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61bae730e44c4d06ff39711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211215/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61bae730e44c4d06ff397=
11f
        failing since 22 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
