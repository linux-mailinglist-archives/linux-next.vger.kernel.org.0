Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CEA426B11
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 14:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241963AbhJHMnS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 08:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241582AbhJHMnO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 08:43:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33BDBC061760
        for <linux-next@vger.kernel.org>; Fri,  8 Oct 2021 05:41:16 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id u7so8107707pfg.13
        for <linux-next@vger.kernel.org>; Fri, 08 Oct 2021 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=3GbbrhkqNX11M2djFC+97YVL92ueTl0V/JdIWexotXg=;
        b=6G/GHOG4DPEoDQYXjYZ6igAicSRcMIVacPRrXe7pAF/WEikrZANcX0tkVDUfKRNua9
         VmTvJpMQipWg+eXMwIKlvrjuqEMA4wY3JWt7VQX/nzxmxRQGANz0qM48D2tM6Eot4LII
         obCQRTRinWFgFC2SDbnf23DxlanjerJWNgN/ET/c9eri+vnzJQ9nvslBv6Tu92CaJify
         ZO63qDYT7i13lVGxy7BjD2w+dvGIBTn/I2LKHJVGoI+KAbFJRFZERaFPvA3Cq3SBaYdK
         F1P4MrvcuKjbVkv4rNpS9bZVtzXgt6QrW3CB7VqWuoyHrBvzZNM3j5xtgxSNkgPc8HTI
         DrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=3GbbrhkqNX11M2djFC+97YVL92ueTl0V/JdIWexotXg=;
        b=R2GtLzL0kZEYyj5hWGUnVtrkChReir9PptmPaX3chfzFEEL5WIxLS12YDwVBd0vfkC
         pFs4MDxEwp2zLfg9eKSgEHyPSfFqw/S1zIMdJt/kafIjsxGd88muqVjqCCSkKZ0c7ve+
         by7weZizDC/3qrthcaGWq3H6hObPjDdtsKBoqqjI1KdZ4H50CyJE/TMzTX2c3BFVFkX4
         649EIn+YYn5Vcm1Fl/7HpTRQQ4D55Gw7Nz9OQl2ispJL0gsl5wYSEPnsndOK+c01PX6U
         aawxL7BKkOep0mfXrpr2t8ht/N6Dsyq/jSAeOzd2SIwQlsES9Z4w82JCVs4L19dRzk7d
         09sg==
X-Gm-Message-State: AOAM531M0jF5xjnsJWYTKEnBA+ii9647wx4x5rPHxyL8TFRQmc6Y5GtB
        NqxwlAGEs61pLMqSzlQMH7SSdNy0Beve3UdK
X-Google-Smtp-Source: ABdhPJybIvF/ACQlfLt5j5dQNQ76lvudowshRPNo3QkhYNOy+u+c/gJ/hyFfJEpQVXhvP4PU+quovQ==
X-Received: by 2002:a62:1ac3:0:b0:44b:85d0:5a98 with SMTP id a186-20020a621ac3000000b0044b85d05a98mr9911809pfa.18.1633696875308;
        Fri, 08 Oct 2021 05:41:15 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b10sm2638118pfi.122.2021.10.08.05.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 05:41:14 -0700 (PDT)
Message-ID: <61603c6a.1c69fb81.ad8b5.77e2@mx.google.com>
Date:   Fri, 08 Oct 2021 05:41:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211008
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master baseline: 516 runs, 25 regressions (next-20211008)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 516 runs, 25 regressions (next-20211008)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =

qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =

qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =

rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+ima                | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211008/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211008
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      683f29b781aeaab6bf302eeb2ef08a5e5f9d8a27 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffb849bc50bf6ee99a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-am57xx-bea=
gle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-linaro-lkft/baseline-am57xx-bea=
gle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffb849bc50bf6ee99a=
2e8
        new failure (last pass: next-20211007) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffdeaaf1dde696799a2e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffdeaaf1dde696799a=
2e6
        failing since 225 days (last pass: next-20210223, first fail: next-=
20210224) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | clang-12 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616000d252305c0a7e99a2f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig/clang-12/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616000d252305c0a7e99a=
2f3
        failing since 0 day (last pass: next-20211006, first fail: next-202=
11007) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffc7105d880892c99a338

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffc7105d880892c99a=
339
        failing since 3 days (last pass: next-20210930, first fail: next-20=
211001) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-8    | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffdc5c6bae344d399a343

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffdc5c6bae344d399a=
344
        new failure (last pass: next-20211006) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffd3f17c6539eda99a31b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffd3f17c6539eda99a=
31c
        failing since 322 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/616004d005558fac2899a348

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-fsl-ls1088a-rd=
b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616004d005558fac2899a=
349
        failing since 322 days (last pass: next-20201119, first fail: next-=
20201120) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hifive-unleashed-a00         | riscv | lab-baylibre    | gcc-8    | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffb881476bdfd8299a30f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/risc=
v/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/riscv/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffb881476bdfd8299a=
310
        failing since 161 days (last pass: next-20210429, first fail: next-=
20210430) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61600cb1ff707bbdbf99a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-collabora/baseline-hip07-d=
05.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61600cb1ff707bbdbf99a=
2f4
        failing since 99 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
hip07-d05                    | arm64 | lab-collabora   | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/616013c9ddf194ceea99a2fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-collabora/baseline-hip07-d0=
5.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616013c9ddf194ceea99a=
2ff
        failing since 99 days (last pass: next-20210628, first fail: next-2=
0210629) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-sabresd                | arm   | lab-nxp         | gcc-8    | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffd525ee7ad3d1499a2e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
imx_v6_v7_defconfig/gcc-8/lab-nxp/baseline-imx6q-sabresd.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffd525ee7ad3d1499a=
2e5
        failing since 347 days (last pass: next-20201023, first fail: next-=
20201026) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | clang-12 | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffde92490359c8899a33b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-12 (Debian clang version 12.0.1-++20210918042532+fed41=
342a82f-1~exp1~20210918143238.139)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig/clang-12/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffde92490359c8899a=
33c
        new failure (last pass: next-20211007) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/616004ca9da576047999a306

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616004ca9da576047999a=
307
        new failure (last pass: next-20211007) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mp-evk                   | arm64 | lab-nxp         | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/616008787fc7d4fbea99a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+crypto/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616008787fc7d4fbea99a=
2db
        failing since 2 days (last pass: next-20210930, first fail: next-20=
211005) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-8    | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffcdcedc9e2350a99a306

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-=
series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffcdcedc9e2350a99a=
307
        failing since 0 day (last pass: next-20211006, first fail: next-202=
11007) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-baylibre    | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615ff911b7b3bc15f199a2ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ff911b7b3bc15f199a=
2ed
        failing since 324 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-cip         | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615ff949d18ec92ae899a2f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ff949d18ec92ae899a=
2f8
        failing since 324 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-versatilepb         | arm   | lab-linaro-lkft | gcc-8    | versati=
le_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/615ff8cf244cd7906a99a2dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ff8cf244cd7906a99a=
2dd
        failing since 324 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffbc4d10b3cc16899a2ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-baylibre/baseline-rk3328-r=
ock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffbc4d10b3cc16899a=
2f0
        failing since 114 days (last pass: next-20210611, first fail: next-=
20210615) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6160031de92d1bd02199a2f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-rk3328-ro=
ck64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6160031de92d1bd02199a=
2f4
        failing since 17 days (last pass: next-20210915, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61600472e4dcbe292299a2e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+ima/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61600472e4dcbe292299a=
2e8
        failing since 17 days (last pass: next-20210915, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3328-rock64                | arm64 | lab-baylibre    | gcc-8    | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/616005c60a9c1dbbc999a3c9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+crypto/gcc-8/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616005c60a9c1dbbc999a=
3ca
        failing since 17 days (last pass: next-20210914, first fail: next-2=
0210920) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/615ffc9c1dbad3f5e699a314

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64=
-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/615ffc9c1dbad3f5e699a=
315
        failing since 239 days (last pass: next-20210209, first fail: next-=
20210210) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61600481cca020998a99a2ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/baseline-sun50i-a64-=
bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61600481cca020998a99a=
300
        failing since 2 days (last pass: next-20211001, first fail: next-20=
211005) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe      | gcc-8    | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/616005e8406f9115c199a2da

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211008/arm6=
4/defconfig+ima/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616005e8406f9115c199a=
2db
        failing since 0 day (last pass: next-20211005, first fail: next-202=
11007) =

 =20
