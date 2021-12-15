Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B86247571F
	for <lists+linux-next@lfdr.de>; Wed, 15 Dec 2021 11:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241840AbhLOK7r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Dec 2021 05:59:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241825AbhLOK7r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Dec 2021 05:59:47 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6EDC061574
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 02:59:47 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so19999532pjc.4
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 02:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GZdbzyLZyPmtWaGZgMHoScU355r9802u9PuvVWjlY9g=;
        b=zvVfgQ3GY2aag37vs3WWCgOOXMOboUTdhjsve/YM+iWoqH1ylsv4Loz/EImsB2R6SD
         5/4MQt2DbQjwch6EnRvxQUG2eKu1Ax4/O9+IAmHGNcobbv9Yuo2iUvYDH6bPI4JOVONR
         ZcfApBTCLqxxbv7rxIn3ZGWXgi+S9w9XsdW9YJ+QgKX6gD9MzMDM45jX102MCWxaNuIt
         S56v7gN88rPriwK4i+JgHrct06u6i4KqrY5z5PRfPiTtx8k5Pa0lNudm5eUvG06jCRCX
         UoPkLoBjVpnByQ8JNdHGckBmiDlb60kxAjwv59guNNSGhMoeI4aqf6+RFjcDe4v3ej6q
         bHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GZdbzyLZyPmtWaGZgMHoScU355r9802u9PuvVWjlY9g=;
        b=dHYgFAoJ/0LQ916GMVBsihWcZdO1FncxwSavO8R6kGjeK/1wy/+XrYqPn7gA1wlrlL
         ug5j0npLKJ+WTqZNHMeT8kpG7+QhNNqFe3tVSBxp/4ZL6LqJNUqJ916OEoI5NemMFcFh
         AFeh5mbnL/q8wtDRcuCdfHwTtl8nTNBPMN5nuNoKf1f76pDOKRGG2u1tKC7jDJjE1rHN
         wD+bOB3fIDYiQJOCFzdg51yIJf/Cx/KY9yQ8t/E51fRbVvDyvDXPvDWM6ZouIBEvCUzA
         ZACjDdQei4rVoVn0f9TWs17nNXalXl0u7ypczdYBS0elkAV7M3oO1/guiU6SePMHwnkV
         7aSw==
X-Gm-Message-State: AOAM533ire4ij5DMh7BG4iPRV/jruJhpzCGBpxZkEMb+Qd6kjwKww+JY
        xPfOUlrd4zlgNiRyk7gWPulw1Ewv/oVtCdhx
X-Google-Smtp-Source: ABdhPJzx1WF7kjOZJzqJOM61kJaLJ0HfJLQEIlEPdvlXjmK6sa8UKpLvm9Mf8KkX7zjeJPZ0o+ryyw==
X-Received: by 2002:a17:90b:4c85:: with SMTP id my5mr10854364pjb.26.1639565986171;
        Wed, 15 Dec 2021 02:59:46 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13sm2139316pfp.216.2021.12.15.02.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 02:59:45 -0800 (PST)
Message-ID: <61b9caa1.1c69fb81.57f5.54d8@mx.google.com>
Date:   Wed, 15 Dec 2021 02:59:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211214
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 707 runs, 28 regressions (next-20211214)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 707 runs, 28 regressions (next-20211214)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g                    | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g                    | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+crypto             | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+ima                | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g                    | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+crypto             | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+ima                | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =

bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g                    | 1          =

bcm2836-rpi-2-b            | arm    | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =

beagle-xm                  | arm    | lab-baylibre    | clang-13 | multi_v7=
_defconfig           | 1          =

minnowboard-turbot-E3826   | x86_64 | lab-collabora   | gcc-10   | x86_64_d=
efcon...86_kvm_guest | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =

r8a77950-salvator-x        | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+ima                | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g                    | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+crypto             | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+ima                | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211214/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211214
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0bafb8f3ebc84525d0ae0fcea22d12151b99312f =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b98dc3723844d01d39714a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-bcm2=
711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-collabora/baseline-bcm2=
711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b98dc3723844d01d397=
14b
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | clang-13 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b9918516bbb0f48139715c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/clang-13/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b9918516bbb0f481397=
15d
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b98dbf723844d01d39713f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-bc=
m2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-linaro-lkft/baseline-bc=
m2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b98dbf723844d01d397=
140
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | clang-13 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b9916e7d2512ac843971a4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/clang-13/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b9916e7d2512ac84397=
1a5
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b9927737939cceca39713b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b9927737939cceca397=
13c
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61b9927838af730159397132

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b9927838af730159397=
133
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61b993b7ff5b86d9253971b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b993b7ff5b86d925397=
1b1
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-collabora   | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b9969b367cba1c63397178

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/gcc-10/lab-collabora/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b9969b367cba1c63397=
179
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b9926b37939cceca397136

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+crypto/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b9926b37939cceca397=
137
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61b9927070a32f132939719e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b9927070a32f1329397=
19f
        new failure (last pass: v5.16-rc4-6579-gea922272cbe5) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/61b993abff5b86d925397189

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b993abff5b86d925397=
18a
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2711-rpi-4-b            | arm64  | lab-linaro-lkft | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b996670217533fd7397146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/gcc-10/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b996670217533fd7397=
147
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2836-rpi-2-b            | arm    | lab-collabora   | gcc-10   | bcm2835_=
defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99e0c753e65330639714c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm/=
bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99e0c753e653306397=
14d
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
beagle-xm                  | arm    | lab-baylibre    | clang-13 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61b990cd3aa9fc48e539717e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b990cd3aa9fc48e5397=
17f
        failing since 14 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826   | x86_64 | lab-collabora   | gcc-10   | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99596873959357e39714b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-minnowboard=
-turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-minnowboard=
-turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99596873959357e397=
14c
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99b16c3506193cd397169

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99b16c3506193cd397=
16a
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99bd0569be70c9a39713a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99bd0569be70c9a397=
13b
        failing since 1 day (last pass: v5.16-rc4-6579-gea922272cbe5, first=
 fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99bb61f1706024039712c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99bb61f17060240397=
12d
        new failure (last pass: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b999c69f87f8ee7139712d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b999c69f87f8ee71397=
12e
        new failure (last pass: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-collabora   | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99c10cb75d4115539715e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99c10cb75d41155397=
15f
        new failure (last pass: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
r8a77950-salvator-x        | arm64  | lab-baylibre    | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99c4c1240667fd939712c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99c4c1240667fd9397=
12d
        new failure (last pass: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b98dc4723844d01d39714e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b98dc4723844d01d397=
14f
        failing since 21 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | clang-13 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99184a0a1191ef939717c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211124042950+19b83=
68225dc-1~exp1~20211124043523.27)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99184a0a1191ef9397=
17d
        failing since 21 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99350597133437139713a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+crypto/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b993505971334371397=
13b
        failing since 21 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99440506a279829397156

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+ima/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99440506a279829397=
157
        failing since 21 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61b995bc0b28b29c09397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b995bc0b28b29c09397=
121
        failing since 21 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99620cb7e4714a23971d5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99620cb7e4714a2397=
1d6
        failing since 21 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
zynqmp-zcu102              | arm64  | lab-cip         | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61b99724575183ad0e39712b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211214/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61b99724575183ad0e397=
12c
        failing since 21 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
