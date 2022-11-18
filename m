Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C7E62F449
	for <lists+linux-next@lfdr.de>; Fri, 18 Nov 2022 13:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241575AbiKRMLI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Nov 2022 07:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235301AbiKRMK6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Nov 2022 07:10:58 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E44397376
        for <linux-next@vger.kernel.org>; Fri, 18 Nov 2022 04:10:35 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so4905238pjk.1
        for <linux-next@vger.kernel.org>; Fri, 18 Nov 2022 04:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H0urBh7xJ2A+IaXqjk38XC6/pAPkt8l4ZhaFtzl/1YI=;
        b=lT9aA+Xed44ZE2D4RFpf2d8hZaNTDoZ7rX7iDlMVlfWAhVLy/Ih+Bv+BUahcV7gU8q
         KHPF/NNlkph4fWQY51DCOzyduchSP/BUaPNp3eMN4CdxgtvsmoIAO4ICyUvt0KD3q1oB
         WVkt3gTcC1ecaB+BWO8eP8fjirdxWtDhS5VYPXbCH0nXzeUi6Nq8MsAk39RHOLi2vfXh
         BtS47SSiYeYHuW6nLxAo8yBjCuAZDyBur1ZslS13okf6b+oBLWFnCUDoFHSaejwdIigT
         VQRKp9nOksaEUKE9uzXOCruEybD6ZEbcjvB4XaP6mTMWmNs3tdwXYyjiz++b7vozWSZA
         IHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0urBh7xJ2A+IaXqjk38XC6/pAPkt8l4ZhaFtzl/1YI=;
        b=2WL5utaVGsjjyPPButtqmckrFGGnMFQ98gtX/AIzvb/ytU0+XTxZYGnfATrNMDbadd
         HPt1yLlP2weI/4tZ2m3SS9P8UOqqdkd6QN7irUUaciC3CQDfwg8NPxHBczyGidcmXKkK
         MA0vzUMRXwCvNItJH4ftgXbF0TNP8CBOyfc0+M1JNq2Srdn+4+drGjHJKiwBXWT523yG
         eOpVQM6nGyKNcD2Np9ABVqkBHsL06Ifh1OMPYjhlDNH/xFjNbw5t5E61y8kdWvKTkmho
         pATFJQTRuW01q7iIvXYD+CqflvJm28rHY79LpymG0TEXoTyL8wiJzo+6dkLiO5WqvUIV
         H+fA==
X-Gm-Message-State: ANoB5pkWQi1BfWlVIKq1Nf7j+UfX7/POcO5HPELihAheCvBarpSMVS4m
        fODVjZ0Ali/xjJ5kH5Xb55HekWaNMcZcQ9u5f2Y=
X-Google-Smtp-Source: AA0mqf7Y0vkX/4fv53v9vm28z6XuATMc8PRTo3M/kZ58y84BxsaOw9vuQ8FoZCKp1rXFS0nnNG3sfA==
X-Received: by 2002:a17:902:a984:b0:187:282c:9ba4 with SMTP id bh4-20020a170902a98400b00187282c9ba4mr7401390plb.42.1668773434658;
        Fri, 18 Nov 2022 04:10:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t29-20020aa7947d000000b0056b6d31ac8asm3072449pfq.178.2022.11.18.04.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:10:34 -0800 (PST)
Message-ID: <6377763a.a70a0220.7796e.487c@mx.google.com>
Date:   Fri, 18 Nov 2022 04:10:34 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221118
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/master baseline: 604 runs, 12 regressions (next-20221118)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 604 runs, 12 regressions (next-20221118)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | clang-16 | multi_v=
7_defconfig           | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | clang-16 | multi_v=
7_defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig           | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
221118/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20221118
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      147307c69ba4441ee90c1f8ce8edf5df4ea60f67 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6377556fb947ba08e72abd36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkft/baseline-am57xx-be=
agle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6377556fb947ba08e72ab=
d37
        failing since 62 days (last pass: next-20220915, first fail: next-2=
0220916) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/637743f8b8f06fb3862abd03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637743f8b8f06fb3862ab=
d04
        failing since 161 days (last pass: next-20220601, first fail: next-=
20220610) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | clang-16 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6377585ec37963cdac2abd3b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221110071954+dd9f7=
963e434-1~exp1~20221110072047.450)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig/clang-16/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6377585ec37963cdac2ab=
d3c
        failing since 86 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/637755b57577db06fb2abd1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-10/lab-baylibre/b=
aseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637755b57577db06fb2ab=
d1c
        failing since 220 days (last pass: next-20220401, first fail: next-=
20220411) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | clang-16 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63774c4f42e16cfb902abd0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221110071954+dd9f7=
963e434-1~exp1~20221110072047.450)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig/clang-16/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig/clang-16/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63774c4f42e16cfb902ab=
d0b
        failing since 11 days (last pass: next-20221104, first fail: next-2=
0221107) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63773f1bd635a693202abd0a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63773f1bd635a693202ab=
d0b
        failing since 11 days (last pass: next-20221104, first fail: next-2=
0221107) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/637747c7045118a37e2abcfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-kontron/baseline-kontron-kswit=
ch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637747c7045118a37e2ab=
cfc
        failing since 11 days (last pass: next-20221104, first fail: next-2=
0221107) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63774ad3fb79a9adf02abd27

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
multi_v7_defconfig/gcc-10/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g-2=
gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63774ad3fb79a9adf02ab=
d28
        failing since 11 days (last pass: next-20221104, first fail: next-2=
0221107) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | clang-16 | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63774817d088c51e592abd13

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-16 (Debian clang version 16.0.0-++20221110071954+dd9f7=
963e434-1~exp1~20221110072047.450)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/clang-16/lab-kontron/baseline-kontro=
n-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63774817d088c51e592ab=
d14
        failing since 17 days (last pass: next-20221028, first fail: next-2=
0221101) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/637749a7e63181d1e82abd4a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/637749a7e63181d1e82ab=
d4b
        failing since 9 days (last pass: next-20221107, first fail: next-20=
221109) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63773cf9b2005d2bdc2abcff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-cloudengines-pogoplug=
-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63773cf9b2005d2bdc2ab=
d00
        failing since 87 days (last pass: next-20220822, first fail: next-2=
0220823) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63773f12ce4cc2248b2abd01

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20221118/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20221118/arm/=
shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg20d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221107.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63773f12ce4cc2248b2ab=
d02
        failing since 0 day (last pass: next-20221116, first fail: next-202=
21117) =

 =20
