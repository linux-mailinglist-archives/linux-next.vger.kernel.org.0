Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D89763D9F8
	for <lists+linux-next@lfdr.de>; Wed, 30 Nov 2022 16:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiK3PyW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Nov 2022 10:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiK3PyV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2022 10:54:21 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07712AC4B
        for <linux-next@vger.kernel.org>; Wed, 30 Nov 2022 07:54:19 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t17so16041932pjo.3
        for <linux-next@vger.kernel.org>; Wed, 30 Nov 2022 07:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=94cystqHIxagiTXH5g9XIBHSoGuQq5yPrbObunWtsG4=;
        b=TD6xnc8DDJJbgpVK1D3fkVoUgOBfnMle7Zw67pzm1VGfSFWwKLhlMjbFGzaACuDTEC
         wJFc+LvrG+6x8wLNeZoKNwiHvgwky5FTV5ETTDkhOa3IgG8Ta2xdsgToGPUUfUmIiDoy
         lGe7rbcUoYgZ4H7rBctk7jpn1/dPhpOcRfbJFN5Oe0YImOnxB/94MkhkTExmrWrV6poH
         Imfrvs3ug1e/DKNFt3I1glUDLc2DWcf++EIjOPcPRrtvhtpjCX7rvTLN+yIRc8sAN7cR
         mftOlTh+PGM8/RweVBLM7VQi46oelrowzWqlVboL8UQrOeqvsbzysdkAx46qtrE+Axqe
         v29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94cystqHIxagiTXH5g9XIBHSoGuQq5yPrbObunWtsG4=;
        b=k2MX89JL2OGDPzhF7LYJBTb3voUfQtdKyhaD+3aG4rJsfmAdtJqTbl9nvKdlm2MYZX
         xrDr/9wF8EoGgYbk+C/1+7niMe2VsvgRKf1F8c4ZsgJZ0+qy14hzGDPpgfj9/f8nMB70
         smzbySANzSivj1GgGhI/Y5AcSjSERReiJidQZxNx8ZQe15hwS3rlrHUtItZAoxYzBDqC
         IaY47klJg6dv6mj6uWpXybI5xVWByycZAp1DlHFk0em3QWMFE/qHjRhZZRB5Vvm+ngM1
         o9+kVutqxIofKeCxoWbjSAWLL9tBFLtku2O2IDhTDivB6Fy/CoHBjKyKiFNVdJa0gBzA
         E+zg==
X-Gm-Message-State: ANoB5pn078mfh69/O4Jqlg1BU/MOZFmRCS1ZQ4TNMpGx+00/uHKN5T3G
        LQSbY1wrB7mz9iJO58hZx2CywBuJyILHoz8nxN0=
X-Google-Smtp-Source: AA0mqf6P8uAwgyBa8EpODOcIP2jxBQLL+8qhzIjZlXmxIkypmv091JOu4KXm8Dvn99uhvsUhsnfWww==
X-Received: by 2002:a17:902:a989:b0:188:d6c7:e7b7 with SMTP id bh9-20020a170902a98900b00188d6c7e7b7mr42906664plb.16.1669823658648;
        Wed, 30 Nov 2022 07:54:18 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w18-20020aa79552000000b00574ffc5976fsm1562265pfq.159.2022.11.30.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:54:18 -0800 (PST)
Message-ID: <63877caa.a70a0220.eccee.3793@mx.google.com>
Date:   Wed, 30 Nov 2022 07:54:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.1-rc7-197-g09f2f0dde2e8
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 524 runs,
 17 regressions (v6.1-rc7-197-g09f2f0dde2e8)
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

next/pending-fixes baseline: 524 runs, 17 regressions (v6.1-rc7-197-g09f2f0=
dde2e8)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.1-rc7-197-g09f2f0dde2e8/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.1-rc7-197-g09f2f0dde2e8
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      09f2f0dde2e87e79bc2c060dc1bcdf2a8a376546 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874bb6c5f2b4691a2abd3d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-linaro-lkft/baselin=
e-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874bb6c5f2b4691a2ab=
d3e
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-riotboard             | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874c45f1274217812abcfb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6dl-riotboard.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874c45f1274217812ab=
cfc
        failing since 23 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.1-rc3-573-g82d05e3975f5) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874c1df6acbe5e092abd0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874c1df6acbe5e092ab=
d10
        failing since 76 days (last pass: v6.0-rc4-291-g83a56f559828, first=
 fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/6387471d290899e4302abd07

  Results:     51 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm64/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-im=
x8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/638=
7471d290899e4302abd1a
        new failure (last pass: v6.1-rc7-154-g6acc901949f1)

    2022-11-30T12:05:35.959366  /lava-219954/1/../bin/lava-test-case
    2022-11-30T12:05:35.959746  <8>[   16.815278] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-11-30T12:05:35.960003  /lava-219954/1/../bin/lava-test-case
    2022-11-30T12:05:35.960230  <8>[   16.836106] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6387432f760a4cc7a72abd05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6387432f760a4cc7a72ab=
d06
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874ccd7099e2d5a22abd0c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874ccd7099e2d5a22ab=
d0d
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874c3c7bc347671f2abcfa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874c3c7bc347671f2ab=
cfb
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874d369d868413f42abda8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874d369d868413f42ab=
da9
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874c3e905b570e822abd81

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874c3e905b570e822ab=
d82
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874d12478cac959d2abcfc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874d12478cac959d2ab=
cfd
        failing since 49 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874c3d905b570e822abd7b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874c3d905b570e822ab=
d7c
        failing since 49 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874bc703c2a480c12abd30

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-=
qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874bc703c2a480c12ab=
d31
        failing since 49 days (last pass: v6.0-5324-g7871897dadfa9, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874ca78cdcfcee982abd11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874ca78cdcfcee982ab=
d12
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/63874c50f1274217812abd15

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63874c50f1274217812ab=
d16
        failing since 49 days (last pass: v6.0-9666-g02c05e0b8d5c, first fa=
il: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/638746f0bfe0ef5f2f2abd4e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638746f0bfe0ef5f2f2ab=
d4f
        new failure (last pass: v6.1-rc7-154-g6acc901949f1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/638745cf96677992412abd2c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/638745cf96677992412ab=
d2d
        failing since 1 day (last pass: v6.1-rc6-391-gf445421fe4c7, first f=
ail: v6.1-rc7-154-g6acc901949f1) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sc7180-trogdo...zor-limozeen | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ook+videodec | 1          =


  Details:     https://kernelci.org/test/plan/id/6387479f9f5525dadd2abcfe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+videodec
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.1-rc7-19=
7-g09f2f0dde2e8/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collab=
ora/baseline-sc7180-trogdor-lazor-limozeen.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20221125.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6387479f9f5525dadd2ab=
cff
        new failure (last pass: v6.1-rc7-154-g6acc901949f1) =

 =20
