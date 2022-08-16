Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEDE959586A
	for <lists+linux-next@lfdr.de>; Tue, 16 Aug 2022 12:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbiHPKeL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Aug 2022 06:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbiHPKdl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Aug 2022 06:33:41 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 661B386719
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 01:29:27 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id c2so206882plo.3
        for <linux-next@vger.kernel.org>; Tue, 16 Aug 2022 01:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=gRViZM6Lv9nyzPgqqn5bn6I3smBI/Smo2Q275qrBKMc=;
        b=tWccmvouttUKIG0Y5Kgsve+j7YxUI0VAuIrSNoLsspdWUkX5wqxLFH+ckFFMVnFovT
         m0iVsFFNlNWdoqMSYiosJCoHVgmt16NnEMbPB374rQLWgDOht42tcrLGTJNt8EUvLtPY
         tvqlnkBB4jcIiaUf4jT4RIFTGNE88LOJrxf0oWYQlFHBzPLyhigwFsEEDSk0JrI0BOo7
         JtntndTzPag+fscCAUFzytA1bibj34jO86xkDhPlU+5jCYD/4FhFDHSV5azadoRDACIv
         /+Lt8d0vmJ0Ps9UmaWF7zF1rDnAa7112E9fDC/0r1TsxeF3n/2CCTRM8tgZLciVYA8Hs
         hk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=gRViZM6Lv9nyzPgqqn5bn6I3smBI/Smo2Q275qrBKMc=;
        b=Y2YbWbi767pkKI/PxZHK4clPgfmD+stQux20RnIA96jmutr1p82NP/jB0XeqolFgCB
         N6CuNqsBxMZOvhGIrSK+9Y19Sb6WF3Ji92XHC0ufIYZR121GrElNhljhaHa/Wg9I1Mml
         sEtLhL/k50A0EZeKGKsezDRP4Y/yOzSPUCEsoXw7ZFqYfmFuuAzENIqq2/k6xfnQHBLH
         gwcUHeI76CmUyGoJEOEpRvfeQJ2oPf0dhNbaRgKRddk+HRJg9x7RiLWzm1KZHVf4T5md
         oWBh0qg6K3yLDZjUDHiIRFH81ugmwMjoYIkXKSQdtcMhWR9NPmFWBZAGyvPBhY0eCQfM
         poGw==
X-Gm-Message-State: ACgBeo1cpPM11As/8I4RI9DCn/F+t3EpOBwCp9d+XxfvHosVlhQo3Ch2
        HdYX0qWZdg13jyFjIPWWpQCI6CRop2AJbPFs
X-Google-Smtp-Source: AA6agR7EIRlaJt5yhB0SKetZi5c1bjByAtX5A7Gyr838j98irnmA9ma2OdCLBW4MxqDKNZ8+RVxwtA==
X-Received: by 2002:a17:902:e30c:b0:170:d51c:a60e with SMTP id q12-20020a170902e30c00b00170d51ca60emr20875993plc.160.1660638565812;
        Tue, 16 Aug 2022 01:29:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e2-20020a17090ab38200b001f02a72f29csm5738797pjr.8.2022.08.16.01.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 01:29:25 -0700 (PDT)
Message-ID: <62fb5565.170a0220.d1d63.90d4@mx.google.com>
Date:   Tue, 16 Aug 2022 01:29:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220816
Subject: next/master baseline: 488 runs, 27 regressions (next-20220816)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 488 runs, 27 regressions (next-20220816)

Regressions Summary
-------------------

platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15     | arm    | lab-linaro-lkft | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15     | arm    | lab-linaro-lkft | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

bcm2711-rpi-4-b       | arm64  | lab-linaro-lkft | clang-16 | defconfig    =
                | 1          =

beaglebone-black      | arm    | lab-broonie     | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm    | lab-broonie     | gcc-10   | multi_v7_defc=
onfig           | 1          =

beaglebone-black      | arm    | lab-broonie     | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

beaglebone-black      | arm    | lab-cip         | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

beaglebone-black      | arm    | lab-cip         | gcc-10   | multi_v7_defc=
onfig           | 1          =

beaglebone-black      | arm    | lab-cip         | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

hifive-unleashed-a00  | riscv  | lab-baylibre    | gcc-10   | defconfig    =
                | 1          =

hp-11A-G6-EE-grunt    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon=
...6-chromebook | 1          =

imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | imx_v6_v7_def=
config          | 1          =

imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig           | 1          =

imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

imx7d-sdb             | arm    | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =

kontron-pitx-imx8m    | arm64  | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =

panda                 | arm    | lab-baylibre    | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =

panda                 | arm    | lab-baylibre    | gcc-10   | multi_v7_defc=
onfig           | 1          =

panda                 | arm    | lab-baylibre    | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =

qemu_arm-vexpress-a15 | arm    | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a15 | arm    | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a15 | arm    | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a9  | arm    | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a9  | arm    | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =

qemu_arm-vexpress-a9  | arm    | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220816/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220816
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      e1084bacab44f570691c0fdaa1259acf93ed0098 =



Test Regressions
---------------- =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15     | arm    | lab-linaro-lkft | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb41f47dce0f2418355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb41f47dce0f2418355=
643
        failing since 60 days (last pass: next-20220601, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
am57xx-beagle-x15     | arm    | lab-linaro-lkft | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb42227dce0f2418355646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-linaro-lkft/baseline=
-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb42227dce0f2418355=
647
        failing since 60 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
bcm2711-rpi-4-b       | arm64  | lab-linaro-lkft | clang-16 | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb34a903e4428386355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0-++20220815071801+8719f=
aafdb3f-1~exp1~20220815071906.353)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm6=
4/defconfig/clang-16/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm6=
4/defconfig/clang-16/lab-linaro-lkft/baseline-bcm2711-rpi-4-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb34a903e4428386355=
643
        new failure (last pass: next-20220810) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beaglebone-black      | arm    | lab-broonie     | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb47e14fa834a70435565a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-beaglebone-bl=
ack.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb47e14fa834a704355=
65b
        failing since 60 days (last pass: next-20220602, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beaglebone-black      | arm    | lab-broonie     | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb4935c915b1a86e355644

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb4935c915b1a86e355=
645
        failing since 60 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beaglebone-black      | arm    | lab-broonie     | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb4a8b1db6b7c349355651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb4a8b1db6b7c349355=
652
        failing since 60 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beaglebone-black      | arm    | lab-cip         | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1f69bf162a7abe355657

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-beaglebone-black.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1f69bf162a7abe355=
658
        failing since 60 days (last pass: next-20220602, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beaglebone-black      | arm    | lab-cip         | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb21fd140dddf2b3355662

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb21fd140dddf2b3355=
663
        failing since 60 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
beaglebone-black      | arm    | lab-cip         | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb27d9b13b5ae23d355643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb27d9b13b5ae23d355=
644
        failing since 60 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hifive-unleashed-a00  | riscv  | lab-baylibre    | gcc-10   | defconfig    =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1d62770388e45635566f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/risc=
v/defconfig/gcc-10/lab-baylibre/baseline-hifive-unleashed-a00.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1d62770388e456355=
670
        failing since 292 days (last pass: next-20211026, first fail: next-=
20211027) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
hp-11A-G6-EE-grunt    | x86_64 | lab-collabora   | gcc-10   | x86_64_defcon=
...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1eed3c2b691ad935564e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-hp-11A-G6-=
EE-grunt.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1eed3c2b691ad9355=
64f
        new failure (last pass: next-20220812) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb38d853ecd965fe355643

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
imx_v6_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb38d853ecd965fe355=
644
        failing since 98 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb3c332d7c7eefee35565f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-pengutronix/baseline-imx6ul-pi=
co-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb3c332d7c7eefee355=
660
        failing since 98 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb3cbf62d7b98d9e35565a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-pengutronix/baseline-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb3cbf62d7b98d9e355=
65b
        failing since 98 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: next-20220509) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx6ul-pico-hobbit    | arm    | lab-pengutronix | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb3eb39168ffc287355658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb3eb39168ffc287355=
659
        failing since 98 days (last pass: next-20211207, first fail: next-2=
0220509) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
imx7d-sdb             | arm    | lab-nxp         | gcc-10   | imx_v6_v7_def=
config          | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1e9a6e9b6d475e35569b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1e9a6e9b6d475e355=
69c
        failing since 28 days (last pass: next-20220707, first fail: next-2=
0220718) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
kontron-pitx-imx8m    | arm64  | lab-kontron     | gcc-10   | defconfig+cry=
pto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62fb1d37e7f2c5bf87355678

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm6=
4/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62fb1d37e7f2c5bf87355686
        failing since 60 days (last pass: next-20220610, first fail: next-2=
0220616)

    2022-08-16T04:29:21.085707  /lava-155129/1/../bin/lava-test-case
    2022-08-16T04:29:21.086052  <8>[   19.364825] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-16T04:29:21.086248  /lava-155129/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
b1d37e7f2c5bf87355688
        failing since 60 days (last pass: next-20220610, first fail: next-2=
0220616)

    2022-08-16T04:29:22.123493  /lava-155129/1/../bin/lava-test-case
    2022-08-16T04:29:22.123799  <8>[   20.409025] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-16T04:29:22.123956  /lava-155129/1/../bin/lava-test-case
    2022-08-16T04:29:22.124101  <8>[   20.429018] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-16T04:29:22.124245  /lava-155129/1/../bin/lava-test-case
    2022-08-16T04:29:22.124385  <8>[   20.449399] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-16T04:29:22.124526  /lava-155129/1/../bin/lava-test-case   =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
panda                 | arm    | lab-baylibre    | gcc-10   | multi_v7_defc=
...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1f4ad7686e68a7355650

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1f4ad7686e68a7355=
651
        failing since 55 days (last pass: next-20220602, first fail: next-2=
0220621) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
panda                 | arm    | lab-baylibre    | gcc-10   | multi_v7_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb217a24e66b786f35569c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb217a24e66b786f355=
69d
        failing since 55 days (last pass: next-20220602, first fail: next-2=
0220621) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
panda                 | arm    | lab-baylibre    | gcc-10   | multi_v7_defc=
...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb231e224bdeab10355653

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb231e224bdeab10355=
654
        failing since 59 days (last pass: next-20220602, first fail: next-2=
0220617) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a15 | arm    | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1a4d338ff001ab35564f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1a4d338ff001ab355=
650
        failing since 12 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a15 | arm    | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1a5da78f39ceb9355648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1a5da78f39ceb9355=
649
        failing since 12 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a15 | arm    | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1bc6f6d0a490f2355687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1bc6f6d0a490f2355=
688
        failing since 12 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a9  | arm    | lab-baylibre    | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1a4e338ff001ab355654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1a4e338ff001ab355=
655
        failing since 12 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a9  | arm    | lab-broonie     | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1a5e338ff001ab35565e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1a5e338ff001ab355=
65f
        failing since 12 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =



platform              | arch   | lab             | compiler | defconfig    =
                | regressions
----------------------+--------+-----------------+----------+--------------=
----------------+------------
qemu_arm-vexpress-a9  | arm    | lab-collabora   | gcc-10   | vexpress_defc=
onfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62fb1b9baa75abd6d535566d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220816/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fb1b9baa75abd6d5355=
66e
        failing since 12 days (last pass: next-20220726, first fail: next-2=
0220802) =

 =20
