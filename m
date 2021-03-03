Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B3B32BB79
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347994AbhCCM3o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843062AbhCCKZK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 05:25:10 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9763C0617AA
        for <linux-next@vger.kernel.org>; Wed,  3 Mar 2021 00:26:18 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 18so892864pfo.6
        for <linux-next@vger.kernel.org>; Wed, 03 Mar 2021 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HrIbTG64vI7vIP+zP79yO59o8h9WGT+HBLT6Z3z04d4=;
        b=c/x+FSzyDnUBK8mRSGnHWw5wW6RGrVgdc/ITnbQ1lDTKPaaiwaSlbkPILEP/jDBeQX
         UtKCPSqECh1w0Vafg+00uksPxVjf9Apg53BNhgj1QxQEZL+oArJ+TYKw+g45RwdxX9ER
         nfeFREg93ABXv3B5f6NN5suFm1GRcJ0/ycUK8q57/n9WIKLedDH0c0Yykrd+muA9DJ+C
         D8jVEsUZkv2dfHgZGfrnDuw+iNEsmNoNOxerh8cskXXzVrhhXgzO2hN3mhOGF9YiCTSW
         m4ss5ipxlly9ENYOHOoIAFy4GvbExOG3/JMUNpPDINVM9PUl1kNocMH2wolgpAobMDQd
         z4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HrIbTG64vI7vIP+zP79yO59o8h9WGT+HBLT6Z3z04d4=;
        b=Zn2AlA/Ujj91OornoVG+dFRRkWjr4NJbbIX5gOg/3ZFLgSS2qHXqaHYFXqSnajOWqd
         jdMn0oxWHtpA9Ibnueg3B1+vjo1r/0rmVi9u5AN1w9Un04vzDJtBrya/HajxzT+E2kJX
         Uiqlh8qaZJ9kkXZlR2lpsZy7RNd2f7au0QydklX0atGfB4n1zmkUPsCOsN97YEyIg/33
         QYZ1bN+VLvUyAKP23pmkQsCb58zvn1XkALNoZDKelk0bj8W92rTWLyb+kn0FcEdS4AeU
         vjiI1pLj2+SsQK0p+sDpvIRpEMC4pm74duI7/poSboUHzit6vpf0tTVc+l2Hu0VAlIDL
         SXjw==
X-Gm-Message-State: AOAM531iAi2fbPG+AsxhwN/M9KjxA98hb+oWChCioBfGnVyS3MVqOQ9c
        6bwq/t3pzcux6uZGADmvrUbHyEvdILsSpQ==
X-Google-Smtp-Source: ABdhPJzDE21/bdpqYZIhiXo34Xxg/HaUD5L9XsajL+UAklUOXdRcUPz2xAPijuftjXdWiqkvsBOVoA==
X-Received: by 2002:a63:1f05:: with SMTP id f5mr334478pgf.84.1614759977831;
        Wed, 03 Mar 2021 00:26:17 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l22sm1498204pfd.145.2021.03.03.00.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:26:17 -0800 (PST)
Message-ID: <603f4829.1c69fb81.8a46c.2be3@mx.google.com>
Date:   Wed, 03 Mar 2021 00:26:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210303
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 554 runs, 19 regressions (next-20210303)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 554 runs, 19 regressions (next-20210303)

Regressions Summary
-------------------

platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-8    | defconfig =
                   | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | clang-10 | defconfig =
                   | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | clang-11 | defconfig =
                   | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig =
                   | 1          =

meson-gxl-s905d-p230       | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

qemu_arm-versatilepb       | arm    | lab-baylibre  | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-cip       | gcc-8    | versatile_=
defconfig          | 1          =

qemu_arm-versatilepb       | arm    | lab-collabora | gcc-8    | versatile_=
defconfig          | 1          =

qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-8    | x86_64_def=
con...6-chromebook | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | clang-10 | defconfig =
                   | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | clang-11 | defconfig =
                   | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

rk3399-gru-kevin           | arm64  | lab-collabora | gcc-8    | defconfig =
                   | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =

sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210303/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210303
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      f6b975aabf15ef5bcbab7cfdc278665eb2756f10 =



Test Regressions
---------------- =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
hifive-unleashed-a00       | riscv  | lab-baylibre  | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0b15577a11c279addce0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0b15577a11c279add=
ce1
        failing since 57 days (last pass: next-20201223, first fail: next-2=
0210104) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0cc70874a7e9a7addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0cc70874a7e9a7add=
cb6
        failing since 8 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | clang-10 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603f1056eae085c44faddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-10/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f1056eae085c44fadd=
cb2
        new failure (last pass: next-20210302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | clang-11 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0d95c1fe6262cbaddcf8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-11/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0d95c1fe6262cbadd=
cf9
        failing since 0 day (last pass: next-20210301, first fail: next-202=
10302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0faad1cb096a74addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-nxp/baseline-imx8mp-evk=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0faad1cb096a74add=
cbc
        failing since 0 day (last pass: next-20210301, first fail: next-202=
10302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
imx8mp-evk                 | arm64  | lab-nxp       | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0eeb4f39bf190daddcb2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0eeb4f39bf190dadd=
cb3
        failing since 8 days (last pass: next-20210219, first fail: next-20=
210222) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
meson-gxl-s905d-p230       | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f1360508de39ea7addd10

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905d-p230.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-meson=
-gxl-s905d-p230.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f1360508de39ea7add=
d11
        new failure (last pass: next-20210301) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb       | arm    | lab-baylibre  | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0af4577a11c279addcb5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0af4577a11c279add=
cb6
        failing since 105 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb       | arm    | lab-cip       | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0adc95f0fad718addcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0adc95f0fad718add=
cb2
        failing since 105 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_arm-versatilepb       | arm    | lab-collabora | gcc-8    | versatile_=
defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0a8a9d9b6bd9cbaddcc4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0a8a9d9b6bd9cbadd=
cc5
        failing since 105 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed     | x86_64 | lab-baylibre  | gcc-8    | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0b313a74a6cbb6addcc8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-8/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0b313a74a6cbb6add=
cc9
        new failure (last pass: next-20210205) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0ca519a0675502addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0ca519a0675502add=
cbc
        new failure (last pass: next-20210302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | clang-10 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603f11bd88f32c597daddcb1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-10/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f11bd88f32c597dadd=
cb2
        new failure (last pass: next-20210302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | clang-11 | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0d6439831b41e0addcbb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/clang-11/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0d6439831b41e0add=
cbc
        new failure (last pass: next-20210302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f10f909402e87bdaddcba

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-collabora/baseline-rk33=
99-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f10f909402e87bdadd=
cbb
        new failure (last pass: next-20210302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
rk3399-gru-kevin           | arm64  | lab-collabora | gcc-8    | defconfig =
                   | 1          =


  Details:     https://kernelci.org/test/plan/id/603f101cc853be379daddd06

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f101cc853be379dadd=
d07
        new failure (last pass: next-20210302) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | clang-10 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0ce7f582021325addcc3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-10 (Debian clang version 10.0.1-++20200708124224+ef32c=
611aa2-1~exp1~20200707224822.188 )
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-10/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0ce7f582021325add=
cc4
        failing since 20 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-a64-bananapi-m64    | arm64  | lab-clabbe    | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f0fb9d1cb096a74addccf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-clabbe/baseline-sun50i-=
a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f0fb9d1cb096a74add=
cd0
        failing since 20 days (last pass: next-20210209, first fail: next-2=
0210210) =

 =



platform                   | arch   | lab           | compiler | defconfig =
                   | regressions
---------------------------+--------+---------------+----------+-----------=
-------------------+------------
sun50i-h6-pine-h64-model-b | arm64  | lab-baylibre  | clang-11 | defconfig+=
CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/603f12129ea4be17dfaddcce

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-11 (Debian clang version 11.1.0-++20210204120158+1fdec=
59bffc1-1~exp1~20210203230823.159)
  Plain log:   https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210303/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-11/lab-baylibre/baseline-sun50=
i-h6-pine-h64-model-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/603f12129ea4be17dfadd=
ccf
        failing since 111 days (last pass: next-20201110, first fail: next-=
20201111) =

 =20
