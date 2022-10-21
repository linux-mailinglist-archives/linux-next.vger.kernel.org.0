Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAFFC607301
	for <lists+linux-next@lfdr.de>; Fri, 21 Oct 2022 10:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbiJUIyl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Oct 2022 04:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbiJUIyd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Oct 2022 04:54:33 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4852B19C
        for <linux-next@vger.kernel.org>; Fri, 21 Oct 2022 01:54:26 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id h12so1913960pjk.0
        for <linux-next@vger.kernel.org>; Fri, 21 Oct 2022 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zhOsxpfiZTfXJ7MTOa7i0LYxhcHAeaaow3Uk16aZI2U=;
        b=i7Wreti7Qw5hnMzMxzqoxoqPuK2z425r5IWexgTMrBwoADUjLLNYHVQbreIlKf56SX
         OENxRsaKnoSw4PuQyj5/fRX2+QcFq32UH7ZAfxLU1HQS/QoHe5sjkcgWWOcaHxsBgA1s
         VZ1b9250918W+ZxlTmA6EwcXKMJx+s2QPP3EhRffkppnt4FRDbvQcI2pkKDk47ErzIjE
         LEtjqeocl3HkK8geRpvLRmgLTWcvPw5xn8FvqLLMcosHIOEcaIIv75qw0My4qlt4rwBA
         QjwR3uxS5hYQ/ootcO9iRig3qpZ/34jap0z08XygglJHLzzJT2L7px/YZTC1Cf36ikmd
         PIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhOsxpfiZTfXJ7MTOa7i0LYxhcHAeaaow3Uk16aZI2U=;
        b=hL3gpVEy1Tffg0sO3JbETCyegFkPOM7SUqq9FS/HWyrJMNBPj14p1JXyyn5kvowNv4
         pgCCuONc8wPKzrryrjAwHSxyPDOfOQSqgE+zbh5o1oYPOPDjpBlHvpaRLEpGDv0QTSvm
         dxaGK+wMS/EZSNwVYtKS2KHYOmh0LzlU6gbAiEDti3952rRu5RdTAoQBNjMRLBu+sIxF
         BCiud0sJCKinQ3n6LsrVxdkJ2FRsYRNQaDLjk5LulfYoGyyL27JLWb6L3YTZUZbj6KVr
         aH9hqqcYrjpKena/eNUMQ2sCYCteSQOsHd8ErzdknmFHj3pnQ6Q+ErH8gIwT18DEvLOA
         fbVw==
X-Gm-Message-State: ACrzQf34M9xXnptnZjv5jJ7Dd92Dsy/OHOTVw4tB2gARbdO/sZQZ/xPN
        TUzI/SLelk07Sr2DGj9ti9IBc667MC5vwanL
X-Google-Smtp-Source: AMsMyM4u1mAm8rlakY0yiriWFf+yQE2VYLgKoKHIFuKfGl90G6qhgMogdKSk3NVff57nrjTtB38LLA==
X-Received: by 2002:a17:90a:5281:b0:211:d940:e1b9 with SMTP id w1-20020a17090a528100b00211d940e1b9mr9239004pjh.163.1666342465135;
        Fri, 21 Oct 2022 01:54:25 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902a50600b001767f6f04efsm14202310plq.242.2022.10.21.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 01:54:24 -0700 (PDT)
Message-ID: <63525e40.170a0220.44c59.b67b@mx.google.com>
Date:   Fri, 21 Oct 2022 01:54:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20221021
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 747 runs, 29 regressions (next-20221021)
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

next/master baseline: 747 runs, 29 regressions (next-20221021)

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
7_defc...CONFIG_SMP=3Dn | 2          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 3          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 2          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221021/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221021
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4d48f589d294ddc5e01d3b0dc7cecc55324c05ca =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6352473d55cd598d9f5e5b40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6352473d55cd598d9f5e5=
b41
        failing since 34 days (last pass: next-20220915, first fail: next-2=
0220916) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | clang-16 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63523b18c93846f5835e5b56

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221005071926+a3a9b=
0743e31-1~exp1~20221005072024.410)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63523b18c93846f5835e5=
b57
        failing since 58 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/6352355078d1290fc15e5b48

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-jetson-tk1.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6352355078d1290=
fc15e5b4b
        failing since 23 days (last pass: next-20220921, first fail: next-2=
0220927)
        45 lines

    2022-10-21T05:59:19.796080  kern  :alert : [00000000] *pgd=3Df8366835
    2022-10-21T05:59:19.796454  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c4c4e400 pointer offset 0 size 1024
    2022-10-21T05:59:19.796796  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0db8000 allocated at kernel_clone+0x8c/0x=
310
    2022-10-21T05:59:19.797130  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-21T05:59:19.797448  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-21T05:59:19.836431  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c20b2400 pointer offset 16 size 1024
    2022-10-21T05:59:19.837557  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf0cf000 allocated at load_module+0x994/0x=
1cec
    2022-10-21T05:59:19.838009  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4c4e400 pointer offset 0 size 1024
    2022-10-21T05:59:19.838369  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c2ab7600 pointer offset 64 size 512
    2022-10-21T05:59:19.839873  kern  :alert : Register r8 information: sla=
b task_struct start c29e3480 pointer offset 0 =

    ... (40 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6352355078d1290=
fc15e5b4c
        failing since 23 days (last pass: next-20220921, first fail: next-2=
0220927)
        16 lines

    2022-10-21T05:59:19.793417  kern  :alert : Unable to handle kerne<8>[  =
 18.342120] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D16>
    2022-10-21T05:59:19.794144  l NULL pointer dereference at virtual addre=
ss 00000000   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/6352379840dd8b1fcf5e5ba7

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-je=
tson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6352379840dd8b1=
fcf5e5baa
        failing since 8 days (last pass: next-20220923, first fail: next-20=
221012)
        45 lines

    2022-10-21T06:09:10.639416  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0e94000 allocated at kernel_clone+0x41/0x=
298
    2022-10-21T06:09:10.678646  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-21T06:09:10.679075  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-21T06:09:10.679217  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c217f400 pointer offset 16 size 1024
    2022-10-21T06:09:10.679366  kern  :alert : Register r5 information: 7-p=
age vmalloc region starting at 0xbf82c000 allocated at load_module+0x69f/0x=
15a4
    2022-10-21T06:09:10.679508  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c24ab000 pointer offset 0 size 1024
    2022-10-21T06:09:10.721594  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c23a1800 pointer offset 64 size 512
    2022-10-21T06:09:10.722015  kern  :alert : Register r8 information: sla=
b task_struct start c2153b80 pointer offset 0
    2022-10-21T06:09:10.722166  kern  :alert : Register r9 information: sla=
b kmalloc-512 start c23a1800 pointer offset 64 size 512
    2022-10-21T06:09:10.722314  kern  :alert : Register r10 information: NU=
LL pointer =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6352379840dd8b1=
fcf5e5bab
        failing since 8 days (last pass: next-20220923, first fail: next-20=
221012)
        16 lines

    2022-10-21T06:09:10.635486  kern  :alert : 8<--- cut here ---
    2022-10-21T06:09:10.636216  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual ad<8>[   14.433797] <LAVA_SIGNAL_TESTCASE T=
EST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-10-21T06:09:10.636421  dress 00000000
    2022-10-21T06:09:10.636592  kern  :alert : [00000000] *pgd=3Df812f835
    2022-10-21T06:09:10.636793  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c24ab000 pointer offset 0 size 1024   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6352399d4b4443ed295e5b3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6352399d4b4443ed295e5=
b3b
        failing since 192 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 2          =


  Details:     https://kernelci.org/test/plan/id/63523acad66a200c5b5e5b92

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig/gcc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63523acad66a200=
c5b5e5b95
        failing since 23 days (last pass: next-20220923, first fail: next-2=
0220927)
        45 lines

    2022-10-21T06:22:50.248551  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0ebc000 allocated at kernel_clone+0x8c/0x=
360
    2022-10-21T06:22:50.288189  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-21T06:22:50.288751  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-21T06:22:50.288959  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c217f400 pointer offset 16 size 1024
    2022-10-21T06:22:50.289136  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf042000 allocated at load_module+0x99c/0x=
1e04
    2022-10-21T06:22:50.289321  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c2efd400 pointer offset 0 size 1024
    2022-10-21T06:22:50.331289  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c2f5f000 pointer offset 64 size 512
    2022-10-21T06:22:50.331851  kern  :alert : Register r8 information: sla=
b task_struct start c49b7700 pointer offset 0
    2022-10-21T06:22:50.332055  kern  :alert : Register r9 information: sla=
b kmalloc-512 start c2f5f000 pointer offset 64 size 512
    2022-10-21T06:22:50.332227  kern  :alert : Register r10 information: NU=
LL pointer =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63523acad66a200=
c5b5e5b96
        failing since 23 days (last pass: next-20220923, first fail: next-2=
0220927)
        16 lines

    2022-10-21T06:22:50.245337  kern  :alert : 8<--- cut here ---
    2022-10-21T06:22:50.245802  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00<8>[   14.338620] <LAVA_SIGNAL_TE=
STCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-10-21T06:22:50.245962  000000
    2022-10-21T06:22:50.246114  kern  :alert : [00000000] *pgd=3Df8514835
    2022-10-21T06:22:50.246255  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c2efd400 pointer offset 0 size 1024   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63523542ee27c010195e5b3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221005071926+a3a9b=
0743e31-1~exp1~20221005072024.410)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63523542ee27c010195e5=
b3e
        failing since 15 days (last pass: next-20220923, first fail: next-2=
0221005) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63522f902b1d00cb255e5b59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522f902b1d00cb255e5=
b5a
        failing since 8 days (last pass: next-20221011, first fail: next-20=
221012) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+videodec           | 1          =


  Details:     https://kernelci.org/test/plan/id/635235209d5ee4ffce5e5b59

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+videodec/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635235209d5ee4ffce5e5=
b5a
        new failure (last pass: next-20221020) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/635238f5b2235c2b535e5b3a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635238f5b2235c2b535e5=
b3b
        new failure (last pass: next-20221020) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63522d54d0bbff896d5e5b7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522d54d0bbff896d5e5=
b80
        new failure (last pass: next-20221020) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/63522d5afda546cbc25e5b72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522d5afda546cbc25e5=
b73
        failing since 98 days (last pass: next-20220705, first fail: next-2=
0220714) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/6352296fd67f71c09c5e5b43

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-mt8183-kukui-j=
acuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6352296fd67f71c09c5e5=
b44
        failing since 161 days (last pass: next-20220506, first fail: next-=
20220512) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/635232c2548e0bf3675e5b3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-collabora/baseline-mt8183-kukui-jac=
uzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/635232c2548e0bf3675e5=
b3c
        failing since 126 days (last pass: next-20220610, first fail: next-=
20220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63522c32920e5f71435e5b3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522c32920e5f71435e5=
b3e
        failing since 58 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63522e78df6d2365f55e5b75

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522e78df6d2365f55e5=
b76
        new failure (last pass: next-20221020) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora   | clang-13 | cros://=
chrome...4-chromebook | 3          =


  Details:     https://kernelci.org/test/plan/id/63522c80dd8928ece75e5b53

  Results:     71 PASS, 21 FAIL, 0 SKIP
  Full config: cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+a=
rm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/cros---chromeos-5.10-arm64-chromiumos-arm64.flavour.config+arm64-chromebo=
ok/clang-13/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/63522c81dd8928ece75e5b9b
        failing since 3 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-21T05:21:28.117116  <8>[   40.529664] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-10-21T05:21:29.132635  /lava-7666215/1/../bin/lava-test-case
    2022-10-21T05:21:29.144126  <8>[   41.556823] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/63522c81dd8928ece75e5b9c
        failing since 3 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-21T05:21:28.103787  /lava-7666215/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/63522c81dd8928ece75e5b9d
        failing since 3 days (last pass: next-20221013, first fail: next-20=
221017)

    2022-10-21T05:21:26.033432  <8>[   38.445692] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-driver-present RESULT=3Dpass>
    2022-10-21T05:21:27.071602  /lava-7666215/1/../bin/lava-test-case
    2022-10-21T05:21:27.083877  <8>[   39.496639] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63522d5cd0bbff896d5e5b9a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-collabora/baseline-rk3399=
-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522d5cd0bbff896d5e5=
b9b
        new failure (last pass: next-20221020) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-rock-pi-4b            | arm64 | lab-collabora   | gcc-10   | defconf=
ig+crypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6352333983912ce8165e5b70

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+crypto/gcc-10/lab-collabora/baseline-rk3399-rock-pi-4b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6352333983912ce8165e5=
b71
        failing since 1 day (last pass: next-20221019, first fail: next-202=
21020) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | clang-13 | defconf=
ig+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/63522888640d35d38c5e5b51

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    clang-13 (Debian clang version 13.0.1-6~deb11u1)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm6=
4/defconfig+arm64-chromebook/clang-13/lab-collabora/baseline-sc7180-trogdor=
-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63522888640d35d38c5e5=
b52
        new failure (last pass: next-20221020) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 2          =


  Details:     https://kernelci.org/test/plan/id/63524c12cd3d1640ee5e5b60

  Results:     4 PASS, 3 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-tegra124-ny=
an-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63524c12cd3d164=
0ee5e5b63
        failing since 23 days (last pass: next-20220921, first fail: next-2=
0220927)
        45 lines

    2022-10-21T07:36:28.350268  l NULL pointer dereference at virtual addre=
ss 00000000
    2022-10-21T07:36:28.353508  kern  :alert : [00000000] *pgd=3Df639a835
    2022-10-21T07:36:28.362326  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c4e9e800 pointer offset 0 size 1024
    2022-10-21T07:36:28.372865  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0e48000 allocated at kernel_clone+0x8c/0x=
310
    2022-10-21T07:36:28.377588  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-21T07:36:28.382185  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-21T07:36:28.391034  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c20b2400 pointer offset 16 size 1024
    2022-10-21T07:36:28.401629  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf263000 allocated at load_module+0x994/0x=
1cec
    2022-10-21T07:36:28.410445  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c4e9e800 pointer offset 0 size 1024
    2022-10-21T07:36:28.419073  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c4da6000 pointer offset 64 size 512 =

    ... (38 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63524c12cd3d164=
0ee5e5b64
        failing since 23 days (last pass: next-20220921, first fail: next-2=
0220927)
        16 lines

    2022-10-21T07:36:28.321952  <8>[   25.534661] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-10-21T07:36:28.333325  kern  :alert : 8<--- cut here ---
    2022-10-21T07:36:28.345296  kern  :alert : Unable to handle kerne<8>[  =
 25.555379] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D16>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | tegra_d=
efconfig              | 2          =


  Details:     https://kernelci.org/test/plan/id/63524c8a1611ffa5f05e5b50

  Results:     3 PASS, 2 FAIL, 2 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221021/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221021/arm/=
tegra_defconfig/gcc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221007.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/63524c8a1611ffa=
5f05e5b53
        failing since 22 days (last pass: next-20220921, first fail: next-2=
0220928)
        45 lines

    2022-10-21T07:38:45.489662  <8>[   51.124395] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D16>
    2022-10-21T07:38:45.492120  kern  :alert : [00000000] *pgd=3Df7ef9835
    2022-10-21T07:38:45.500619  kern  :alert : Register r0 information: sla=
b kmalloc-1k start c2e4a800 pointer offset 0 size 1024
    2022-10-21T07:38:45.511499  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xf0dfc000 allocated at kernel_clone+0x8c/0x=
398
    2022-10-21T07:38:45.515910  kern  :alert : Register r2 information: NUL=
L pointer
    2022-10-21T07:38:45.520497  kern  :alert : Register r3 information: NUL=
L pointer
    2022-10-21T07:38:45.529176  kern  :alert : Register r4 information: sla=
b kmalloc-1k start c170a400 pointer offset 16 size 1024
    2022-10-21T07:38:45.540090  kern  :alert : Register r5 information: 6-p=
age vmalloc region starting at 0xbf27b000 allocated at load_module+0x99c/0x=
1e28
    2022-10-21T07:38:45.548599  kern  :alert : Register r6 information: sla=
b kmalloc-1k start c2e4a800 pointer offset 0 size 1024
    2022-10-21T07:38:45.557322  kern  :alert : Register r7 information: sla=
b kmalloc-512 start c2e0ec00 pointer offset 64 size 512 =

    ... (44 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63524c8a1611ffa=
5f05e5b54
        failing since 22 days (last pass: next-20220921, first fail: next-2=
0220928)
        16 lines

    2022-10-21T07:38:45.444624  <8>[   51.081967] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-10-21T07:38:45.471906  kern  :alert : 8<--- cut here ---
    2022-10-21T07:38:45.479864  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000000   =

 =20
