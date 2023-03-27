Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED57E6C998C
	for <lists+linux-next@lfdr.de>; Mon, 27 Mar 2023 04:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjC0CWW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Mar 2023 22:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjC0CWW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 26 Mar 2023 22:22:22 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FB2448C
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2023 19:22:18 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id ix20so7035866plb.3
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2023 19:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1679883737;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fvPCjPN4STHe6E2FVbqn2lo1uEHuzYzgbCtyC85ZiAo=;
        b=1ag/OpbjmXlevHOIVvdGhAO840+KzxvRmC5PcPGYMX/A9fkn0+G61PbgQR0I13gr8V
         fmnsvi9WW6rqutLisn09LXaTo1bs0m6DhpAGHQRMY342/jAJff3mlHNltJyEOKAB8UBy
         EgVp7nT1XJuv/a2miD7OvBrZ4F3Wieir5yqF6VbVVu/czS0a7cJRm4rKQQV71Tb+dsUV
         BtafBXdPLFCQHr+CB7YFEpblBu7arGxQVujLXIrjIbPAtO7b9qT+MIoJfanopiP6RARY
         wwWMLPIGesIWLbR273G/GrRRnVeMvo84MtfuuC9B25lekUxgr4JP8EBaQ66QCYCIoEw0
         /SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679883737;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvPCjPN4STHe6E2FVbqn2lo1uEHuzYzgbCtyC85ZiAo=;
        b=H6hv0ZK2C7BvrxPVrkdD0PWuQiDVDoOIU0pCeab+EsrhZe82RgMjY+/0ONZsTLElhH
         8l/9hsHUyvdr4U19xw/wQuMUpq6APeeD2Xo9FYsBmJrvOs73N4eXv8YMXHBulz/QsDCX
         vykTSOlpRHpK8F0nR+XtH9F+AL+pE379BUqv0YuqsmPySr2l+SRSrB5UnrQOON22eW+1
         r8H0KVYkoST2QWW3yHuDr8cDeA6W+Z2fFT1HraCkf/d7XwcCFHKKSC0d0f8k+yBot5Hp
         JUZJMZipExmjSxk7GCWiCf8ijpnpnkNMZJW6elpT6shGG+yzysS/K2GJjYSmiFMOUx3F
         g1uw==
X-Gm-Message-State: AAQBX9f8r4UyxmN5bFXk1HuntvRMWvnbKdKtt5zgBYmeRe+HN/NFYO0S
        a/6rnBY55OuJa7EllZyFA118YwQHJg6sF/r2Ujs=
X-Google-Smtp-Source: AKy350YpGv+fSkoLtrHv8iAShy3Y8VBt/7RlTho+k2H3X5/mP3l+lofWT9t83/JiIiVq13a3X/9hmw==
X-Received: by 2002:a17:90b:1c09:b0:240:d8a:8d24 with SMTP id oc9-20020a17090b1c0900b002400d8a8d24mr11574233pjb.4.1679883736894;
        Sun, 26 Mar 2023 19:22:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709026b8400b001a24cded097sm638765plk.236.2023.03.26.19.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 19:22:16 -0700 (PDT)
Message-ID: <6420fdd8.170a0220.52843.134c@mx.google.com>
Date:   Sun, 26 Mar 2023 19:22:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.3-rc3-550-g902f54bbd6c7
Subject: next/pending-fixes baseline: 365 runs,
 33 regressions (v6.3-rc3-550-g902f54bbd6c7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 365 runs, 33 regressions (v6.3-rc3-550-g902f54=
bbd6c7)

Regressions Summary
-------------------

platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =

bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =

bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =

beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =

imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =

kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =

meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =

qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =

rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc3-550-g902f54bbd6c7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc3-550-g902f54bbd6c7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      902f54bbd6c704147f2fc71dcb4f1c64a05d5201 =



Test Regressions
---------------- =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c33711ccc84f009c951f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420c33711ccc84f009c9=
520
        failing since 167 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
am57xx-beagle-x15            | arm    | lab-linaro-lkft | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc3488c10c73cd9c9511

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc3488c10c73cd9c9=
512
        failing since 165 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
asus-CM1400CXA-dalboz        | x86_64 | lab-collabora   | gcc-10   | x86_64=
_defcon...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c1fc88afd2c72f9c952b

  Results:     6 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook+kselftest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/x86_64/x86_64_defconfig+x86-chromebook+kselftest/gcc-10/lab=
-collabora/baseline-asus-CM1400CXA-dalboz.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/x86/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6420c1fc88afd2c=
72f9c952e
        failing since 11 days (last pass: v6.3-rc2-254-g7f35d1f08bb0, first=
 fail: v6.3-rc2-307-g900e881df1ea3)
        3 lines

    2023-03-26T22:06:29.675210  kern  :emerg : __common_interrupt: 1.55 No =
irq handler for vector

    2023-03-26T22:06:29.682054  kern  :emerg : __common_interrupt: 2.55 No =
irq handler for vector

    2023-03-26T22:06:29.687899  kern  :emerg : __common_interrupt: 3.55 No =
irq handler for vector

    2023-03-26T22:06:29.694378  <8>[   14.248372] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>
   =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2835-rpi-b-rev2           | arm    | lab-broonie     | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c0c4b39872b1489c950a

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c0c5b39872b1489c9541
        failing since 12 days (last pass: v6.3-rc1-336-gbec2983895c5, first=
 fail: v6.3-rc2-254-g7f35d1f08bb0)

    2023-03-26T22:01:17.962835  + set +x
    2023-03-26T22:01:17.966547  <8>[   17.664877] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 231771_1.5.2.4.1>
    2023-03-26T22:01:18.099683  / # #
    2023-03-26T22:01:18.202578  export SHELL=3D/bin/sh
    2023-03-26T22:01:18.203247  #
    2023-03-26T22:01:18.305447  / # export SHELL=3D/bin/sh. /lava-231771/en=
vironment
    2023-03-26T22:01:18.306160  =

    2023-03-26T22:01:18.408481  / # . /lava-231771/environment/lava-231771/=
bin/lava-test-runner /lava-231771/1
    2023-03-26T22:01:18.409619  =

    2023-03-26T22:01:18.416139  / # /lava-231771/bin/lava-test-runner /lava=
-231771/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
bcm2836-rpi-2-b              | arm    | lab-collabora   | gcc-10   | bcm283=
5_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c0c839855039ac9c9511

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c0c839855039ac9c951a
        failing since 74 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-26T22:01:28.555794  / # #

    2023-03-26T22:01:28.658367  export SHELL=3D/bin/sh

    2023-03-26T22:01:28.659136  #

    2023-03-26T22:01:28.761176  / # export SHELL=3D/bin/sh. /lava-9779338/e=
nvironment

    2023-03-26T22:01:28.761971  =


    2023-03-26T22:01:28.864053  / # . /lava-9779338/environment/lava-977933=
8/bin/lava-test-runner /lava-9779338/1

    2023-03-26T22:01:28.865347  =


    2023-03-26T22:01:28.875647  / # /lava-9779338/bin/lava-test-runner /lav=
a-9779338/1

    2023-03-26T22:01:28.988781  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-26T22:01:28.989333  + cd /lava-9779338/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
beagle-xm                    | arm    | lab-baylibre    | gcc-10   | omap2p=
lus_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c4be0f6dbfddc19c9506

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/omap2plus_defconfig/gcc-10/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420c4be0f6dbfddc19c9=
507
        failing since 17 days (last pass: v6.3-rc1-217-g03913bd4e939, first=
 fail: v6.3-rc1-281-g08705758878ed) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c367b8b13b4b6a9c951a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c367b8b13b4b6a9c9523
        failing since 68 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-26T22:12:39.515496  <8>[   17.208246] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3446859_1.5.2.4.1>
    2023-03-26T22:12:39.624683  / # #
    2023-03-26T22:12:39.727758  export SHELL=3D/bin/sh
    2023-03-26T22:12:39.728662  #
    2023-03-26T22:12:39.830578  / # export SHELL=3D/bin/sh. /lava-3446859/e=
nvironment
    2023-03-26T22:12:39.831450  =

    2023-03-26T22:12:39.933335  / # . /lava-3446859/environment/lava-344685=
9/bin/lava-test-runner /lava-3446859/1
    2023-03-26T22:12:39.935082  =

    2023-03-26T22:12:39.939899  / # /lava-3446859/bin/lava-test-runner /lav=
a-3446859/1
    2023-03-26T22:12:40.020906  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c575f56cb22e9b9c950e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c575f56cb22e9b9c9517
        failing since 68 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-26T22:21:19.183467  + set +x<8>[   24.164844] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3446901_1.5.2.4.1>
    2023-03-26T22:21:19.184120  =

    2023-03-26T22:21:19.293336  / # #
    2023-03-26T22:21:19.397077  export SHELL=3D/bin/sh
    2023-03-26T22:21:19.398214  #
    2023-03-26T22:21:19.500604  / # export SHELL=3D/bin/sh. /lava-3446901/e=
nvironment
    2023-03-26T22:21:19.501797  =

    2023-03-26T22:21:19.604372  / # . /lava-3446901/environment/lava-344690=
1/bin/lava-test-runner /lava-3446901/1
    2023-03-26T22:21:19.606215  =

    2023-03-26T22:21:19.610892  / # /lava-3446901/bin/lava-test-runner /lav=
a-3446901/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
cubietruck                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c5e814c65821869c9529

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c5e814c65821869c9532
        failing since 68 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-26T22:23:25.438292  <8>[   14.756333] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3446947_1.5.2.4.1>
    2023-03-26T22:23:25.550641  / # #
    2023-03-26T22:23:25.652142  export SHELL=3D/bin/sh
    2023-03-26T22:23:25.653181  #
    2023-03-26T22:23:25.755433  / # export SHELL=3D/bin/sh. /lava-3446947/e=
nvironment
    2023-03-26T22:23:25.755893  =

    2023-03-26T22:23:25.857265  / # . /lava-3446947/environment/lava-344694=
7/bin/lava-test-runner /lava-3446947/1
    2023-03-26T22:23:25.857816  =

    2023-03-26T22:23:25.864404  / # /lava-3446947/bin/lava-test-runner /lav=
a-3446947/1
    2023-03-26T22:23:25.965143  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
da850-lcdk                   | arm    | lab-baylibre    | gcc-10   | davinc=
i_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/6420c5b8e125cfa5859c9506

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/6420c5b8e125cfa=
5859c9509
        failing since 23 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-26T22:22:24.816131  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-26T22:22:24.861046  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-26T22:22:24.861349  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e20600 pointer offset 4 size 512
    2023-03-26T22:22:24.861539  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-26T22:22:24.861911  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-26T22:22:24.862108  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf3e2000 allocated at load_module+0x898/0=
x1b10
    2023-03-26T22:22:24.863910  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-26T22:22:24.952145  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-26T22:22:24.952430  kern  :emerg : Process udevd (pid: 73, stac=
k limit =3D 0x0173d782)
    2023-03-26T22:22:24.952609  kern  :emerg : Stack: (0xc898dcf8 to 0xc898=
e000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/6420c5b8e125cfa=
5859c950a
        failing since 427 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-26T22:22:24.769590  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-26T22:22:24.769882  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-26T22:22:24.770073  kern  :alert : 8<--- cut here ---
    2023-03-26T22:22:24.770246  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-26T22:22:24.770416  kern  :alert : [00000060] *pgd=3Dc4a9e831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-26T22:22:24.770586  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-26T22:22:24.813118  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc898c000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-26T22:22:24.813401  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-26T22:22:24.813582  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-26T22:22:24.813751  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6qp-wandboard-revd1       | arm    | lab-pengutronix | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc3988c10c73cd9c9517

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc3988c10c73cd9c9=
518
        failing since 192 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx6ul-14x14-evk             | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c45f6bd10236d89c950b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6u=
l-14x14-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c45f6bd10236d89c9512
        failing since 80 days (last pass: v6.1-rc4-339-g185da88d03ed, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-26T22:16:43.916577  + set +x
    2023-03-26T22:16:43.917658  <8>[   58.192083] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1187151_1.5.2.4.1>
    2023-03-26T22:16:44.025683  =

    2023-03-26T22:16:45.184518  / # #export SHELL=3D/bin/sh
    2023-03-26T22:16:45.189943  =

    2023-03-26T22:16:46.735817  / # export SHELL=3D/bin/sh. /lava-1187151/e=
nvironment
    2023-03-26T22:16:46.741307  =

    2023-03-26T22:16:49.561452  / # . /lava-1187151/environment/lava-118715=
1/bin/lava-test-runner /lava-1187151/1
    2023-03-26T22:16:49.567176  =

    2023-03-26T22:16:49.567352  / # /lava-1187151/bin/lava-test-runner /lav=
a-1187151/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7d-sdb                    | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c44b0fc889802e9c95f7

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c44b0fc889802e9c95fe
        failing since 80 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-26T22:16:26.182667  <8>[   38.353800] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1187149_1.5.2.4.1>
    2023-03-26T22:16:26.286711  / # #
    2023-03-26T22:16:27.446424  export SHELL=3D/bin/sh
    2023-03-26T22:16:27.452120  #
    2023-03-26T22:16:28.999203  / # export SHELL=3D/bin/sh. /lava-1187149/e=
nvironment
    2023-03-26T22:16:29.004830  =

    2023-03-26T22:16:31.824094  / # . /lava-1187149/environment/lava-118714=
9/bin/lava-test-runner /lava-1187149/1
    2023-03-26T22:16:31.829716  =

    2023-03-26T22:16:31.842649  / # /lava-1187149/bin/lava-test-runner /lav=
a-1187149/1
    2023-03-26T22:16:31.921663  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (22 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
imx7ulp-evk                  | arm    | lab-nxp         | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c4c2c310f3ee179c959d

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420c4c2c310f3ee179c95a4
        failing since 80 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-26T22:18:28.917544  + set +x
    2023-03-26T22:18:28.918671  <8>[   66.868035] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1187148_1.5.2.4.1>
    2023-03-26T22:18:29.027473  / # #
    2023-03-26T22:18:30.187485  export SHELL=3D/bin/sh
    2023-03-26T22:18:30.193182  #
    2023-03-26T22:18:30.193500  / # export SHELL=3D/bin/sh
    2023-03-26T22:18:31.741036  / # . /lava-1187148/environment
    2023-03-26T22:18:34.567581  /lava-1187148/bin/lava-test-runner /lava-11=
87148/1
    2023-03-26T22:18:34.573663  . /lava-1187148/environment
    2023-03-26T22:18:34.573957  / # /lava-1187148/bin/lava-test-runner /lav=
a-1187148/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jetson-tk1                   | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c3363d703409f79c9596

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420c3363d703409f79c9=
597
        failing since 331 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
jh7100-starfi...isionfive-v1 | riscv  | lab-clabbe      | gcc-10   | defcon=
fig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c1edc3e2035d1e9c9524

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/riscv/defconfig+kselftest/gcc-10/lab-clabbe/baseline-jh7100=
-starfive-visionfive-v1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/riscv/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420c1edc3e2035d1e9c9=
525
        failing since 47 days (last pass: v6.2-rc7-120-g11b3628314a5, first=
 fail: v6.2-rc7-136-g39693c3ba989) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm    | lab-kontron     | gcc-10   | multi_=
v7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c45b653e0630c69c9598

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-k=
ontron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+crypto/gcc-10/lab-kontron/baseline-k=
ontron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420c45b653e0630c69c9=
599
        new failure (last pass: v6.3-rc3-370-g8269040171a02) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
meson-sm1-khadas-vim3l       | arm64  | lab-baylibre    | gcc-10   | defcon=
fig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420ca82eb07143d409c9505

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/6420ca82eb07143d409c950e
        failing since 2 days (last pass: v6.3-rc3-288-g2dc3fa9ff5523, first=
 fail: v6.3-rc3-370-g8269040171a02)

    2023-03-26T22:43:06.336735  / # #
    2023-03-26T22:43:06.440451  export SHELL=3D/bin/sh
    2023-03-26T22:43:06.442021  <3>[   18.248809] mmc2: tuning execution fa=
iled: -5
    2023-03-26T22:43:06.442720  <3>[   18.248861] mmc2: error -5 whilst ini=
tialising SDIO card
    2023-03-26T22:43:06.443313  #
    2023-03-26T22:43:06.545861  / # export SHELL=3D/bin/sh. /lava-3446982/e=
nvironment
    2023-03-26T22:43:06.546957  =

    2023-03-26T22:43:06.649214  / # . /lava-3446982/environment/lava-344698=
2/bin/lava-test-runner /lava-3446982/1
    2023-03-26T22:43:06.651819  =

    2023-03-26T22:43:06.666106  / # /lava-3446982/bin/lava-test-runner /lav=
a-3446982/1 =

    ... (18 line(s) more)  =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc423c1a78535b9c9511

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc423c1a78535b9c9=
512
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc4088c10c73cd9c9522

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc4088c10c73cd9c9=
523
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc2d528a54b11f9c9508

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc2d528a54b11f9c9=
509
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc453c1a78535b9c951a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc453c1a78535b9c9=
51b
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc52536a79cd749c9511

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc52536a79cd749c9=
512
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc4088c10c73cd9c9525

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc4088c10c73cd9c9=
526
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc443c1a78535b9c9517

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc443c1a78535b9c9=
518
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc413c1a78535b9c950b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc413c1a78535b9c9=
50c
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc3288c10c73cd9c950b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc3288c10c73cd9c9=
50c
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-baylibre    | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc403c1a78535b9c9508

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc403c1a78535b9c9=
509
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-broonie     | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc3e528a54b11f9c9519

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc3e528a54b11f9c9=
51a
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm    | lab-collabora   | gcc-10   | multi_=
v7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6420cc2c88c10c73cd9c9505

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420cc2c88c10c73cd9c9=
506
        failing since 165 days (last pass: v6.0-5324-g7871897dadfa9, first =
fail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-rock2-square          | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c4244a558c5fb19c951e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420c4244a558c5fb19c9=
51f
        failing since 101 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =



platform                     | arch   | lab             | compiler | defcon=
fig                    | regressions
-----------------------------+--------+-----------------+----------+-------=
-----------------------+------------
rk3288-veyron-jaq            | arm    | lab-collabora   | gcc-10   | multi_=
v7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/6420c320368b9bd2759c95f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc3-55=
0-g902f54bbd6c7/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6420c320368b9bd2759c9=
5f3
        failing since 101 days (last pass: v6.1-6378-g44d433ee7540, first f=
ail: v6.1-10792-g244d284981da) =

 =20
