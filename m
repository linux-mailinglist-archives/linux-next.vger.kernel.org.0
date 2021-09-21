Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DAD413D88
	for <lists+linux-next@lfdr.de>; Wed, 22 Sep 2021 00:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbhIUW3Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 18:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhIUW3Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 18:29:25 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F325C061574
        for <linux-next@vger.kernel.org>; Tue, 21 Sep 2021 15:27:56 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id v19so636270pjh.2
        for <linux-next@vger.kernel.org>; Tue, 21 Sep 2021 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=zmZx22dk2IhCy3dTjOFXZWOCaMLT04uV3G4BNIz4mxQ=;
        b=X6z1yQOpEqP529XN2t3j9lFn+E/d8ZjOe+s+XQG7CiiXzFz0E86Ueifz1inZHLeqtM
         nexIYFicoG9TYw9OOo94sU4XYqApykxs/vJNFnlInEz4hcibl46h69fDJTz4S2EPRUGG
         VgnY1AgKL1kwypOSuqraLw60HSSW4O1/zatckFatEklvKNHsW9bxaYXSzEj8lkmyNzS4
         EMeHVigxS+pOfqxqp966JmsoVKcdvGoGnG2ycIJkShHNOYZ0tVd/XAQ+cY7euwM2WSiG
         VFpB3OfFWT9w6a6DAdh4yVzG64PG5qYrYVQgt638xlOoIUDtqbgS7XrY7Sj9s+jl1mIq
         9bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=zmZx22dk2IhCy3dTjOFXZWOCaMLT04uV3G4BNIz4mxQ=;
        b=RYEbMCT7reNZnWYXpeLg6c0Gz723pKqdJEVeB06pYeLxGG7mGTZosha9sSvbf7icGP
         A5DyQnPlcLA1jLF035jP+4OGJgnRBYC9t52Q1bOmNNewOYV5I3uGqtmWErgt4iX47OGI
         CSWjv8/HeE2vpVKrzBDC8LSvtXeWAqkKXfgzSu66gPJyXOXmRysIwo1jCuRFGpwhTzxK
         SUr2PfM/D0skk/dpackhagwrOkUw97vNFTNxduy4SYF6GRIWKa9zfFMoz6i2jycgFL8X
         9XMgPDvE0MGo32WeJURzcVVLXs3bpdnDbYTU6baevyCnGcoAQHKe0Igk+5LlKmDmFd3Y
         JI3w==
X-Gm-Message-State: AOAM533s2NOZiOngkAcXzzazCk2d4xgKb1VTDMl3s9v8zsPip2tmSBuP
        6H19a826LkCd6DfCSVH5y4cQ090iszpcsjYr
X-Google-Smtp-Source: ABdhPJyv39Kzz3Gwttq3hDk20jH97OYdPWPWDZo3pHfj0fV6/I+4P7beG7os9gvloaEGf/l/z0l/1g==
X-Received: by 2002:a17:902:ab54:b0:13c:9118:8520 with SMTP id ij20-20020a170902ab5400b0013c91188520mr29137158plb.44.1632263274340;
        Tue, 21 Sep 2021 15:27:54 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s9sm152388pfw.143.2021.09.21.15.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 15:27:53 -0700 (PDT)
Message-ID: <614a5c69.1c69fb81.a11a.112e@mx.google.com>
Date:   Tue, 21 Sep 2021 15:27:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210921
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 527 runs, 90 regressions (next-20210921)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 527 runs, 90 regressions (next-20210921)

Regressions Summary
-------------------

platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm                | arm    | lab-baylibre  | clang-12 | multi_v7_def=
config           | 1          =

beagle-xm                | arm    | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 1          =

beagle-xm                | arm    | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm                | arm    | lab-baylibre  | gcc-8    | omap2plus_de=
fconfig          | 1          =

fsl-ls1088a-rdb          | arm64  | lab-nxp       | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb          | arm64  | lab-nxp       | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00     | riscv  | lab-baylibre  | gcc-8    | defconfig   =
                 | 1          =

hip07-d05                | arm64  | lab-collabora | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

hip07-d05                | arm64  | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd            | arm    | lab-nxp       | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx7d-sdb                | arm    | lab-nxp       | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-12 | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-12 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-12 | defconfig   =
                 | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+cr=
ypto             | 1          =

imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+im=
a                | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-8    | defconfig+im=
a                | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | clang-12 | x86_64_defco=
nfig             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig             | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_arm-versatilepb     | arm    | lab-baylibre  | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-cip       | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb     | arm    | lab-collabora | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-vexpress-a15    | arm    | lab-baylibre  | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a15    | arm    | lab-cip       | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a15    | arm    | lab-collabora | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9     | arm    | lab-baylibre  | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9     | arm    | lab-cip       | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9     | arm    | lab-collabora | gcc-8    | vexpress_def=
config           | 1          =

qemu_i386                | i386   | lab-cip       | clang-10 | i386_defconf=
ig               | 1          =

qemu_i386                | i386   | lab-cip       | clang-12 | i386_defconf=
ig               | 1          =

qemu_i386                | i386   | lab-cip       | gcc-8    | i386_defconf=
ig               | 1          =

qemu_i386-uefi           | i386   | lab-cip       | clang-10 | i386_defconf=
ig               | 1          =

qemu_i386-uefi           | i386   | lab-cip       | clang-12 | i386_defconf=
ig               | 1          =

qemu_i386-uefi           | i386   | lab-cip       | gcc-8    | i386_defconf=
ig               | 1          =

qemu_x86_64              | x86_64 | lab-cip       | clang-12 | x86_64_defco=
nfig             | 1          =

qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+ima         | 1          =

qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig             | 1          =

qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre  | clang-12 | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip       | clang-12 | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora | clang-12 | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | clang-12 | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | clang-12 | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | clang-12 | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =

rk3288-veyron-jaq        | arm    | lab-collabora | clang-12 | multi_v7_def=
config           | 1          =

rk3288-veyron-jaq        | arm    | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq        | arm    | lab-collabora | gcc-8    | multi_v7_def=
config           | 1          =

rk3288-veyron-jaq        | arm    | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+cr=
ypto             | 1          =

rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+im=
a                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210921/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210921
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      83fa5857d812b46010841c677a90a3f858c2c838 =



Test Regressions
---------------- =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b          | arm    | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614a21499e94c8c34b99a2fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a21499e94c8c34b99a=
2fc
        failing since 209 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | clang-12 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a213e96ad60084c99a2f8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a213e96ad60084c99a=
2f9
        failing since 8 days (last pass: next-20210908, first fail: next-20=
210913) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1de2ad395a91cc99a2f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1de2ad395a91cc99a=
2f2
        new failure (last pass: next-20210920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1fe93eff9580a699a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1fe93eff9580a699a=
2f7
        failing since 56 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
beagle-xm                | arm    | lab-baylibre  | gcc-8    | omap2plus_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c6446bc3a1c5699a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
omap2plus_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c6446bc3a1c5699a=
2f4
        new failure (last pass: next-20210920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
fsl-ls1088a-rdb          | arm64  | lab-nxp       | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1b44fc561242cd99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1b44fc561242cd99a=
2dd
        failing since 305 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
fsl-ls1088a-rdb          | arm64  | lab-nxp       | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1d6f3836dc237a99a359

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1d6f3836dc237a99a=
35a
        failing since 305 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hifive-unleashed-a00     | riscv  | lab-baylibre  | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1b6ded0969ef5499a30d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1b6ded0969ef5499a=
30e
        failing since 144 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hip07-d05                | arm64  | lab-collabora | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a240204dab9d31c99a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a240204dab9d31c99a=
2f7
        failing since 83 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
hip07-d05                | arm64  | lab-collabora | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a25773d7278267b99a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a25773d7278267b99a=
2ec
        failing since 83 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx6q-sabresd            | arm    | lab-nxp       | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1d7d236c8e272799a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1d7d236c8e272799a=
2db
        failing since 330 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx7d-sdb                | arm    | lab-nxp       | gcc-8    | imx_v6_v7_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1d781a11a7df1399a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1d781a11a7df1399a=
2f7
        failing since 1 day (last pass: next-20210914, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-12 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f9d093e7c3d3f99a300

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f9d093e7c3d3f99a=
301
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | clang-12 | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a25a30bc91833e399a2ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-imx8m=
n-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-12/lab-baylibre/baseline-imx8m=
n-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a25a30bc91833e399a=
300
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | clang-12 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614a201e8357da1c6699a2f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a201e8357da1c6699a=
2f6
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1b00a416a544d199a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1b00a416a544d199a=
2f8
        new failure (last pass: next-20210915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c7c66b5e0b2bf99a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c7c66b5e0b2bf99a=
2e8
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1df95e749003ef99a314

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1df95e749003ef99a=
315
        failing since 0 day (last pass: next-20210914, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-baylibre  | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2192f30905de2199a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2192f30905de2199a=
2df
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c72ec85ce34f399a307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mn-ddr4-ev=
k.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c72ec85ce34f399a=
308
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk          | arm64  | lab-nxp       | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/614a202f25d174c81a99a32e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a202f25d174c81a99a=
32f
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1a3a25995dd1d199a305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-minnowboard-turbot-E382=
6.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-minnowboard-turbot-E382=
6.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1a3a25995dd1d199a=
306
        new failure (last pass: next-20210915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a19c2a79c00316d99a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-minnowboard-turbot-E3826.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-minnowboard-turbot-E3826.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a19c2a79c00316d99a=
2ec
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1bbee684257b0c99a2ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-minnowboard-turbot-=
E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-minnowboard-turbot-=
E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1bbee684257b0c99a=
2ed
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
minnowboard-turbot-E3826 | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c78a507eb62dd99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-minnowboard-=
turbot-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-minnowboard-=
turbot-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c78a507eb62dd99a=
2db
        new failure (last pass: next-20210915) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm    | lab-baylibre  | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2134d63e89936b99a2f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2134d63e89936b99a=
2f2
        failing since 307 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm    | lab-cip       | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a15be7c02d25fd499a30e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a15be7c02d25fd499a=
30f
        failing since 307 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb     | arm    | lab-collabora | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1572c370e11c2399a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1572c370e11c2399a=
2e9
        failing since 307 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15    | arm    | lab-baylibre  | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a251dd9395688fd99a30e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a251dd9395688fd99a=
30f
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15    | arm    | lab-cip       | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1a529bdc2e582699a2f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1a529bdc2e582699a=
2f7
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15    | arm    | lab-collabora | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1aebaa8563645f99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1aebaa8563645f99a=
2e0
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9     | arm    | lab-baylibre  | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2509763fd3d5b999a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2509763fd3d5b999a=
2df
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9     | arm    | lab-cip       | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1a4fb4b2f1bdf899a2f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1a4fb4b2f1bdf899a=
2f2
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9     | arm    | lab-collabora | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1ae8aa8563645f99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
vexpress_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1ae8aa8563645f99a=
2db
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_i386                | i386   | lab-cip       | clang-10 | i386_defconf=
ig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1fbdb6411d0f3099a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1fbdb6411d0f3099a=
2dd
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_i386                | i386   | lab-cip       | clang-12 | i386_defconf=
ig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f3df7a5e5877699a360

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f3df7a5e5877699a=
361
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_i386                | i386   | lab-cip       | gcc-8    | i386_defconf=
ig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1b17bbaba91aaf99a2df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1b17bbaba91aaf99a=
2e0
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_i386-uefi           | i386   | lab-cip       | clang-10 | i386_defconf=
ig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1fd255d018f75399a2f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1fd255d018f75399a=
2f3
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_i386-uefi           | i386   | lab-cip       | clang-12 | i386_defconf=
ig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f4fdfb6ee40e799a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/clang-12/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f4fdfb6ee40e799a=
2ea
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_i386-uefi           | i386   | lab-cip       | gcc-8    | i386_defconf=
ig               | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1ac9d90363121f99a3ab

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/i386=
/i386_defconfig/gcc-8/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1ac9d90363121f99a=
3ac
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64              | x86_64 | lab-cip       | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1b8f7a799b865799a2f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1b8f7a799b865799a=
2f6
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614a196b42d9cfec2499a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a196b42d9cfec2499a=
2ea
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1b19bbaba91aaf99a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1b19bbaba91aaf99a=
2e6
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1da38ea37a7f6a99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1da38ea37a7f6a99a=
2db
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1dc00a86a6f77b99a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1dc00a86a6f77b99a=
2de
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64              | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f870e5d5aad3799a30c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f870e5d5aad3799a=
30d
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre  | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2727ad05e4acf199a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2727ad05e4acf199a=
2dc
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip       | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1cbdbb6cfc7da199a30c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1cbdbb6cfc7da199a=
30d
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f05a246241a7a99a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f05a246241a7a99a=
2dc
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614a255ba4db20bb2599a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a255ba4db20bb2599a=
2dd
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a26fea2febc898899a2e1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a26fea2febc898899a=
2e2
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a292eb1b614027099a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a292eb1b614027099a=
2ec
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a29ce3a9a426faa99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a29ce3a9a426faa99a=
2dd
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2afb308fae137a99a31a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2afb308fae137a99a=
31b
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1abdd90363121f99a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1abdd90363121f99a=
2de
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c6246bc3a1c5699a2f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c6246bc3a1c5699a=
2f1
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1ec0162156567599a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1ec0162156567599a=
2e6
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f46dfb6ee40e799a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f46dfb6ee40e799a=
2dc
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2091cd842addb999a334

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2091cd842addb999a=
335
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1ba76afe1ff5ad99a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1ba76afe1ff5ad99a=
2e8
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1df2ad395a91cc99a326

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1df2ad395a91cc99a=
327
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a20aca85ace02ab99a2e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a20aca85ace02ab99a=
2e4
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a220b313d6463ec99a2eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a220b313d6463ec99a=
2ec
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2389a05e08d66f99a333

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2389a05e08d66f99a=
334
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2725b04011079299a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2725b04011079299a=
2dc
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1cb7bb6cfc7da199a2ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1cb7bb6cfc7da199a=
300
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | clang-12 | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1eaab75e20993a99a2e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/clang-12/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1eaab75e20993a99a=
2e1
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614a256e3fbd5e8a0199a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a256e3fbd5e8a0199a=
2de
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a26fdc4873e8da299a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a26fdc4873e8da299a=
2dc
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a29067f2e3a9cd099a303

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-baylibre/baseline-qemu_x86_64-uefi-mix=
ed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a29067f2e3a9cd099a=
304
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a29a8bb40dc601299a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-baylibre/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a29a8bb40dc601299a=
2dc
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre  | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2b0f5df563596b99a302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2b0f5df563596b99a=
303
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1ad20663aad6da99a2f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1ad20663aad6da99a=
2f6
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c3b75c22b1ba499a31b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c3b75c22b1ba499a=
31c
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1e89cca62bbd5c99a2e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1e89cca62bbd5c99a=
2e3
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f31f7a5e5877699a33d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-m=
ixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f31f7a5e5877699a=
33e
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip       | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614a20dfd030253ef599a317

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a20dfd030253ef599a=
318
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c4858b957082e99a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+ima/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c4858b957082e99a=
2ea
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1daa8ea37a7f6a99a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1daa8ea37a7f6a99a=
2e5
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
nfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/614a20985e393ee15399a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+crypto/gcc-8/lab-collabora/baseline-qemu_x86_64-uefi-mi=
xed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a20985e393ee15399a=
2e5
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/614a2135d63e89936b99a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-8/lab-collabora/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a2135d63e89936b99a=
2f8
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora | gcc-8    | x86_64_defco=
n...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/614a239db789fdbcd199a2e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a239db789fdbcd199a=
2ea
        failing since 1 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq        | arm    | lab-collabora | clang-12 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a4e4c40d1f49cbe99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/clang-12/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a4e4c40d1f49cbe99a=
2e9
        failing since 34 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq        | arm    | lab-collabora | gcc-8    | multi_v7_def=
c...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a3e53bdfb02792299a302

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-8/lab-collabora/b=
aseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a3e53bdfb02792299a=
303
        failing since 34 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq        | arm    | lab-collabora | gcc-8    | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614a43279ad21bb1ff99a33e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a43279ad21bb1ff99a=
33f
        failing since 34 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3288-veyron-jaq        | arm    | lab-collabora | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614a45e98dbf95844d99a350

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-rk3288-veyro=
n-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a45e98dbf95844d99a=
351
        failing since 34 days (last pass: next-20210813, first fail: next-2=
0210818) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1acdd90363121f99a3b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1acdd90363121f99a=
3b9
        failing since 98 days (last pass: next-20210611, first fail: next-2=
0210615) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1c2275c22b1ba499a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1c2275c22b1ba499a=
2dc
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1d8a090c44f1d399a2fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1d8a090c44f1d399a=
2ff
        failing since 0 day (last pass: next-20210914, first fail: next-202=
10920) =

 =



platform                 | arch   | lab           | compiler | defconfig   =
                 | regressions
-------------------------+--------+---------------+----------+-------------=
-----------------+------------
rk3328-rock64            | arm64  | lab-baylibre  | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/614a1f2d17a4a378a999a2de

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210921/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614a1f2d17a4a378a999a=
2df
        failing since 0 day (last pass: next-20210915, first fail: next-202=
10920) =

 =20
