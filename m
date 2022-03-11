Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94774D5CF3
	for <lists+linux-next@lfdr.de>; Fri, 11 Mar 2022 09:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbiCKIDn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Mar 2022 03:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347375AbiCKIDl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Mar 2022 03:03:41 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2067F293
        for <linux-next@vger.kernel.org>; Fri, 11 Mar 2022 00:02:33 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id mg21-20020a17090b371500b001bef9e4657cso10495826pjb.0
        for <linux-next@vger.kernel.org>; Fri, 11 Mar 2022 00:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jAUcBCQwnn4TR/eNOWyohNP+SyMgQZnEB54JRcuO4po=;
        b=PAcTqzSNdL3mycZSisiAWzsN4p/+FQgtjLGYx4bUazMlu876et110/e7yVSLjcw6nk
         YzqUNOrz5gRYujre6EyAMe/uB3vXmrYRoprDeN6wf+zSfuniS++vT0IoUZrLtbHtWmDm
         jjoQPkoGNNepliZIqv1nbTc5HYBH1wNLk3j9C9WwpLBec+YFBhGJ00a+DFHMzw7vGQj5
         MnPRnCuP83Fel6+PT+Cb7M+lO1jtUif1Rilx62f/4fJvozi69B2n6nrF6m3R/b2wCJOo
         qkADuzOKYGlf/h4qsOf+Xrc3SaoNc8Ye/VYAdWPNlkuzvOoT954pbUBZvoM1gv3Ga/a+
         RACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jAUcBCQwnn4TR/eNOWyohNP+SyMgQZnEB54JRcuO4po=;
        b=kaJ10pKUMPqMm9fNrjVHJYlxobBoSu1Ye6YzAg83ittESCFFeJp6dzo5jGRNm35F0D
         Fbgn8PIMxuVi9gObRAW6x4JZBQtw8EsRwbefmuHu8ObJOoCSjhZuozTIhyeEMtpROLLd
         +SR+/PLK1joIy9fb/5b0oxeCjIzGL0LVaIM2iKJ1PsJ5QLjxNu+9fRTbjssGsHeI4G38
         dYdBx1ior4icqB+AY0yffCH16b0Hn4twGpkfFCRd9mBZmKifigJsExKa4gQGWoRaQbKr
         qFqtZ5TaD/J6jT6bV0IzeypidGOA+/8rzXgq1kmaUjMdcxsJSJy87s71L+vo6WcKDtPP
         DZHQ==
X-Gm-Message-State: AOAM530+T9QxJw9pLd1sGczE+qSWRMrMROCExVqJeAvesLFbG2c/13F/
        i8U5CAIZPgCEK86j2Vz4ex8xXPMY7rTJriKEf/k=
X-Google-Smtp-Source: ABdhPJyENnaCEjKhyf0YP3aL5aP6Sj2r2cU69gsSEWTlXgY3aDHHH3ZnOMrl7YtNTdrscdsYfV/SeQ==
X-Received: by 2002:a17:90a:178f:b0:1bf:5f5a:728 with SMTP id q15-20020a17090a178f00b001bf5f5a0728mr9606223pja.171.1646985752539;
        Fri, 11 Mar 2022 00:02:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h13-20020a056a00230d00b004f427ffd485sm10203401pfh.143.2022.03.11.00.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 00:02:32 -0800 (PST)
Message-ID: <622b0218.1c69fb81.cbb24.a3d2@mx.google.com>
Date:   Fri, 11 Mar 2022 00:02:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc7-273-g090ff5ac1521
Subject: next/pending-fixes baseline: 270 runs,
 27 regressions (v5.17-rc7-273-g090ff5ac1521)
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

next/pending-fixes baseline: 270 runs, 27 regressions (v5.17-rc7-273-g090ff=
5ac1521)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc7-273-g090ff5ac1521/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc7-273-g090ff5ac1521
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      090ff5ac15212ac5383e5f03508d5e6ef76019d9 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc4076aa658a4bc62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc4076aa658a4bc62=
976
        failing since 21 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acd9cb69aac192ec62998

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acd9cb69aac192ec62=
999
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
cubietruck                   | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acd8bdb2b8b3786c629aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acd8bdb2b8b3786c62=
9ab
        failing since 1 day (last pass: v5.17-rc4-202-g519817c8f9d2, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/622aca2f8560ccaea0c62973

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/622aca2f8560cca=
ea0c62977
        failing since 46 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-11T04:03:38.272505  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-11T04:03:38.272737  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-11T04:03:38.272875  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-11T04:03:38.317322  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-sabrelite              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622aeea51da1c2cae1c62968

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-imx6q-sabrelite.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-imx6q-sabrelite.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622aeea51da1c2cae1c62=
969
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx6q-var-dt6customboard     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc2252914f22a4c6296f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-imx6q-var-dt6customboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-imx6q-var-dt6customboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc2252914f22a4c62=
970
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc70fd189c89aec62980

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7d-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7d-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc70fd189c89aec62=
981
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7ulp-evk                  | arm   | lab-nxp       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc66fd189c89aec6297d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-nxp/baseline-imx7ulp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc66fd189c89aec62=
97e
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson8b-odroidc1             | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc36eb534151d6c62a6f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-meson8b-odroidc1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-meson8b-odroidc1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc36eb534151d6c62=
a70
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
odroid-xu3                   | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622ad1ecd29b83e561c62986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-odroid-xu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622ad1ecd29b83e561c62=
987
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acf11e5b6f19cc2c6298d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acf11e5b6f19cc2c62=
98e
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622accd5e2e0ef9946c6297b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622accd5e2e0ef9946c62=
97c
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc997c879b6975c629b8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc997c879b6975c62=
9b9
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622accd60ea049e7d1c62987

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622accd60ea049e7d1c62=
988
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622accc0e2e0ef9946c62976

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622accc0e2e0ef9946c62=
977
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-rock2-square          | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622ad3a56c2c89003cc62973

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622ad3a56c2c89003cc62=
974
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acda1b69aac192ec629b2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acda1b69aac192ec62=
9b3
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/622acaa2775c618cd3c6297b

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/622acaa2775c618cd3c6299e
        failing since 11 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-03-11T04:05:43.323477  <8>[   32.676576] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-03-11T04:05:44.350215  /lava-5856235/1/../bin/lava-test-case
    2022-03-11T04:05:44.361014  <8>[   33.715648] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun7i-a20-cubieboard2        | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc827c879b6975c62986

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun7i-a20-cubieboard2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun7i-a20-cubieboard2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc827c879b6975c62=
987
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a33-olinuxino          | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622ace2666ed3f9638c62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a33-olinuxino.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a33-olinuxino.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622ace2666ed3f9638c62=
979
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc5afd189c89aec62978

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc5afd189c89aec62=
979
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus...ch-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622ace75a975765eedc62977

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622ace75a975765eedc62=
978
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h2-plus-orangepi-r1    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622ad8d2a203958882c629b6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-orangepi-r1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h2-plus-orangepi-r1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622ad8d2a203958882c62=
9b7
        failing since 1 day (last pass: v5.17-rc4-173-gecf2acb68532, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-bananapi-m2-plus    | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc37cd592332abc6296d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-bananapi-m2-plus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc37cd592332abc62=
96e
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-libretech-all-h3-cc | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acc2152914f22a4c6296c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-sun8i-h3-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acc2152914f22a4c62=
96d
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-h3-orangepi-pc         | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622acfdfa0e47a71d0c62975

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-h3-orangepi-pc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-h3-orangepi-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622acfdfa0e47a71d0c62=
976
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun8i-r40-bananapi-m2-ultra  | arm   | lab-clabbe    | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/622ad20fd29b83e561c62997

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc7-2=
73-g090ff5ac1521/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-clabbe/baseline-sun8i-r40-bananapi-m2-ultra.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/622ad20fd29b83e561c62=
998
        failing since 1 day (last pass: v5.17-rc6-312-gf15bf60c638f, first =
fail: v5.17-rc7-200-gfb8a41b34095) =

 =20
