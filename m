Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C2F0595435
	for <lists+linux-next@lfdr.de>; Tue, 16 Aug 2022 09:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiHPH4p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Aug 2022 03:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbiHPH4Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Aug 2022 03:56:24 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD9C59273
        for <linux-next@vger.kernel.org>; Mon, 15 Aug 2022 22:11:34 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id gj1so8812145pjb.0
        for <linux-next@vger.kernel.org>; Mon, 15 Aug 2022 22:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=EFP/jegxo//cMBp5lqjvCPOHTJbglK6oVf/MOvDPuHY=;
        b=Bo6IYiX73s0NRqwxolY9WAuOzL1L3O1IIAv/YRqBV+YAO9ogIpBB0hNx/bF/yDAbNc
         nbmo9LJ/mnMuw6Ry21fyageHhljsgFwKJvYMQbnY+q+TDxNhtXWcrhwGzXOQ8sRywQ2s
         gday9Y4/Y310QUxm/DrJDbtelOM656wT1pXQzQ8og25TBJGvwhXQhs6ATauv3l3dGrQa
         csogs8Zeuu7kpzLq8KJMQvKdfpBOJgakbX43BCiSyjrP6K8GpHLrik3pyStofIe8Ws/U
         4gJoHPpr2SxsFRbV3F99FzPvjqHk4gzt/+iu+buO6YeDPf1pmnTLmvU84u2xX5eKyfaZ
         noVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=EFP/jegxo//cMBp5lqjvCPOHTJbglK6oVf/MOvDPuHY=;
        b=l5yhjdkaHvgRMDP1pY2x0zz23WpYACQg8FOQbdthbTNTaYG0bb2/pxINO93l3stN/L
         Kl9k4AkmFNfSu2ZLzC+r7yn2SIp7XMXEfo0LIQVXUA0GMIJsuFazQbqAKb1Q2+bRMgP4
         K/dfLCWeQSJYFPdUz4vg6DGztSQEJ8r9kr7tLguJD/d96rz5+O4uAunMfYJDSCZSs6p7
         Ow418VSlpIuQbnqYwQoe2NREq1oPsl1Qa5LMyxfjlBhNi3pFlMIeUD9mUFfRSxNNz8hM
         7u+xesL8iaofCUqUbNUHqB10qebqchHG06iqg7RE5sRVLMNrrKW+B4TLubDs6QJ34JAw
         jljw==
X-Gm-Message-State: ACgBeo0egQ4azKfJ8jXJY6WBDilz0DDqAH1hcZrOIn32+KyYj+SFUOUR
        MmKyV82/cQgb1G49psImiviq4+ybl+Uvc1Tx
X-Google-Smtp-Source: AA6agR7ndI21XkZYODHXexBITDe1GS3RlDLxRKayAB1CLSQ9CeuBMgN/XqKGdXLR3IxLn+4sYCs0bQ==
X-Received: by 2002:a17:90b:1d0b:b0:1f5:6554:d556 with SMTP id on11-20020a17090b1d0b00b001f56554d556mr22051118pjb.168.1660626693867;
        Mon, 15 Aug 2022 22:11:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709027fc700b0016d737bff00sm7924455plb.220.2022.08.15.22.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 22:11:30 -0700 (PDT)
Message-ID: <62fb2702.170a0220.3ccd6.de93@mx.google.com>
Date:   Mon, 15 Aug 2022 22:11:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v6.0-rc1-172-gee556793d89d0
Subject: next/pending-fixes baseline: 476 runs,
 32 regressions (v6.0-rc1-172-gee556793d89d0)
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

next/pending-fixes baseline: 476 runs, 32 regressions (v6.0-rc1-172-gee5567=
93d89d0)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =

imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =

kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 2          =

meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =

mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =

panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =

qemu_arm64-virt-gicv2        | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.0-rc1-172-gee556793d89d0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.0-rc1-172-gee556793d89d0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      ee556793d89d0e3c4bbee8c8ad8d66fc8b390a92 =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62faef2df17f495fb135564d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/basel=
ine-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/basel=
ine-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faef2df17f495fb1355=
64e
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf6ad3301031c6535565c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-=
black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf6ad3301031c65355=
65d
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf80873c0ade2a5355666

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beag=
lebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+crypto/gcc-10/lab-cip/baseline-beag=
lebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf80873c0ade2a5355=
667
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf9911ed417a47b355651

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+ima/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf9911ed417a47b355=
652
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
beaglebone-black             | arm   | lab-cip       | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fafb140e4f95d772355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fafb140e4f95d772355=
643
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
da850-lcdk                   | arm   | lab-baylibre  | gcc-10   | davinci_a=
ll_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf033b0ea10a3c6355678

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62faf033b0ea10a=
3c6355680
        failing since 204 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-08-16T01:17:07.817689  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-08-16T01:17:07.818007  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-08-16T01:17:07.820806  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-08-16T01:17:07.863448  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
imx7d-sdb                    | arm   | lab-nxp       | gcc-10   | imx_v6_v7=
_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf30134ef4d950a35565b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/imx_v6_v7_defconfig/gcc-10/lab-nxp/baseline-imx7d-sdb.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf30134ef4d950a355=
65c
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+ima                | 2          =


  Details:     https://kernelci.org/test/plan/id/62faecfd347c2ff5f3355657

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-pi=
tx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62faecfd347c2ff5f3355665
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-16T01:03:47.601649  /lava-155043/1/../bin/lava-test-case
    2022-08-16T01:03:47.602155  <8>[   19.427431] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-16T01:03:47.602312  /lava-155043/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
aecfd347c2ff5f3355667
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-16T01:03:48.639141  /lava-155043/1/../bin/lava-test-case
    2022-08-16T01:03:48.639441  <8>[   20.471760] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-16T01:03:48.639592  /lava-155043/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/62faeea1671d5d9fde3556b6

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontr=
on/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62faeea1671d5d9fde3556c4
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-16T01:10:36.554288  /lava-155056/1/../bin/lava-test-case
    2022-08-16T01:10:36.554683  <8>[   19.319375] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-16T01:10:36.554929  /lava-155056/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
aeea1671d5d9fde3556c6
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-16T01:10:37.591472  /lava-155056/1/../bin/lava-test-case
    2022-08-16T01:10:37.591885  <8>[   20.363388] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-16T01:10:37.592151  /lava-155056/1/../bin/lava-test-case
    2022-08-16T01:10:37.592444  <8>[   20.383225] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
                    | 2          =


  Details:     https://kernelci.org/test/plan/id/62faf0bd49b9a61447355756

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-i=
mx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62faf0bd49b9a61447355764
        failing since 8 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-12861-g50a89f5a92e3)

    2022-08-16T01:19:33.605515  /lava-155069/1/../bin/lava-test-case
    2022-08-16T01:19:33.605948  <8>[   19.502841] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>
    2022-08-16T01:19:33.606194  /lava-155069/1/../bin/lava-test-case   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
af0bd49b9a61447355766
        failing since 8 days (last pass: v5.19-8283-ga8bc7f656e322, first f=
ail: v5.19-12861-g50a89f5a92e3)

    2022-08-16T01:19:34.643077  /lava-155069/1/../bin/lava-test-case
    2022-08-16T01:19:34.643460  <8>[   20.547201] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-16T01:19:34.643724  /lava-155069/1/../bin/lava-test-case
    2022-08-16T01:19:34.643959  <8>[   20.567167] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron   | gcc-10   | defconfig=
+crypto             | 2          =


  Details:     https://kernelci.org/test/plan/id/62faf1d66b501f1ce3355649

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+crypto
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+crypto/gcc-10/lab-kontron/baseline-kontron=
-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.imx6q-pcie-pcie0-probed: https://kernelci.org/test/case=
/id/62faf1d66b501f1ce3355657
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-16T01:24:20.249777  /lava-155079/1/../bin/lava-test-case
    2022-08-16T01:24:20.250225  <8>[   19.318961] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx6q-pcie-pcie0-probed RESULT=3Dfail>   =


  * baseline.bootrr.intel-igb-probed: https://kernelci.org/test/case/id/62f=
af1d66b501f1ce3355659
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94)

    2022-08-16T01:24:21.287472  /lava-155079/1/../bin/lava-test-case
    2022-08-16T01:24:21.287844  <8>[   20.363167] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dintel-igb-probed RESULT=3Dfail>
    2022-08-16T01:24:21.288108  /lava-155079/1/../bin/lava-test-case
    2022-08-16T01:24:21.288359  <8>[   20.383066] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-driver-present RESULT=3Dpass>
    2022-08-16T01:24:21.288587  /lava-155079/1/../bin/lava-test-case
    2022-08-16T01:24:21.288804  <8>[   20.403499] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb0-probed RESULT=3Dpass>
    2022-08-16T01:24:21.289157  /lava-155079/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-gxm-khadas-vim2        | arm64 | lab-baylibre  | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf34a0aef089981355647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-meson-g=
xm-khadas-vim2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf34a0aef089981355=
648
        new failure (last pass: v5.19-14056-g3b7c069e0e1e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
mt8183-kukui-...uniper-sku16 | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf55718b950d6003556a5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-mt8183-kukui-jacuzzi-juniper-sku16.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf55718b950d600355=
6a6
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf5db5e561fa1df355645

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/=
baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf5db5e561fa1df355=
646
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf76bc05f5acc4935564f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-panda.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf76bc05f5acc49355=
650
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf8e7018d036afe355642

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline=
-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf8e7018d036afe355=
643
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/62fafa63cf19545ebf35564a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fafa63cf19545ebf355=
64b
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
panda                        | arm   | lab-baylibre  | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62fafc1be54652016a355656

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab=
-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62fafc1be54652016a355=
657
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf2e7a036ee4bbd355669

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf2e7a036ee4bbd355=
66a
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf42420f5f76eba355647

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf42420f5f76eba355=
648
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre  | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf2e6731b4d04dd355654

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_a=
rm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf2e6731b4d04dd355=
655
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie   | gcc-10   | vexpress_=
defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf42377f5632ab5355648

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm/vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_ar=
m-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf42377f5632ab5355=
649
        failing since 10 days (last pass: v5.19-8283-ga8bc7f656e322, first =
fail: v5.19-11387-gd91170a44a94) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
qemu_arm64-virt-gicv2        | arm64 | lab-broonie   | gcc-10   | defconfig=
+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf4739a34d07178355658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf4739a34d07178355=
659
        new failure (last pass: v5.19-14056-g3b7c069e0e1e4) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/62faf13bd62bb0e91b35564d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62faf13bd62bb0e91b355=
64e
        new failure (last pass: v5.19-13979-gdcb67a85d8831) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3399-gru-kevin             | arm64 | lab-collabora | gcc-10   | defconfig=
+arm64-chromebook   | 4          =


  Details:     https://kernelci.org/test/plan/id/62fb0151470bf5b51b355642

  Results:     85 PASS, 7 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.0-rc1-17=
2-gee556793d89d0/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220805.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/62fb0151470bf5b51b355664
        failing since 169 days (last pass: v5.17-rc5-244-gd77a1b37f796, fir=
st fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-08-16T02:29:29.212312  <8>[   40.210570] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-08-16T02:29:30.236946  /lava-7045646/1/../bin/lava-test-case
    2022-08-16T02:29:30.246381  <8>[   41.245300] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s1-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-gyro0-probed: https://kernelci.org/test=
/case/id/62fb0151470bf5b51b355687
        failing since 77 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-16T02:29:27.005800  <8>[   38.003332] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel1-probed RESULT=3Dfail>
    2022-08-16T02:29:28.039562  /lava-7045646/1/../bin/lava-test-case
    2022-08-16T02:29:28.050280  <8>[   39.048084] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-gyro0-probed RESULT=3Dfail>   =


  * baseline.bootrr.cros-ec-sensors-accel1-probed: https://kernelci.org/tes=
t/case/id/62fb0151470bf5b51b355688
        failing since 77 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-16T02:29:26.993297  /lava-7045646/1/../bin/lava-test-case   =


  * baseline.bootrr.cros-ec-sensors-accel0-probed: https://kernelci.org/tes=
t/case/id/62fb0151470bf5b51b355689
        failing since 77 days (last pass: v5.18-5613-ge079cf8f6817, first f=
ail: v5.18-11575-gceccc06b624ed)

    2022-08-16T02:29:25.948520  /lava-7045646/1/../bin/lava-test-case
    2022-08-16T02:29:25.960539  <8>[   36.957948] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcros-ec-sensors-accel0-probed RESULT=3Dfail>   =

 =20
