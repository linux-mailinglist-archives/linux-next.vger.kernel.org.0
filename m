Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DD24DC0B7
	for <lists+linux-next@lfdr.de>; Thu, 17 Mar 2022 09:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiCQINu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Mar 2022 04:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiCQINt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Mar 2022 04:13:49 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DBC1C5919
        for <linux-next@vger.kernel.org>; Thu, 17 Mar 2022 01:12:33 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id mr5-20020a17090b238500b001c67366ae93so2371810pjb.4
        for <linux-next@vger.kernel.org>; Thu, 17 Mar 2022 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aFifDwfkjWi1XsciX5fO+htZGLsmtflyq/6NFw7s9qw=;
        b=Az1wyStlLKcyIa3dLg4n/yDiNOe5WVdR2gXXft2Ae0rgSYS/hx3XXBuPBrNvepJIC+
         SNCxFZhLNJC/uFLMHv+brN7PVvpxqgk985WNUgEZgTH0MKcDMfRKtnSm80g4CLjDD3RP
         6kEOttQpbwrJ9QoNyg3eBZM77OyKbdextPge8GySYCuPPJtdE1pPjfD1q8qiI4/BlWb0
         MtLCBibAEltx89RNGxplMfiqFlc0nB+KAG3m6bKO0/2U4xD2/5iw75scbESJoeES70jd
         YZsgG0/NCPwpTUsZCm1/scJNp6fkXfjDN1oXfCEIqwRS7ZIpLFMWGvLfmcp17iGH+a+V
         vGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aFifDwfkjWi1XsciX5fO+htZGLsmtflyq/6NFw7s9qw=;
        b=zpNQ8FGODQCRr+7Lo55iwB7mlyy89KLC4oONblZ7QCjiHiPDqSvKYTfn37Pe8CRu8l
         BxxaboURNFATVmm3GLgYoMPnrUQDoqzadQ52bYfdbnNYujHJ2X6ms7mb9g9PIrl7C0AN
         grkNPaYQGvoWkzXT0X0jnxDcPQHBqE1UznhC+GnbQOn4JSS1FObW6gjXZb8Z8qqtGmk3
         I8klyqPSGSR/eq2aIuWlen5wcdn3olyKlDkfJ/mtOer3e+6OojQw572R9fORHxLog57d
         HyEKONyDHHrK2K6fmGrKUCPdG7rBvLeLS+kF1bgn6Uq8tvOWLB9K29rdoK5FsMqRQneQ
         0seg==
X-Gm-Message-State: AOAM530u7ekpwZxbabiDpxbR2sCYvsZFxI2vC2uqoNuZoOF70EPcQy0d
        3puM0mEH5DfG3BAm7RXuykXkE8bAQTHXu9Tuxc0=
X-Google-Smtp-Source: ABdhPJxjl+jtndBvtMmOKPVEB4FY5hYkISukZy4uhduydDcC1oq4ByjNI8SAJojg2sB/fGU1zyRchg==
X-Received: by 2002:a17:902:9348:b0:14d:8ee9:329f with SMTP id g8-20020a170902934800b0014d8ee9329fmr3548740plp.80.1647504752239;
        Thu, 17 Mar 2022 01:12:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ij17-20020a17090af81100b001c67c964d93sm1971982pjb.2.2022.03.17.01.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 01:12:31 -0700 (PDT)
Message-ID: <6232ed6f.1c69fb81.8873f.3d88@mx.google.com>
Date:   Thu, 17 Mar 2022 01:12:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.17-rc8-133-gcdf39fcb6bec
Subject: next/pending-fixes baseline: 261 runs,
 10 regressions (v5.17-rc8-133-gcdf39fcb6bec)
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

next/pending-fixes baseline: 261 runs, 10 regressions (v5.17-rc8-133-gcdf39=
fcb6bec)

Regressions Summary
-------------------

platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
am57xx-beagle-x15         | arm    | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

bcm2836-rpi-2-b           | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =

hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =

meson-g12b-odroid-n2      | arm64  | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 2          =

r8a77950-salvator-x       | arm64  | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.17-rc8-133-gcdf39fcb6bec/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.17-rc8-133-gcdf39fcb6bec
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      cdf39fcb6bec26813fcdd188d997153e6518da1f =



Test Regressions
---------------- =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
am57xx-beagle-x15         | arm    | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6232b7d73d8e3888d3b7392d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-=
am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6232b7d73d8e3888d3b73=
92e
        failing since 34 days (last pass: v5.17-rc3-356-gdfd7907f4e4f, firs=
t fail: v5.17-rc3-394-gc849047c2473) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6232b6f2c592a46327b7392b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6232b6f2c592a46327b73=
92c
        failing since 1 day (last pass: v5.17-rc7-200-gfb8a41b34095, first =
fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
asus-C523NA-A20057-coral  | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6232b957b9c16231f8b73948

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C523NA-A20057-coral.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-asus-C523NA-A20057-coral.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6232b957b9c16231f8b73=
949
        failing since 2 days (last pass: v5.17-rc7-220-g483b57a0f972, first=
 fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b           | arm    | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6232b834f1d2693e88b73957

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6232b834f1d2693e88b73=
958
        failing since 28 days (last pass: v5.17-rc4-260-ga9d1ea1cfc32, firs=
t fail: v5.17-rc4-287-g3d4071e48b88) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
da850-lcdk                | arm    | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/6232b5303a88267861b739bb

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6232b5303a88267=
861b739c3
        failing since 52 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-03-17T04:12:12.782516  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-03-17T04:12:12.782826  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-03-17T04:12:12.783050  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-03-17T04:12:12.825435  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6232baeb7508a50cebb7391d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabor=
a/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6232baeb7508a50cebb73=
91e
        failing since 1 day (last pass: v5.17-rc7-200-gfb8a41b34095, first =
fail: v5.17-rc8-122-ge6f79dd905ae) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
hp-x360-12b-n4000-octopus | x86_64 | lab-collabora | gcc-10   | x86_64_defc=
on...ebook+amdgpu | 1          =


  Details:     https://kernelci.org/test/plan/id/6232bc65b3f7bd3889b7392a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+amdgpu
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-n4000-octopus.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/x86_64/x86_64_defconfig+x86-chromebook+amdgpu/gcc-10/lab-c=
ollabora/baseline-hp-x360-12b-n4000-octopus.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6232bc65b3f7bd3889b73=
92b
        failing since 2 days (last pass: v5.17-rc7-220-g483b57a0f972, first=
 fail: v5.17-rc8-96-g702087d7e205) =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
meson-g12b-odroid-n2      | arm64  | lab-baylibre  | gcc-10   | defconfig+i=
ma                | 2          =


  Details:     https://kernelci.org/test/plan/id/6232b47ff96e14419eb7396c

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12=
b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6232b47ff96e144=
19eb73974
        new failure (last pass: v5.17-rc8-122-ge6f79dd905ae)
        12 lines

    2022-03-17T04:09:18.295050  kern  :alert : Mem abort info:
    2022-03-17T04:09:18.334379  kern  <8>[   15.311239] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-03-17T04:09:18.334786  :alert :   ESR =3D 0x96000005   =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6232b47ff96e144=
19eb73975
        new failure (last pass: v5.17-rc8-122-ge6f79dd905ae)
        2 lines

    2022-03-17T04:09:18.336038  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-03-17T04:09:18.336350  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-03-17T04:09:18.336661  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-03-17T04:09:18.336921  kern  :alert :   FSC =3D 0x05: level <8>[  =
 15.336743] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-03-17T04:09:18.337175  1 translat<8>[   15.346015] <LAVA_SIGNAL_EN=
DRUN 0_dmesg 1711337_1.5.2.4.1>   =

 =



platform                  | arch   | lab           | compiler | defconfig  =
                  | regressions
--------------------------+--------+---------------+----------+------------=
------------------+------------
r8a77950-salvator-x       | arm64  | lab-baylibre  | gcc-10   | defconfig+c=
rypto             | 1          =


  Details:     https://kernelci.org/test/plan/id/6232c4e92bef78ab27b7391d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.17-rc8-1=
33-gcdf39fcb6bec/arm64/defconfig+crypto/gcc-10/lab-baylibre/baseline-r8a779=
50-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220228.1/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6232c4e92bef78ab27b73=
91e
        new failure (last pass: v5.17-rc8-122-ge6f79dd905ae) =

 =20
