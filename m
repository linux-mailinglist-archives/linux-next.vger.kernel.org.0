Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C5C6058F9
	for <lists+linux-next@lfdr.de>; Thu, 20 Oct 2022 09:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiJTHtU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Oct 2022 03:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiJTHtL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Oct 2022 03:49:11 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563761799BA
        for <linux-next@vger.kernel.org>; Thu, 20 Oct 2022 00:49:09 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id f140so19563345pfa.1
        for <linux-next@vger.kernel.org>; Thu, 20 Oct 2022 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZn9dCAUJOrIaMlZgKxKQGPquonnNAQLxRb+jGNSbQM=;
        b=FkNQT0H5dhUNRLGxOb66m3/ttphIx0X72fsV6p1KMKs9Y/fZ8Uy6zrkQI2qg+MAQkS
         ao8C/Z2f3nsemW5ewo4p2P+2tG82ATLlGsfa9uOXeGd/3RVKPObmEwr0etl+udKLIBeI
         gAY95S0ZiFceIksUpwxPLnt7DbSZdTcqliIl49vg/YQ2NX7PuxVJAz5kKf06OV8QIjNK
         HCNGr+zXOjJjVewWGDN72xxwOFPrOQPVDZyZyz50/nZrsJMjMB+qgt0I1yR9bY/z1xcZ
         sV8fTo5k9ve13Dy1z5mWm25xseEtqxjPn8VX0hiHd2exRsDRqOd0bH27QCeDwUNOzRw7
         yoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZn9dCAUJOrIaMlZgKxKQGPquonnNAQLxRb+jGNSbQM=;
        b=f8BPqGiWuAcTszKuXjYZfjMBg0IQOGiyM2ALubLaxjjTdAOpmLUzU8o/Wef1QlZnDW
         hxGgT+rnFelUrj0YyvYq2D5OPMPswgVSwfA4dgAMSMLdTu58rcmRqxd5C41b3uWMOA5Y
         7jdHS1HAy10UXJ0/7IL2MxfYpD1YTkpYXoma784ymQwWljra2Sb/MJ8sKffQkN+Ud9va
         RXuSdXfMItNebyMjvnmtxQMB1Z032cCwKc7VJmr8BK0TmGX6ygJeLQbMhkN/qi+ypuKn
         f58JfwDuVkV2nEg4nelvxk7ocZJ+xOe1z5aQgH/Z9zvYPPovpOi7nf7qSEA55GlkWt3A
         Bcow==
X-Gm-Message-State: ACrzQf3GpLjf0p4pEM0GCfdaeaRCmz0rMK5olX07/C1lxxoqXLVTQuxe
        9FOhivUsuGAp3NkWzB6A0vuVqjZWyoA8fU1P
X-Google-Smtp-Source: AMsMyM4FI0l+1nlz765C+7oisJZm2KX+UKfaGRSLEJj4HNM6Ni31iUpjiH5AzpuGPdFwPWysg/M+qw==
X-Received: by 2002:a65:6a12:0:b0:445:84f6:676a with SMTP id m18-20020a656a12000000b0044584f6676amr10565185pgu.40.1666252148270;
        Thu, 20 Oct 2022 00:49:08 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902714c00b001714e7608fdsm12096144plm.256.2022.10.20.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 00:49:07 -0700 (PDT)
Message-ID: <6350fd73.170a0220.56df0.6f9d@mx.google.com>
Date:   Thu, 20 Oct 2022 00:49:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20221020
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 726 runs, 22 regressions (next-20221020)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 726 runs, 22 regressions (next-20221020)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

jetson-tk1                   | arm   | lab-baylibre    | clang-16 | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 3          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221020/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221020
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      acee3e83b493505058d1e48fce167f623dac1a05 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6350ca00ed0fd5296f5e5b57

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350ca00ed0fd5296f5e5=
b58
        failing since 32 days (last pass: next-20220915, first fail: next-2=
0220916) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | clang-16 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6350dc2c6a486b88c55e5bb6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221005071926+a3a9b=
0743e31-1~exp1~20221005072024.410)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350dc2c6a486b88c55e5=
bb7
        failing since 57 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6350ce5cde6ee1b9c75e5b7f

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6350ce5cde6ee1b=
9c75e5b82
        failing since 7 days (last pass: next-20220923, first fail: next-20=
221012)
        45 lines

    2022-10-20T04:27:47.452554  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0ec4000 allocated at kernel_clone+0x41/0x=
298
    2022-10-20T04:27:47.490661  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-20T04:27:47.491403  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-20T04:27:47.491758  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c217f400 pointer offset 16 size 1024
    2022-10-20T04:27:47.491983  kern  :alert : Register r5 information: 7-p=
age vmalloc region starting at 0xbf84e000 allocated at load_module+0x69f/0x=
15a4
    2022-10-20T04:27:47.492198  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c2d0f400 pointer offset 0
    2022-10-20T04:27:47.533671  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c2f22800 pointer offset 64 size 512
    2022-10-20T04:27:47.534556  kern  :alert : Register r8 information:
    2022-10-20T04:27:47.535479  kern  :alert : Register r9 information: sla=
b kmalloc-512 start c2f22800 pointer offset 64 size 512
    2022-10-20T04:27:47.536047  kern  :alert : Register r10 information: NU=
LL pointer =

    ... (38 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6350ce5cde6ee1b=
9c75e5b83
        failing since 7 days (last pass: next-20220923, first fail: next-20=
221012)
        16 lines

    2022-10-20T04:27:47.447555  kern  :alert : 8<--- cut here ---
    2022-10-20T04:27:47.448636  kern  :alert : Unable to handle kernel NULL=
 pointer dereferen<8>[   16.654315] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dal=
ert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-10-20T04:27:47.449104  ce at virtual address 00000000
    2022-10-20T04:27:47.449568  kern  :alert : [00000000] *pgd=3Df826c835
    2022-10-20T04:27:47.450053  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c2d0f400 pointer offset 0 size 1024   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6350d20a2dc5ff08425e5b44

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6350d20a2dc5ff0=
8425e5b47
        failing since 22 days (last pass: next-20220921, first fail: next-2=
0220927)
        45 lines

    2022-10-20T04:43:33.062834  kern  :alert : [00000000] *pgd=3Df8377835
    2022-10-20T04:43:33.063069  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c4bf3000 pointer offset 0 size 1024
    2022-10-20T04:43:33.063266  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0dc0000 allocated at kernel_clone+0x8c/0x=
310
    2022-10-20T04:43:33.063424  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-20T04:43:33.063615  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-20T04:43:33.104278  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c20b2400 pointer offset 16 size 1024
    2022-10-20T04:43:33.104902  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf0e0000 allocated at load_module+0x994/0x=
1cec
    2022-10-20T04:43:33.105251  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4bf3000 pointer offset 0 size 1024
    2022-10-20T04:43:33.105530  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c2a4b400 pointer offset 64 size 512
    2022-10-20T04:43:33.107502  kern  :alert : Register r8 information: sla=
b task_struct start c2982580 pointer offset 0 =

    ... (40 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6350d20a2dc5ff0=
8425e5b48
        failing since 22 days (last pass: next-20220921, first fail: next-2=
0220927)
        16 lines

    2022-10-20T04:43:33.061249  kern  :alert : Unable to handle kerne<8>[  =
 18.381340] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D16>
    2022-10-20T04:43:33.061624  l NULL pointer dereference at virtual addre=
ss 00000000   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6350d26c37cc3ddb035e5b3e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350d26c37cc3ddb035e5=
b3f
        failing since 191 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/6350d43847694c63115e5b94

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6350d43847694c6=
3115e5b97
        failing since 22 days (last pass: next-20220923, first fail: next-2=
0220927)
        45 lines

    2022-10-20T04:52:53.759990  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-20T04:52:53.760953  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-20T04:52:53.761406  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c217f400 pointer offset 16 size 1024
    2022-10-20T04:52:53.761737  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf13f000 allocated at load_module+0x99c/0x=
1e04
    2022-10-20T04:52:53.762148  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c281e000 pointer offset 0 size 1024
    2022-10-20T04:52:53.802905  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c4bd0e00 pointer offset 64 size 512
    2022-10-20T04:52:53.803867  kern  :alert : Register r8 information: sla=
b task_struct start c2156e80 pointer offset 0
    2022-10-20T04:52:53.804361  kern  :alert : Register r9 information: sla=
b kmalloc-512 start c4bd0e00 pointer offset 64 size 512
    2022-10-20T04:52:53.804773  kern  :alert : Register r10 information: NU=
LL pointer
    2022-10-20T04:52:53.805163  kern  :alert : Register r11 information: NU=
LL pointer =

    ... (43 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6350d43847694c6=
3115e5b98
        failing since 22 days (last pass: next-20220923, first fail: next-2=
0220927)
        16 lines

    2022-10-20T04:52:53.717096  kern  :alert : 8<--- cut here ---
    2022-10-20T04:52:53.718188  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual ad<8>[   16.656664] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-10-20T04:52:53.719062  dress 00000000
    2022-10-20T04:52:53.719667  kern  :alert : [00000000] *pgd=3Df83fc835
    2022-10-20T04:52:53.721765  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c281e000 pointer offset 0 size 1024
    2022-10-20T04:52:53.722404  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0ea0000 allocated at kernel_clone+0x8c/0x=
360   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | tegra_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/6350cdd8c5dfb464aa5e5b68

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
tegra_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350cdd8c5dfb464aa5e5=
b69
        new failure (last pass: next-20221019) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6350c90e8a36041ed95e5b70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221005071926+a3a9b=
0743e31-1~exp1~20221005072024.410)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350c90e8a36041ed95e5=
b71
        failing since 14 days (last pass: next-20220923, first fail: next-2=
0221005) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6350cb2b12bd98b2b15e5b74

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350cb2b12bd98b2b15e5=
b75
        failing since 7 days (last pass: next-20221011, first fail: next-20=
221012) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6350d25e96461063ba5e5b93

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylibre/baseline-meson-gx=
bb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6350d25e9646106=
3ba5e5b96
        new failure (last pass: next-20221010)
        2 lines

    2022-10-20T04:44:44.671522  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-10-20T04:44:44.671755  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-10-20T04:44:44.671971  kern  :alert :   EA <8>[   19.302340] <LAVA=
_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREME=
NT=3D2>
    2022-10-20T04:44:44.672184  =3D 0, S1PTW =3D 0
    2022-10-20T04:44:44.672413  kern  <8>[   19.310214] <LAVA_SIGNAL_ENDRUN=
 0_dmesg 2707423_1.5.2.4.1>   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6350d25e9646106=
3ba5e5b97
        new failure (last pass: next-20221010)
        12 lines

    2022-10-20T04:44:44.631319  kern  :alert : Mem abort info:
    2022-10-20T04:44:44.669949  kern  <8>[   19.277871] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-10-20T04:44:44.670290  :alert :   ESR =3D 0x0000000096000005   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6350ca563cf905ad585e5b9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350ca563cf905ad585e5=
b9b
        failing since 97 days (last pass: next-20220705, first fail: next-2=
0220714) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6350cabdf0ef5945f75e5b50

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350cabdf0ef5945f75e5=
b51
        failing since 160 days (last pass: next-20220506, first fail: next-=
20220512) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6350cc1018b1d1ade65e5b51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350cc1018b1d1ade65e5=
b52
        failing since 125 days (last pass: next-20220610, first fail: next-=
20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6350c6edd4aedb383c5e5b4f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350c6edd4aedb383c5e5=
b50
        failing since 57 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/6350c9a0d9c245f71c5e5b6b

  Results:     71 PASS, 21 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/6350c9a0d9c245f71c5e5bb2
        failing since 2 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-20T04:07:37.517434  <8>[   91.710620] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-10-20T04:07:38.536373  /lava-7653282/1/../bin/lava-test-case
    2022-10-20T04:07:38.549181  <8>[   92.743020] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/6350c9a0d9c245f71c5e5bb3
        failing since 2 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-20T04:07:36.490521  <8>[   90.683771] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>
    2022-10-20T04:07:37.505456  /lava-7653282/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/6350c9a0d9c245f71c5e5bb4
        failing since 2 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-20T04:07:36.476886  /lava-7653282/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6350cdf6e9033efd995e5b3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221020/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6350cdf6e9033efd995e5=
b3b
        new failure (last pass: next-20221019) =

 =20
