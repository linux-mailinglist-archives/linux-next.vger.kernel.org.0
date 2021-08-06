Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B083E3214
	for <lists+linux-next@lfdr.de>; Sat,  7 Aug 2021 01:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244737AbhHFXTd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 19:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhHFXTd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Aug 2021 19:19:33 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B4BC0613CF
        for <linux-next@vger.kernel.org>; Fri,  6 Aug 2021 16:19:16 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u2so9090611plg.10
        for <linux-next@vger.kernel.org>; Fri, 06 Aug 2021 16:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IrKrDTm7u+GEi3IOS3UD2Duk4Qi2dhl7mjwEm2ewooY=;
        b=zQqUkh49GLgcbg12XuXR/5rXBQJcbqIm1C7ZlrynetbdBgZ95+nHWJjEuoZ5T4zEwW
         +YdQqMVndCc5Zbn0WuWfPcoRB1u1ZuF1siiIslobpOzPb7pRYOkLk8V8gDEbe2VFgU+a
         Xiv9D+mZV/exYfsm9T0BY6OzX77tE6EbKudtI11l26ZepKabEPtUsRLtsV+vRSPf7wWW
         wpGfWgtMo0/OfO2X/A+ij0AjYblo0HeIWp31cQpMA7dwLLUNLDtjNiGIIgLqeV/MBO4Q
         d3utFtbDDCMMbdpVDnNldn9gd9Ev24KQclovCT0jH4xPlKAIlGAv95xpH2a+dkZ+pdbd
         cLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IrKrDTm7u+GEi3IOS3UD2Duk4Qi2dhl7mjwEm2ewooY=;
        b=DfNzDb0lzc2Je+lq6oYw1Ly/zwrEjmCvV/wZW6Fz0u9VE5gEkZXwDsU46SOTYPivn6
         AGDXKeavfdvK2gILvII25MK1CW91ljKxCqn3VFu4q65aoSeTQ8aE4jUrY6e1VwGpyu22
         SV7kwbyI7katCV0vHE3y5+Q67/V0ohSRHXfRxVt4lqf1vexm66oaBErzqrT+8lf1DOjR
         CQiLFKVasna2V862cNMQPQlvBGl058CcFWMx4YKePDqKKQ4yj3mp/TxQwnzLFhDuW4VA
         RWWNdE9XGVnRb3NJe94dk74z3zjhAphiNq7t7IyyVTuDN+5U9MZkCkJfF+fArsCCmQpi
         IzGg==
X-Gm-Message-State: AOAM533r209EjZssW+AHTwufv8+nNolgJpRMP2JA3NWfgQU3Ynxp7E5T
        Rmml52oc9aIC23I1vEs6BOP4Ma36ehbs07ms
X-Google-Smtp-Source: ABdhPJwFuJZu56r6pJ3ONdnuWnzp5iJMTjPjV3LBoTKB1/HTXLYpk0XwJiYk+ahd9GiKb4XkucLcNw==
X-Received: by 2002:a65:448a:: with SMTP id l10mr115845pgq.313.1628291954963;
        Fri, 06 Aug 2021 16:19:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t12sm13231569pgo.56.2021.08.06.16.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 16:19:14 -0700 (PDT)
Message-ID: <610dc372.1c69fb81.ef325.8a56@mx.google.com>
Date:   Fri, 06 Aug 2021 16:19:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210806
X-Kernelci-Report-Type: test
Subject: next/master baseline: 387 runs, 76 regressions (next-20210806)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 387 runs, 76 regressions (next-20210806)

Regressions Summary
-------------------

platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre    | clang-10 | defconfi=
g                    | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

fsl-ls1088a-rdb            | arm64  | lab-nxp         | clang-10 | defconfi=
g                    | 1          =

fsl-ls1088a-rdb            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

fsl-lx2160a-rdb            | arm64  | lab-nxp         | clang-10 | defconfi=
g                    | 1          =

fsl-lx2160a-rdb            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00       | riscv  | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =

imx8mn-ddr4-evk            | arm64  | lab-nxp         | clang-10 | defconfi=
g                    | 2          =

imx8mn-ddr4-evk            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+ima                | 2          =

imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qcom-qdf2400               | arm64  | lab-linaro-lkft | clang-10 | defconfi=
g                    | 1          =

qcom-qdf2400               | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qcom-qdf2400               | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | clang-10 | defconfi=
g                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip         | clang-10 | defconfi=
g                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | clang-10 | defconfi=
g                    | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | clang-10 | defconfi=
g                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | clang-10 | defconfi=
g                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | clang-10 | defconfi=
g                    | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre    | clang-10 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-cip         | clang-10 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | clang-10 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre    | clang-12 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-cip         | clang-12 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | clang-12 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =

qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =

qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =

qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =

qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | clang-10 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | clang-10 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | clang-10 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | clang-12 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | clang-12 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | clang-12 | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig             | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =

rk3328-rock64              | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe      | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210806/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210806
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7999516e20bd9bb5d1f7351cbd05ca529a3a8d60 =



Test Regressions
---------------- =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre    | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d840e0a8a73c9cfb1369d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d840e0a8a73c9cfb13=
69e
        failing since 50 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7f0dcdb16f6409b13672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-=
rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7f0dcdb16f6409b13=
673
        failing since 50 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
bcm2837-rpi-3-b            | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8562fecc5ca39ab13691

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-bcm2837-r=
pi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8562fecc5ca39ab13=
692
        failing since 50 days (last pass: next-20210616, first fail: next-2=
0210617) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb            | arm64  | lab-nxp         | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d85d8a2d3be0536b13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-ls1088a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d85d8a2d3be0536b13=
665
        failing since 259 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8048a04fa550e2b136a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8048a04fa550e2b13=
6a2
        failing since 259 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
fsl-ls1088a-rdb            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8809565c879492b1368b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8809565c879492b13=
68c
        failing since 259 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
fsl-lx2160a-rdb            | arm64  | lab-nxp         | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8548feccf51df9b1366a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-nxp/baseline-fsl-lx2160a-rdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8548feccf51df9b13=
66b
        failing since 17 days (last pass: next-20210709, first fail: next-2=
0210719) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
fsl-lx2160a-rdb            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d85fbff117fb9e7b13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-lx2160a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d85fbff117fb9e7b13=
676
        failing since 17 days (last pass: next-20210714, first fail: next-2=
0210719) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre    | gcc-8    | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7b3d156dc8003fb1368c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7b3d156dc8003fb13=
68d
        failing since 98 days (last pass: next-20210429, first fail: next-2=
0210430) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-nxp         | clang-10 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/610d8447ba90c3797bb1366e

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/610d8447ba90c37=
97bb13672
        new failure (last pass: next-20210729)
        12 lines

    2021-08-06T18:49:16.188134  kern  :alert : Unable to handle kernel NULL=
 pointer dereference <8>[   14.619710] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=
=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2021-08-06T18:49:16.188437  at virtual address 0000000000000098
    2021-08-06T18:49:16.188636  kern  :alert : Mem abort info:
    2021-08-06T18:49:16.188814  kern  :alert :   ESR =3D 0x96000046
    2021-08-06T18:49:16.188980  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-08-06T18:49:16.189144  kern  :alert :   SET =3D <8>[   14.644372] =
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEAS=
UREMENT=3D2>
    2021-08-06T18:49:16.189318  0, FnV =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/610d8447ba90c37=
97bb13673
        new failure (last pass: next-20210729)
        2 lines =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mn-ddr4-evk            | arm64  | lab-nxp         | gcc-8    | defconfi=
g+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/610d8188f0a7cafc3db13673

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/610d8188f0a7caf=
c3db13677
        failing since 2 days (last pass: next-20210802, first fail: next-20=
210803)
        12 lines

    2021-08-06T18:37:30.699645  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 000000000000<8>[   14.258444] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D12>
    2021-08-06T18:37:30.699944  0098
    2021-08-06T18:37:30.700142  kern  :alert : Mem abort info:
    2021-08-06T18:37:30.700328  kern  :alert :   ESR =3D 0x96000046
    2021-08-06T18:37:30.700499  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2021-08-06T18:37:30.700674  kern  :alert :   SET =3D 0, FnV =3D 0
    2021-08-06T18:37:30.700843  kern  :alert :   EA =3D 0, S1PTW =3D 0   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/610d8188f0a7caf=
c3db13678
        failing since 2 days (last pass: next-20210802, first fail: next-20=
210803)
        2 lines

    2021-08-06T18:37:30.701872  kern  :alert :<8>[   14.287747] <LAVA_SIGNA=
L_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D2=
>   =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
imx8mp-evk                 | arm64  | lab-nxp         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8b4bad04429096b1368a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8b4bad04429096b13=
68b
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qcom-qdf2400               | arm64  | lab-linaro-lkft | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d841b1b58f1e679b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qcom-qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qcom-qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d841b1b58f1e679b13=
66f
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210726) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qcom-qdf2400               | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7f1dbf20dbfe8db13672

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-=
qdf2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-=
qdf2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7f1dbf20dbfe8db13=
673
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qcom-qdf2400               | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8584726d55d5e7b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-q=
df2400.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qcom-q=
df2400.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8584726d55d5e7b13=
662
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-baylibre    | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7a6f1b74f82861b13670

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7a6f1b74f82861b13=
671
        failing since 261 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-cip         | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610d79f6e580227dc9b13673

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d79f6e580227dc9b13=
674
        failing since 261 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm-versatilepb       | arm    | lab-linaro-lkft | gcc-8    | versatil=
e_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/610db7938f989ee9f2b13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db7938f989ee9f2b13=
66a
        failing since 261 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d862705a5e5e336b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d862705a5e5e336b13=
664
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210726) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip         | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d856efecc5ca39ab136b3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d856efecc5ca39ab13=
6b4
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210726) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610dbae9dfff70ead1b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv2-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dbae9dfff70ead1b13=
662
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210726) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7f0963279d3f37b1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7f0963279d3f37b13=
67b
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d863ca0f5f588c2b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d863ca0f5f588c2b13=
662
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7f23bf20dbfe8db13679

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7f23bf20dbfe8db13=
67a
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d85aada0b589e12b13686

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d85aada0b589e12b13=
687
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610db90b038cbf0938b1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db90b038cbf0938b13=
67b
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610dbb1172157cb41cb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dbb1172157cb41cb13=
662
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d85d7a2d3be0536b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d85d7a2d3be0536b13=
662
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210726) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8537b7b7188e31b13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8537b7b7188e31b13=
668
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210726) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | clang-10 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/610dbad5de50f13dfbb13684

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig/clang-10/lab-linaro-lkft/baseline-qemu_arm64-virt-gicv3-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dbad5de50f13dfbb13=
685
        failing since 10 days (last pass: next-20210719, first fail: next-2=
0210726) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7f824180566f48b13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7f824180566f48b13=
677
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d867756a351f053b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-qemu_arm6=
4-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d867756a351f053b13=
675
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7f8029fa756e53b1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7f8029fa756e53b13=
67d
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-cip         | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d85c7a89f23e7e7b1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-cip/baseline-qemu_arm64-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d85c7a89f23e7e7b13=
66e
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610db91e5e5dab1609b1367f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_=
arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db91e5e5dab1609b13=
680
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64  | lab-linaro-lkft | gcc-8    | defconfi=
g+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610dbb12dfff70ead1b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dbb12dfff70ead1b13=
675
        failing since 14 days (last pass: next-20210722, first fail: next-2=
0210723) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre    | clang-10 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d80d50d1c157ac4b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d80d50d1c157ac4b13=
66d
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-cip         | clang-10 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d80db0d1c157ac4b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d80db0d1c157ac4b13=
675
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | clang-10 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610db96f179e11abbdb136eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db96f179e11abbdb13=
6ec
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre    | clang-12 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d82a2862ba36f25b1367e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d82a2862ba36f25b13=
67f
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-cip         | clang-12 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d82bbf555b86746b13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d82bbf555b86746b13=
679
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | clang-12 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610dba491d0f5eb12db13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dba491d0f5eb12db13=
664
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7d8d76d2fd370cb13678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7d8d76d2fd370cb13=
679
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7e2d391ee620cdb1373f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7e2d391ee620cdb13=
740
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8035a04fa550e2b1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8035a04fa550e2b13=
67b
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/610d82ded8c925cbc5b1367c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d82ded8c925cbc5b13=
67d
        new failure (last pass: next-20210804) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7d621850297056b13674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7d621850297056b13=
675
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7defb6108cebfbb1368a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7defb6108cebfbb13=
68b
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/610d806ec6da4617c4b13683

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d806ec6da4617c4b13=
684
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/610d833e1be1e165b7b136f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d833e1be1e165b7b13=
6f1
        new failure (last pass: next-20210804) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610db8e3431cb6ed0ab13667

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db8e3431cb6ed0ab13=
668
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/610db8f5e007c5d04db13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db8f5e007c5d04db13=
662
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/610db95a18ef3e7754b13685

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db95a18ef3e7754b13=
686
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi           | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/610dba5d13d07575cfb13697

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dba5d13d07575cfb13=
698
        new failure (last pass: next-20210804) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | clang-10 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d80ad950c28a5ceb1366d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d80ad950c28a5ceb13=
66e
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | clang-10 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d80fec52c39701ab1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d80fec52c39701ab13=
67b
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | clang-10 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610db96e179e11abbdb136e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-10/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db96e179e11abbdb13=
6e9
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | clang-12 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d827adb1594e04db13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d827adb1594e04db13=
664
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | clang-12 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d829e862ba36f25b1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d829e862ba36f25b13=
66f
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | clang-12 | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610dba2113d07575cfb13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210630032607+fed41=
342a82f-1~exp1~20210630133324.130)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/clang-12/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dba2113d07575cfb13=
662
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7d511850297056b13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7d511850297056b13=
672
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7e41b3feaf6543b13663

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7e41b3feaf6543b13=
664
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/610d800d9744d8e140b13675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d800d9744d8e140b13=
676
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre    | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8306489a361bb2b13692

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8306489a361bb2b13=
693
        new failure (last pass: next-20210804) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7d7b9282ba466eb13669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7d7b9282ba466eb13=
66a
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7dfbda6fc04280b1367a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7dfbda6fc04280b13=
67b
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/610d80419c5f714b58b1366c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d80419c5f714b58b13=
66d
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-cip         | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/610d8374af2628b0ebb13671

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d8374af2628b0ebb13=
672
        new failure (last pass: next-20210804) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/610db8e2828ce99000b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db8e2828ce99000b13=
662
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/610db8f6038cbf0938b13661

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-linaro-lkft/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db8f6038cbf0938b13=
662
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efcon...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/610db9599abb15d2deb1366e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610db9599abb15d2deb13=
66f
        new failure (last pass: next-20210805) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-linaro-lkft | gcc-8    | x86_64_d=
efconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/610dba5e1d0f5eb12db13676

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-linaro-lkft/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610dba5e1d0f5eb12db13=
677
        new failure (last pass: next-20210804) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
rk3328-rock64              | arm64  | lab-baylibre    | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7df914dfcebbddb13664

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7df914dfcebbddb13=
665
        failing since 52 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                   | arch   | lab             | compiler | defconfi=
g                    | regressions
---------------------------+--------+-----------------+----------+---------=
---------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe      | gcc-8    | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/610d7f2feb146eb974b13687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210806/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/610d7f2feb146eb974b13=
688
        failing since 176 days (last pass: next-20210209, first fail: next-=
20210210) =

 =20
