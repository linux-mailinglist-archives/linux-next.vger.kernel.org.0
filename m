Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7821848EA04
	for <lists+linux-next@lfdr.de>; Fri, 14 Jan 2022 13:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbiANMkY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Jan 2022 07:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiANMkY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Jan 2022 07:40:24 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECD56C061574
        for <linux-next@vger.kernel.org>; Fri, 14 Jan 2022 04:40:23 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id c3so13193503pls.5
        for <linux-next@vger.kernel.org>; Fri, 14 Jan 2022 04:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9NBX9mT9Lyox+xTQUAlhkKppknKO/vPPTsIuvOvkjEs=;
        b=mlQWOnlc1E+8/v5l6W9o5G2j1y9ctCqscrsytH7T80rd+1EGo8Xjsl5OGHRK8GuUeC
         dTdvqAs6+Gs5PDZED4JnaEiXnT2UBqs13RzqjPefevskLuDvs2QoYtPR4IAV3NNPOWbO
         4zvxPsNjcAPFmtTb3DkkIgW/cBrgDIzXDlYaprcMj0qtIvk4XwIy6+vDsRxMOcERiFSI
         2tqXoVB/BvC6LtJuMOq6uZ0OgdLsL5+p1NiSWCWX5gEt7cv7QbE2HrJ2hnZcFL4apAfb
         pQ8KyPSSVVj27vmzQxxq4nY8bYMQHiCkRM6HLmvoj0NReRINlLJccYC9Fw8q4ZbDN+cD
         ijbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9NBX9mT9Lyox+xTQUAlhkKppknKO/vPPTsIuvOvkjEs=;
        b=0gSERh0i0cWKR4zXk2hIw93PzXrTDK7VY6jeACror4eOXVEy1F/1YG9W8z+e4bvTao
         7SKKBWPxD54Db2jRRzRZ37QeQHEaopCO2Bh7MVbmZFdotkA4hyRck5Ec7UFoflebCKq4
         y/D49vR2z7a/NBg3Fy2ixgocn65xZt6ifaAA8LJqpQRxBlu3PCDDL2mCZm/hrcXoFnyI
         2cnrGUcf/ROC1e3EVSDVtXMhrTtuV4w7aUiCV1wPZn0kK5G2qZtacaNTlsn2xYwZu+9p
         JDbzLzyAiy54PucA85ENGOe8dbv6P2iyGVV5/bpDLzKWlGQTNXA7vSrMfs59zKExjKXw
         8qBQ==
X-Gm-Message-State: AOAM53223qWE6nn0231URPNcjZL1UyDpBnnE3CRX0RaJzLfROiG9Ro/z
        ZCunzjlfARVci5ueEeYTSjOiKqE3f3OIdKFPXis=
X-Google-Smtp-Source: ABdhPJyX8gOlzb0g781rvIf0LPf6GqPhe5KhC0h0YW6MO9RDk6nRPAVrLzKP7gRGhftYQvyXBXFVtg==
X-Received: by 2002:a17:902:bd93:b0:149:ba01:e67a with SMTP id q19-20020a170902bd9300b00149ba01e67amr9281852pls.156.1642164022988;
        Fri, 14 Jan 2022 04:40:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z16sm4613929pgi.89.2022.01.14.04.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 04:40:22 -0800 (PST)
Message-ID: <61e16f36.1c69fb81.8a8ca.d5d3@mx.google.com>
Date:   Fri, 14 Jan 2022 04:40:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20220114
X-Kernelci-Branch: master
Subject: next/master baseline: 548 runs, 29 regressions (next-20220114)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 548 runs, 29 regressions (next-20220114)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =

beagle-xm                  | arm   | lab-baylibre  | clang-14 | multi_v7_de=
fconfig           | 1          =

da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =

imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron   | gcc-10   | defconfig  =
                  | 2          =

kontron-kbox-a-230-ls      | arm64 | lab-kontron   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

kontron-sl28-var3-ads2     | arm64 | lab-kontron   | gcc-10   | defconfig  =
                  | 2          =

kontron-sl28-var3-ads2     | arm64 | lab-kontron   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

r8a774c0-ek874             | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 2          =

r8a774c0-ek874             | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 2          =

r8a774c0-ek874             | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =

rk3328-rock64              | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220114/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220114
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      468c1d50222ce9439c9835e00ab55ae9ced389fb =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
bcm2836-rpi-2-b            | arm   | lab-collabora | gcc-10   | multi_v7_de=
fc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e131da254c243e17ef6752

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm/=
multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab-collabora/baseline-b=
cm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e131da254c243e17ef6=
753
        failing since 20 days (last pass: next-20211223, first fail: next-2=
0211224) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
beagle-xm                  | arm   | lab-baylibre  | clang-14 | multi_v7_de=
fconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61e133723929f17062ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220103071835+55271=
39302d9-1~exp1~20220103071942.109)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm/=
multi_v7_defconfig/clang-14/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e133723929f17062ef6=
73e
        new failure (last pass: next-20220112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61e131f6d542cadacdef674a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e131f6d542cadacdef6=
74b
        failing since 1 day (last pass: next-20220106, first fail: next-202=
20112) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
imx6q-var-dt6customboard   | arm   | lab-baylibre  | gcc-10   | multi_v7_de=
fconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/61e136109e71498571ef675c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm/=
multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-imx6q-var-dt6custombo=
ard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e136109e71498571ef6=
75d
        new failure (last pass: next-20220113) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron   | gcc-10   | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/61e133d9ce7049d7e4ef6763

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e133d9ce7049d7e4ef67a8
        failing since 27 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-14T08:26:50.039902  /lava-78233/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
133d9ce7049d7e4ef67a9
        failing since 27 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-14T08:26:50.043216  <8>[   17.211191] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T08:26:51.092250  /lava-78233/1/../bin/lava-test-case
    2022-01-14T08:26:51.092718  <8>[   18.229937] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
kontron-kbox-a-230-ls      | arm64 | lab-kontron   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e136bd59bf82f214ef6772

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e136bd59bf82f214ef67b7
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-14T08:39:15.882892  /lava-78243/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
136bd59bf82f214ef67b8
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-14T08:39:15.887290  <8>[   16.436437] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T08:39:16.933689  /lava-78243/1/../bin/lava-test-case
    2022-01-14T08:39:16.933991  <8>[   17.455120] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T08:39:16.934200  /lava-78243/1/../bin/lava-test-case
    2022-01-14T08:39:16.934435  <8>[   17.471911] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-14T08:39:16.934625  /lava-78243/1/../bin/lava-test-case
    2022-01-14T08:39:16.934787  <8>[   17.487859] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-14T08:39:16.934954  /lava-78243/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron   | gcc-10   | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/61e132d469b9887680ef6764

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e132d469b9887680ef67b3
        failing since 27 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-14T08:22:34.235450  /lava-78230/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
132d469b9887680ef67b4
        failing since 27 days (last pass: next-20211216, first fail: next-2=
0211217)

    2022-01-14T08:22:34.238518  <8>[   13.443555] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T08:22:35.285445  /lava-78230/1/../bin/lava-test-case
    2022-01-14T08:22:35.285833  <8>[   14.462771] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
kontron-sl28-var3-ads2     | arm64 | lab-kontron   | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e1361038a2afade7ef6774

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61e1361038a2afade7ef67c0
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-14T08:35:46.286769  /lava-78241/1/../bin/lava-test-case   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61e=
1361038a2afade7ef67c1
        failing since 23 days (last pass: next-20211216, first fail: next-2=
0211221)

    2022-01-14T08:35:46.289870  <8>[   13.486943] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>
    2022-01-14T08:35:47.336181  /lava-78241/1/../bin/lava-test-case
    2022-01-14T08:35:47.336467  <8>[   14.506131] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2022-01-14T08:35:47.336612  /lava-78241/1/../bin/lava-test-case
    2022-01-14T08:35:47.336746  <8>[   14.522003] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2022-01-14T08:35:47.336881  /lava-78241/1/../bin/lava-test-case
    2022-01-14T08:35:47.337011  <8>[   14.537855] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2022-01-14T08:35:47.337143  /lava-78241/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
meson-gxbb-p200            | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/61e135e2fdf87c87c7ef6766

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-baylibre/baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e135e2fdf87c87c7ef6=
767
        new failure (last pass: next-20220113) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e138cb2aaad9b5fcef673e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e138cb2aaad9b5fcef6=
73f
        failing since 31 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e13d1ed279e79c6aef676d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e13d1ed279e79c6aef6=
76e
        failing since 31 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e13b48dce0565840ef675e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e13b48dce0565840ef6=
75f
        failing since 31 days (last pass: v5.16-rc4-6579-gea922272cbe5, fir=
st fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e138f32aaad9b5fcef675f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e138f32aaad9b5fcef6=
760
        failing since 30 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e13e867d8eb93767ef67a3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-qemu_arm64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e13e867d8eb93767ef6=
7a4
        failing since 30 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e13bbf873f81fd5fef6750

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e13bbf873f81fd5fef6=
751
        failing since 30 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, fir=
st fail: next-20211214) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a774c0-ek874             | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/61e1352cfb8da23dfeef674f

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e1352cfb8da23=
dfeef6752
        failing since 9 days (last pass: next-20211224, first fail: next-20=
220104)
        2 lines

    2022-01-14T08:32:11.384964  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-14T08:32:11.385128  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-14T08:32:11.385241  kern  :alert : user pgtable: 4k pages<8>[  =
 15.704473] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-14T08:32:11.385359  , 48-bit VAs, pgdp=3D000000007fa36000
    2022-01-14T08:32:11.385462  ker<8>[   15.716304] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 599116_1.5.2.4.1>
    2022-01-14T08:32:11.385545  n  :alert : [0000000000000000] pgd=3D080000=
007fa37003, p4d=3D080000007fa37003, pud=3D080000007fa38003, pmd=3D000000000=
0000000
    2022-01-14T08:32:11.385629  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e1352cfb8da23=
dfeef6753
        failing since 9 days (last pass: next-20211224, first fail: next-20=
220104)
        12 lines

    2022-01-14T08:32:11.341694  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-14T08:32:11.341813  kern  :alert : Mem abort info:
    2022-01-14T08:32:11.341922  ker<8>[   15.663424] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-14T08:32:11.342006  n  :alert :   ESR =3D 0x96000006
    2022-01-14T08:32:11.342088  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-14T08:32:11.342166  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-14T08:32:11.342242  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-14T08:32:11.342317  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-14T08:32:11.342411  kern  :alert : Data abort info:   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a774c0-ek874             | arm64 | lab-cip       | gcc-10   | defconfig+a=
rm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61e13725f81bed3f6fef673d

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-cip/baseline-r8a774c0-ek874.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e13725f81bed3=
f6fef6740
        failing since 9 days (last pass: next-20211223, first fail: next-20=
220104)
        2 lines

    2022-01-14T08:40:34.172872  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-14T08:40:34.172975  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-14T08:40:34.173059  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-14T08:40:34.173158  kern  :alert : Data abort info:
    2022-01-14T08:40:34.215206  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-14T08:40:34.215340  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-14T08:40:34.215430  kern  :alert : user pgtable: 4k pages<8>[  =
 16.358492] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-14T08:40:34.215527  , 48-bit VAs, pgdp=3D000000007fa27000
    2022-01-14T08:40:34.215638  ker<8>[   16.370362] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 599151_1.5.2.4.1>
    2022-01-14T08:40:34.215719  n  :alert : [0000000000000000] pgd=3D080000=
007fa28003, p4d=3D080000007fa28003, pud=3D080000007fa29003, pmd=3D000000000=
0000000 =

    ... (1 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e13725f81bed3=
f6fef6741
        failing since 9 days (last pass: next-20211223, first fail: next-20=
220104)
        12 lines

    2022-01-14T08:40:34.171880  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-14T08:40:34.172005  kern  :alert : Mem abort info:
    2022-01-14T08:40:34.172095  ker<8>[   16.317581] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-14T08:40:34.172181  n  :alert :   ESR =3D 0x96000006
    2022-01-14T08:40:34.172265  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a774c0-ek874             | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61e137bd596abb9979ef678c

  Results:     4 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-r8a774c0-ek87=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61e137bd596abb9=
979ef678f
        failing since 9 days (last pass: next-20211223, first fail: next-20=
220104)
        2 lines

    2022-01-14T08:43:24.126773  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2022-01-14T08:43:24.126993  kern  :alert :   CM =3D 0, WnR =3D 0
    2022-01-14T08:43:24.127121  kern  :alert : user pgtable: 4k pages<8>[  =
 16.245082] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=
=3Dlines MEASUREMENT=3D2>
    2022-01-14T08:43:24.127227  , 48-bit VAs, pgdp=3D000000007fa1d000
    2022-01-14T08:43:24.127320  ker<8>[   16.257442] <LAVA_SIGNAL_ENDRUN 0_=
dmesg 599170_1.5.2.4.1>
    2022-01-14T08:43:24.127414  n  :alert : [0000000000000000] pgd=3D080000=
007fa1e003, p4d=3D080000007fa1e003, pud=3D080000007fa1f003, pmd=3D000000000=
0000000
    2022-01-14T08:43:24.127505  kern  :emerg : Internal error: Oops: 960000=
06 [#1] PREEMPT SMP   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/61e137bd596abb9=
979ef6790
        failing since 9 days (last pass: next-20211223, first fail: next-20=
220104)
        12 lines

    2022-01-14T08:43:24.036747  <8>[   16.165449] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dcrit RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-01-14T08:43:24.085273  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 0000000000000000
    2022-01-14T08:43:24.085493  kern  :alert : Mem abort info:
    2022-01-14T08:43:24.085630  ker<8>[   16.204441] <LAVA_SIGNAL_TESTCASE =
TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2022-01-14T08:43:24.085739  n  :alert :   ESR =3D 0x96000006
    2022-01-14T08:43:24.085836  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2022-01-14T08:43:24.085931  kern  :alert :   SET =3D 0, FnV =3D 0
    2022-01-14T08:43:24.086021  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2022-01-14T08:43:24.086107  kern  :alert :   FSC =3D 0x06: level 2 tran=
slation fault
    2022-01-14T08:43:24.086191  kern  :alert : Data abort info:   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
rk3328-rock64              | arm64 | lab-baylibre  | clang-14 | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/61e13bdebf9c11c314ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-14 (Debian clang version 14.0.0-++20220103071835+55271=
39302d9-1~exp1~20220103071942.109)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-rk3328-rock64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/clang-14/lab-baylibre/baseline-rk3328-rock64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e13bdebf9c11c314ef6=
73e
        new failure (last pass: next-20220113) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig  =
                  | 1          =


  Details:     https://kernelci.org/test/plan/id/61e1484ac02ee95337ef6743

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e1484ac02ee95337ef6=
744
        failing since 52 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61e14b564eaaf3a998ef674a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+config_randomize_base=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu102=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e14b564eaaf3a998ef6=
74b
        failing since 52 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61e14ce6324cf07045ef6759

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220114/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61e14ce6324cf07045ef6=
75a
        failing since 52 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
