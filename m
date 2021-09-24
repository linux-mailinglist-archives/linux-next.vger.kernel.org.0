Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F2E41706A
	for <lists+linux-next@lfdr.de>; Fri, 24 Sep 2021 12:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240648AbhIXKlC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Sep 2021 06:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhIXKlB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Sep 2021 06:41:01 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ECBC061574
        for <linux-next@vger.kernel.org>; Fri, 24 Sep 2021 03:39:28 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so4068894pjw.0
        for <linux-next@vger.kernel.org>; Fri, 24 Sep 2021 03:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dsAtSX2/lvUEASdRL/KzMEVy+hcRdInUaxSn6ENazCY=;
        b=2PRYBomcRcUk5BtZE5DWjcXMgSxsROhnRuvZUWOMBgQhItn6/R27DmLz6SMniG3JMP
         k7b4DhIawUTtbnO2kSyLNH396GKKJegf51FK56XRFhKcFUmrrRwM8GUjMjlA1Sz+3Bxq
         Zt1yZlNBzcexQqFUijCKJI4E7NE80fBqDACzTfGPRkcQkquRGoalihyUzdmOBVLQ0CxA
         BQAl04WbHylwXOALg9Zchbku3UttzJdPUbHsMiSUEi4Jg++yN0LsY0ZzradtPlK4eqFc
         12uiGa3S4+yEhDWCO7NvPcn/Twakzzz6AlM7fNDQ1sg1R6hMXzyf6ZVUo0zRoRBuilzT
         tHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dsAtSX2/lvUEASdRL/KzMEVy+hcRdInUaxSn6ENazCY=;
        b=YjcZcqcKrRW4Hn8S+NW5TJcrZ/JjOCe9o4CmveSDdYCF276ZFu50hSqSy6tu2dXCdf
         inZjJ16MTWah+q7zxxfG5lSX4lZgCJShtyTHgx4zdtWPVAYd2gtLcVDYlRnChcGJgF6r
         MfvC9xPTuYmJ8hBvVEvgaOKjgICJlPI71/nX0e5vlA/bJLJaRUenCV15Pc/fzLPGlOYl
         o0fmr3AMhtUrISQKZSAfGfBbxVkPVuozmq5fGRFz0YMQgC1bjgFgQlK5g1ETsksk/8/V
         0qsbBlthUAqYu4G68PP3spnRgnwYRcK6H00ubPCXhR7Ko/fN32vpB2TDpAFy6zIae+gQ
         yZZg==
X-Gm-Message-State: AOAM531EZ4q4m8eTMEzQJZYt6W7IM0cGm7GZWNLrKdznJOwY5GrloU6n
        wUamx4eE/KLuV6SH/DUTHy+xh7Mc+8PvcB6F
X-Google-Smtp-Source: ABdhPJzfvc8xGG6WFgnPNvmFGm8cSk97964tquPt44RMoSgWdgUqGPh3AsbJp4m00DGiuiJL9sPZQQ==
X-Received: by 2002:a17:90a:1a43:: with SMTP id 3mr1443734pjl.242.1632479968039;
        Fri, 24 Sep 2021 03:39:28 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 203sm8278375pfx.119.2021.09.24.03.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 03:39:27 -0700 (PDT)
Message-ID: <614daadf.1c69fb81.f0e6f.971f@mx.google.com>
Date:   Fri, 24 Sep 2021 03:39:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210924
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 521 runs, 31 regressions (next-20210924)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 521 runs, 31 regressions (next-20210924)

Regressions Summary
-------------------

platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

beagle-xm               | arm   | lab-baylibre    | clang-12 | multi_v7_def=
config           | 1          =

beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =

hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre    | clang-12 | defconfig   =
                 | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+cr=
ypto             | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+im=
a                | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =

qemu_arm-vexpress-a15   | arm   | lab-baylibre    | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a15   | arm   | lab-broonie     | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a15   | arm   | lab-cip         | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a15   | arm   | lab-linaro-lkft | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9    | arm   | lab-baylibre    | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9    | arm   | lab-broonie     | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9    | arm   | lab-cip         | gcc-8    | vexpress_def=
config           | 1          =

qemu_arm-vexpress-a9    | arm   | lab-linaro-lkft | gcc-8    | vexpress_def=
config           | 1          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+cr=
ypto             | 1          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+im=
a                | 1          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =

rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+cr=
ypto             | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+im=
a                | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig   =
                 | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210924/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210924
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5a5d008887b47f4d6ad98ff4b841313f892fcdee =



Test Regressions
---------------- =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
bcm2836-rpi-2-b         | arm   | lab-collabora   | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6bb784a1376d6799a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6bb784a1376d6799a=
2de
        failing since 211 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | clang-12 | multi_v7_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6d05e860ce156e99a325

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6d05e860ce156e99a=
326
        failing since 11 days (last pass: next-20210908, first fail: next-2=
0210913) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
beagle-xm               | arm   | lab-baylibre    | gcc-8    | multi_v7_def=
c...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6ae8ff4b4a222d99a2f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6ae8ff4b4a222d99a=
2f1
        failing since 58 days (last pass: next-20210723, first fail: next-2=
0210726) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
hifive-unleashed-a00    | riscv | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6a9291f21a4adf99a2fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6a9291f21a4adf99a=
2ff
        failing since 147 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre    | clang-12 | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6f996cfe66940b99a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/clang-12/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6f996cfe66940b99a=
2f8
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614d68f43ec6c3cc1e99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d68f43ec6c3cc1e99a=
2db
        failing since 3 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6a707f98a7975099a319

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6a707f98a7975099a=
31a
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6c157be19224b999a307

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-d=
dr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6c157be19224b999a=
308
        failing since 2 days (last pass: next-20210915, first fail: next-20=
210921) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6db9aadf6a8ca299a2db

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6db9aadf6a8ca299a=
2dc
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
imx8mn-ddr4-evk         | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614d711650b20fae6599a33c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-imx8mn-dd=
r4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d711650b20fae6599a=
33d
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-baylibre    | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614d66eb40052eaa0699a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d66eb40052eaa0699a=
2f4
        failing since 310 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-broonie     | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614d66eeb0ff02ad9c99a2dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d66eeb0ff02ad9c99a=
2de
        failing since 310 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-cip         | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614d67113c02f61a8099a310

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d67113c02f61a8099a=
311
        failing since 310 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-versatilepb    | arm   | lab-linaro-lkft | gcc-8    | versatile_de=
fconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/614d66977e96ca4f2099a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d66977e96ca4f2099a=
2e8
        failing since 310 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15   | arm   | lab-baylibre    | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d69bd6bd8c2fdf899a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d69bd6bd8c2fdf899a=
2e8
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15   | arm   | lab-broonie     | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6a88b2928fe0ad99a36a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6a88b2928fe0ad99a=
36b
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15   | arm   | lab-cip         | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d69ccf7b47d5e3599a360

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d69ccf7b47d5e3599a=
361
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a15   | arm   | lab-linaro-lkft | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d84c00cfabb45ba99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d84c00cfabb45ba99a=
2dd
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9    | arm   | lab-baylibre    | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d69bb098f2b67d899a30e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d69bb098f2b67d899a=
30f
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9    | arm   | lab-broonie     | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6a73e2ced79bca99a2fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6a73e2ced79bca99a=
2fd
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9    | arm   | lab-cip         | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d69b9098f2b67d899a301

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-cip/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d69b9098f2b67d899a=
302
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
qemu_arm-vexpress-a9    | arm   | lab-linaro-lkft | gcc-8    | vexpress_def=
config           | 1          =


  Details:     https://kernelci.org/test/plan/id/614d84aab0749033e499a2ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm/=
vexpress_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d84aab0749033e499a=
2eb
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614d688af9c4cf860999a36a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d688af9c4cf860999a=
36b
        failing since 3 days (last pass: next-20210914, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6a1aa1e0fe54ef99a2fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6a1aa1e0fe54ef99a=
2ff
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6b6e4fd7a0ce7799a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6b6e4fd7a0ce7799a=
2db
        failing since 100 days (last pass: next-20210611, first fail: next-=
20210615) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6cc24932f24afb99a43d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6cc24932f24afb99a=
43e
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
rk3328-rock64           | arm64 | lab-baylibre    | gcc-8    | defconfig+CO=
N...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6f5bfd011b1f3399a337

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6f5bfd011b1f3399a=
338
        failing since 3 days (last pass: next-20210915, first fail: next-20=
210920) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+cr=
ypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/614d689ca0c491704e99a306

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+crypto/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d689ca0c491704e99a=
307
        failing since 11 days (last pass: next-20210910, first fail: next-2=
0210913) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+im=
a                | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6a2cb05394c8ab99a2e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6a2cb05394c8ab99a=
2e9
        failing since 9 days (last pass: next-20210913, first fail: next-20=
210914) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig+CO=
N..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6b942582294f1699a312

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6b942582294f1699a=
313
        failing since 225 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                | arch  | lab             | compiler | defconfig   =
                 | regressions
------------------------+-------+-----------------+----------+-------------=
-----------------+------------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe      | gcc-8    | defconfig   =
                 | 1          =


  Details:     https://kernelci.org/test/plan/id/614d6cfde860ce156e99a305

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210924/arm6=
4/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/614d6cfde860ce156e99a=
306
        failing since 16 days (last pass: next-20210906, first fail: next-2=
0210907) =

 =20
