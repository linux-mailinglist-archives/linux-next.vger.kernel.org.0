Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E01524FCBCC
	for <lists+linux-next@lfdr.de>; Tue, 12 Apr 2022 03:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbiDLBTb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Apr 2022 21:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348700AbiDLBSR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Apr 2022 21:18:17 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB58DFE7
        for <linux-next@vger.kernel.org>; Mon, 11 Apr 2022 18:14:56 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id md20-20020a17090b23d400b001cb70ef790dso1039907pjb.5
        for <linux-next@vger.kernel.org>; Mon, 11 Apr 2022 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0XZQUgT0qivRqLUf4D2AWcy3mBYoh1Yi+yIOqrrbm4o=;
        b=I8wH3x+812Yf4dB6VI4NWsOveTgDdY9M4Es950N8VE7zKDBaBwY0Ea9IWTzEn/DVfj
         dnyfwVp7eyVLw8ldzNGLe4xHelerPAyg4gVNXe5hcqsOa6zIkV749XH6qJ2kkufh4xfQ
         rZHEcrTyvjWKzX0mLLNmRi59q1qXZTduXlBgd/6lWdGZlCjq3nEyI/kdMVj5vSu082iK
         6DbsHU5idGNClqOWrGT5hXd6QTKC4o7Y+5ld2P4MMVJEkQIWVH60G1YZng2NLExI++2q
         /A0VP4N+iFvAQ7Chz7OOY4JKdVGvieTbxWFdaAhJ4SMShsMnNIWXAMiWoGAqCQSZQSZ3
         NIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0XZQUgT0qivRqLUf4D2AWcy3mBYoh1Yi+yIOqrrbm4o=;
        b=ACf3MFiUn0LmLdSGI7K4oUCJnUlac4V7Hedj6ZkXJqgfkxRXXoRmLUGLrdxfqtWAxf
         gr3PsJienivxpuzBKx4QkRY1pBHlNNx2Ms4Stm6Exvu9f/pmO79n5+sFOvH+FxmaFPi0
         Sso9DgAKJoIkCh5ou+0X1kQ9oni6z6ITe/k3PAiMIzxBkoRkXFS3olECb43u3+YRPJuA
         KHaBV3iJzLufKGOCQ5O57DVNKIlEwpR49kAaKC+tNJrCt8r9NH9AtqtlunNY0FTu9MaQ
         sun4qGDrfaV/rMUbL9g4TC2BazXLrKmEnVrQSDmrUH6y0TPVpFp41H/0qU0l8/kskkur
         9ssw==
X-Gm-Message-State: AOAM532cweCej4g1UK6uUDCLka+HGVsIK7dO+iGgtqOSW/J85Hdp+rQS
        2qROqN/y3kAYZs5ZlOWfWIyNW1pgeUCo7Uc3
X-Google-Smtp-Source: ABdhPJzF2SRfn/B3QFKFmMUFPVWu5uorIplbaKYUqlBB0Jmvcikr0SI54zsrD/X5lpmLBnBIXunKqA==
X-Received: by 2002:a17:902:d717:b0:156:20a9:d388 with SMTP id w23-20020a170902d71700b0015620a9d388mr34977947ply.19.1649726096004;
        Mon, 11 Apr 2022 18:14:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 34-20020a630b22000000b0039d97037bf3sm196467pgl.92.2022.04.11.18.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 18:14:55 -0700 (PDT)
Message-ID: <6254d28f.1c69fb81.4a354.0df3@mx.google.com>
Date:   Mon, 11 Apr 2022 18:14:55 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.18-rc1-608-g6537d9b7dc91
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 431 runs,
 7 regressions (v5.18-rc1-608-g6537d9b7dc91)
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

next/pending-fixes baseline: 431 runs, 7 regressions (v5.18-rc1-608-g6537d9=
b7dc91)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig      | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =

qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =

r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                | 1          =

rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.18-rc1-608-g6537d9b7dc91/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.18-rc1-608-g6537d9b7dc91
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      6537d9b7dc919cf5bfa912c7932c052cf0c7b2fd =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
da850-lcdk                 | arm   | lab-baylibre  | gcc-10   | davinci_all=
_defconfig      | 1          =


  Details:     https://kernelci.org/test/plan/id/62548ce2d1ab6dbc4bae0690

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da8=
50-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/62548ce2d1ab6db=
c4bae0698
        failing since 77 days (last pass: v5.16-11577-gffd79fec234d, first =
fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2022-04-11T20:17:19.026651  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcri=
t RESULT=3Dpass UNITS=3Dlines MEASUREMENT=3D0>
    2022-04-11T20:17:19.147441  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2022-04-11T20:17:19.147690  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2022-04-11T20:17:19.147867  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2022-04-11T20:17:19.190316  <8><LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dale=
rt RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D3>   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625498354bf1c5ef2cae0687

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625498354bf1c5ef2cae0=
688
        failing since 56 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/625492119012ab6360ae0699

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/625492119012ab6360ae0=
69a
        failing since 56 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6254993aab46f2cf98ae06b0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_ar=
m64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254993aab46f2cf98ae0=
6b1
        failing since 56 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie   | gcc-10   | defconfig+d=
ebug            | 1          =


  Details:     https://kernelci.org/test/plan/id/6254929fe3b898354fae068d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+debug/gcc-10/lab-broonie/baseline-qemu_arm=
64-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6254929fe3b898354fae0=
68e
        failing since 56 days (last pass: v5.17-rc3-225-g8b6f2853101d, firs=
t fail: v5.17-rc4-173-gecf2acb68532) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
r8a77950-salvator-x        | arm64 | lab-baylibre  | gcc-10   | defconfig  =
                | 1          =


  Details:     https://kernelci.org/test/plan/id/62549cb81ba4fb2233ae0735

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig/gcc-10/lab-baylibre/baseline-r8a77950-salv=
ator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62549cb81ba4fb2233ae0=
736
        new failure (last pass: v5.18-rc1-427-g02f3bd309a78c) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                | regressions
---------------------------+-------+---------------+----------+------------=
----------------+------------
rk3399-gru-kevin           | arm64 | lab-collabora | gcc-10   | defconfig+a=
rm64-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/6254915702ee79fde9ae0685

  Results:     88 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.18-rc1-6=
08-g6537d9b7dc91/arm64/defconfig+arm64-chromebook/gcc-10/lab-collabora/base=
line-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220401.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.rockchip-i2s1-probed: https://kernelci.org/test/case/id=
/6254915702ee79fde9ae06a7
        failing since 42 days (last pass: v5.17-rc5-244-gd77a1b37f796, firs=
t fail: v5.17-rc6-176-gb4e03e0dde48)

    2022-04-11T20:36:31.338675  <8>[   32.623800] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-i2s0-probed RESULT=3Dpass>
    2022-04-11T20:36:32.365177  /lava-6066212/1/../bin/lava-test-case   =

 =20
