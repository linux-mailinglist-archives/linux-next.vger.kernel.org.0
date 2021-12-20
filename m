Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170C547B54A
	for <lists+linux-next@lfdr.de>; Mon, 20 Dec 2021 22:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhLTVhf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Dec 2021 16:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhLTVhe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Dec 2021 16:37:34 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3C4C061574
        for <linux-next@vger.kernel.org>; Mon, 20 Dec 2021 13:37:34 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id u20so4935391pfi.12
        for <linux-next@vger.kernel.org>; Mon, 20 Dec 2021 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZjiogLyypWqXae9CrbM2lkhnqKN7fPfkrABUp9NfCgY=;
        b=ZzRBeVmUEVASs5haRuNLc5itX1vSrB7x01OkWaNFWgu5vSggi3w/Av9JUPHl6m6JtW
         mYhzg7Pr6z6M6eVVlldAS+e8p5A8gttFjbKuV8R+qJNKDton+F3+fBFk5IVm4bXFMX6F
         bFDlaOeGA1VvZqoRktwtYB1rr4JEm3yIROpUeh1ICLuUHzpAwEHhYctkvmWQiZUtTt78
         TzgVITcf7LW/JGKM4xMPyV6l2Wrj39LhhcLHD8BJRbl5+Q4Ei7agBo5scKTYd29R8AW2
         zu6Lnn7OgFihBstaf2M3DSzPtRk32wAAi19aW2qANNJS+rDB2nSg24LytmYoGPimJZKN
         8Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZjiogLyypWqXae9CrbM2lkhnqKN7fPfkrABUp9NfCgY=;
        b=2Eza1Ts5uEUi+4ZXr90SJmnx8qSzo8FepF23MEkDImjkJTndTDcfy4oOUt/GgKu7jZ
         iVzmVj+sJZRMiGw0Mf+CIYtEuOtUgU2MI3TOmt7/bkyaSTfqzmqVAYM+w1iv0qRIujtm
         fB0awgIHkuzoms8n+XdLi7YhlFes8z0ot17D4YJY6JaC1KiLycH7iW85BAdh+Re5/ou4
         ViztkEDyfApUhhBRxOSRgcCu9OiZZjBDm/jIM7fvZKsG0l1Ssl+zEydo/S6I4Ytpbz9R
         A28EbTUnsz5EVP+HPQMq4XhclgUS7sO1jyWvFQUzWVWLpkiZhOC7OBpmsGj4cGd/ehOu
         AN2w==
X-Gm-Message-State: AOAM533U3RPt8q+M5QGxlxpDwL1pmMZV/yfxewqEQT3aNJxgRH9GcjAP
        eiopndk94rYH6JdK7P6coX9z7Y1GdU9c1Jhl
X-Google-Smtp-Source: ABdhPJwv5YbwPqz5nuSpni3rK5GCifPc6/QnIaVoOgvmTFpuhUujSVqNjCoiRbn3NwQ+JYDJJyO6sA==
X-Received: by 2002:a63:510a:: with SMTP id f10mr38741pgb.17.1640036252742;
        Mon, 20 Dec 2021 13:37:32 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r13sm18380428pga.29.2021.12.20.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 13:37:32 -0800 (PST)
Message-ID: <61c0f79c.1c69fb81.8aff7.2e97@mx.google.com>
Date:   Mon, 20 Dec 2021 13:37:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211220
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 537 runs, 35 regressions (next-20211220)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 537 runs, 35 regressions (next-20211220)

Regressions Summary
-------------------

platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | clang-13 | multi_v7=
_defconfig           | 1          =

da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | clang-13 | defconfi=
g                    | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =

kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-13 | defconfi=
g                    | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =

kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =

meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+crypto      | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig             | 1          =

minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+debug       | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =

qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | clang-13 | defconfi=
g                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =

zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+debug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211220/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211220
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      07f8c60fe60f84977dc815ec8a6b1100827c34dd =



Test Regressions
---------------- =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
beagle-xm                    | arm    | lab-baylibre  | clang-13 | multi_v7=
_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c26ab29768a65639721e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c26ab29768a656397=
21f
        failing since 20 days (last pass: next-20211129, first fail: next-2=
0211130) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
da850-lcdk                   | arm    | lab-baylibre  | gcc-10   | davinci_=
all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c03b73f03b5e8e397126

  Results:     5 PASS, 1 FAIL, 0 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm/=
davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da850-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/61c0c03b73f03b5=
e8e39712b
        new failure (last pass: next-20211217)
        231 lines

    2021-12-20T17:40:49.623242  kern  :emerg : dea0: 00000000 c0009998 c066=
a678 00000000 00000000 c893df3c 00000000 00000000
    2021-12-20T17:40:49.623453  kern  :emerg : dec0: 6e72656b 00006c65 0000=
0000 00000000 00000000 00000000 00000000 00000000
    2021-12-20T17:40:49.623637  kern  :emerg : dee0: 00000000 00000000 0000=
0000 00000000 00000000 c5943ed8 00000000 bf36d0a0
    2021-12-20T17:40:49.623786  kern  :emerg : df00: 0000000f c45523a0 0000=
017b c008c650 0000017b c0008624 00000000 0000000f
    2021-12-20T17:40:49.623930  kern  :emerg : df20: b6ec0125 c008f1d0 c893=
df3c 7fffffff 00000000 00000002 00020000 c8ca8000
    2021-12-20T17:40:49.666465  kern  :emerg : df40: c8ca9021 c8ca9d40 c8ca=
8000 00003a24 c8cab484 c8cab31c c8caa874 00003000
    2021-12-20T17:40:49.666697  kern  :emerg : df60: 00003240 00002ef0 0000=
33a6 00000000 00000000 00000000 00002ee0 00000021
    2021-12-20T17:40:49.666874  kern  :emerg : df80: 00000022 0000001a 0000=
0016 00000015 00000000 c5943ed8 00020000 00000000
    2021-12-20T17:40:49.667048  kern  :emerg : dfa0: 00000000 c0008460 0002=
0000 00000000 0000000f b6ec0125 00000000 00066e40
    2021-12-20T17:40:49.667213  kern  :emerg : dfc0: 00020000 00000000 0000=
0000 0000017b 00060bd8 00066e40 00000000 00020000 =

    ... (213 line(s) more)  =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c1c9767cf8c09139714d

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c1ca767cf8c091397192
        new failure (last pass: next-20211216)

    2021-12-20T17:47:44.414837  /lava-70131/1/../bin/lava-test-case
    2021-12-20T17:47:44.435551  <8>[   18.969732] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c1ca767cf8c091397193
        new failure (last pass: next-20211216)

    2021-12-20T17:47:45.489003  /lava-70131/1/../bin/lava-test-case
    2021-12-20T17:47:45.489303  <8>[   19.989091] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:47:45.489464  /lava-70131/1/../bin/lava-test-case
    2021-12-20T17:47:45.489616  <8>[   20.005772] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:47:45.489769  /lava-70131/1/../bin/lava-test-case
    2021-12-20T17:47:45.489915  <8>[   20.023436] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:47:45.490071  /lava-70131/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | clang-13 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c4d8dc64dc4a8c39714e

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c4d8dc64dc4a8c39719c
        new failure (last pass: next-20211216)

    2021-12-20T18:00:37.192316  /lava-70140/1/../bin/lava-test-case
    2021-12-20T18:00:37.193596  <8>[   18.533540] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c4d8dc64dc4a8c39719d
        new failure (last pass: next-20211216)

    2021-12-20T18:00:38.244710  /lava-70140/1/../bin/lava-test-case
    2021-12-20T18:00:38.245017  <8>[   19.552464] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T18:00:38.245176  /lava-70140/1/../bin/lava-test-case
    2021-12-20T18:00:38.245324  <8>[   19.569514] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T18:00:38.245475  /lava-70140/1/../bin/lava-test-case
    2021-12-20T18:00:38.245619  <8>[   19.586776] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T18:00:38.245833  /lava-70140/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0bf3532b8ed5a70397161

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-kbox-a-230=
-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0bf3532b8ed5a703971a6
        new failure (last pass: next-20211216)

    2021-12-20T17:36:30.432387  /lava-70121/1/../bin/lava-test-case
    2021-12-20T17:36:30.433579  <8>[   16.645124] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0bf3532b8ed5a703971a7
        new failure (last pass: next-20211216)

    2021-12-20T17:36:31.482506  /lava-70121/1/../bin/lava-test-case
    2021-12-20T17:36:31.482855  <8>[   17.664187] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:36:31.483082  /lava-70121/1/../bin/lava-test-case
    2021-12-20T17:36:31.483296  <8>[   17.679771] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:36:31.483625  /lava-70121/1/../bin/lava-test-case
    2021-12-20T17:36:31.483869  <8>[   17.695692] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:36:31.484080  /lava-70121/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c0effaa3218fce397133

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c0effaa3218fce397178
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-20T17:43:56.906321  /lava-70128/1/../bin/lava-test-case
    2021-12-20T17:43:56.907328  <8>[   17.464390] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c0effaa3218fce397179
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-20T17:43:57.956509  /lava-70128/1/../bin/lava-test-case
    2021-12-20T17:43:57.956925  <8>[   18.483259] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:43:57.957187  /lava-70128/1/../bin/lava-test-case
    2021-12-20T17:43:57.957418  <8>[   18.499202] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:43:57.957656  /lava-70128/1/../bin/lava-test-case
    2021-12-20T17:43:57.957877  <8>[   18.515236] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:43:57.958173  /lava-70128/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-kbox-a-230-ls        | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c22e3dc2313cd4397135

  Results:     91 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c22e3dc2313cd439717a
        new failure (last pass: next-20211216)

    2021-12-20T17:49:11.002648  /lava-70135/1/../bin/lava-test-case
    2021-12-20T17:49:11.003859  <8>[   17.261871] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c22e3dc2313cd439717b
        new failure (last pass: next-20211216)

    2021-12-20T17:49:12.054893  /lava-70135/1/../bin/lava-test-case
    2021-12-20T17:49:12.055182  <8>[   18.281243] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:49:12.055343  /lava-70135/1/../bin/lava-test-case
    2021-12-20T17:49:12.055493  <8>[   18.297259] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:49:12.055643  /lava-70135/1/../bin/lava-test-case
    2021-12-20T17:49:12.055788  <8>[   18.314304] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:49:12.055959  /lava-70135/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c1513e2abbe04a39712e

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-kontron/baseline-kontro=
n-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c1513e2abbe04a39717a
        new failure (last pass: next-20211216)

    2021-12-20T17:45:41.807398  /lava-70130/1/../bin/lava-test-case
    2021-12-20T17:45:41.810583  <8>[   13.554334] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c1513e2abbe04a39717b
        new failure (last pass: next-20211216)

    2021-12-20T17:45:42.858292  /lava-70130/1/../bin/lava-test-case
    2021-12-20T17:45:42.858984  <8>[   14.574196] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:45:42.859290  /lava-70130/1/../bin/lava-test-case
    2021-12-20T17:45:42.859545  <8>[   14.590174] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:45:42.859807  /lava-70130/1/../bin/lava-test-case
    2021-12-20T17:45:42.860071  <8>[   14.606476] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:45:42.860443  /lava-70130/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | clang-13 | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c45ef5c0858a29397120

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/clang-13/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c45ef5c0858a2939716c
        new failure (last pass: next-20211216)

    2021-12-20T17:58:37.182829  /lava-70138/1/../bin/lava-test-case
    2021-12-20T17:58:37.184022  <8>[   13.485586] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c45ef5c0858a2939716d
        new failure (last pass: next-20211216)

    2021-12-20T17:58:38.235854  /lava-70138/1/../bin/lava-test-case
    2021-12-20T17:58:38.238166  <8>[   14.505056] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:58:38.238502  /lava-70138/1/../bin/lava-test-case
    2021-12-20T17:58:38.238755  <8>[   14.520954] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:58:38.239005  /lava-70138/1/../bin/lava-test-case
    2021-12-20T17:58:38.239451  <8>[   14.536958] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:58:38.239709  /lava-70138/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+arm64-chromebook   | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0bf2151bba694c439715d

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+arm64-chromebook/gcc-10/lab-kontron/baseline-kontron-sl28-var3-=
ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0bf2151bba694c43971a9
        new failure (last pass: next-20211216)

    2021-12-20T17:36:29.004737  /lava-70122/1/../bin/lava-test-case
    2021-12-20T17:36:29.005935  <8>[   13.522088] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0bf2151bba694c43971aa
        new failure (last pass: next-20211216)

    2021-12-20T17:36:30.058012  /lava-70122/1/../bin/lava-test-case
    2021-12-20T17:36:30.058710  <8>[   14.541671] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:36:30.058979  /lava-70122/1/../bin/lava-test-case
    2021-12-20T17:36:30.059224  <8>[   14.558779] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:36:30.059468  /lava-70122/1/../bin/lava-test-case
    2021-12-20T17:36:30.059702  <8>[   14.575906] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:36:30.059973  /lava-70122/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g                    | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c075bbc9b36b62397130

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c075bbc9b36b6239717c
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-20T17:41:58.131294  /lava-70126/1/../bin/lava-test-case
    2021-12-20T17:41:58.132390  <8>[   13.540580] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c075bbc9b36b6239717d
        failing since 2 days (last pass: next-20211216, first fail: next-20=
211217)

    2021-12-20T17:41:59.181320  /lava-70126/1/../bin/lava-test-case
    2021-12-20T17:41:59.181991  <8>[   14.559381] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:41:59.182269  /lava-70126/1/../bin/lava-test-case
    2021-12-20T17:41:59.182516  <8>[   14.575298] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:41:59.182760  /lava-70126/1/../bin/lava-test-case
    2021-12-20T17:41:59.182995  <8>[   14.592040] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:41:59.183230  /lava-70126/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
kontron-sl28-var3-ads2       | arm64  | lab-kontron   | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 2          =


  Details:     https://kernelci.org/test/plan/id/61c0c219704108d35a39712f

  Results:     99 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.ftm-alarm-driver-present: https://kernelci.org/test/cas=
e/id/61c0c21a704108d35a39717f
        new failure (last pass: next-20211216)

    2021-12-20T17:49:08.168627  /lava-70133/1/../bin/lava-test-case
    2021-12-20T17:49:08.169816  <8>[   13.599447] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-driver-present RESULT=3Dfail>   =


  * baseline.bootrr.ftm-alarm-probed: https://kernelci.org/test/case/id/61c=
0c21a704108d35a397180
        new failure (last pass: next-20211216)

    2021-12-20T17:49:09.222542  /lava-70133/1/../bin/lava-test-case
    2021-12-20T17:49:09.222919  <8>[   14.618993] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dftm-alarm-probed RESULT=3Dfail>
    2021-12-20T17:49:09.223171  /lava-70133/1/../bin/lava-test-case
    2021-12-20T17:49:09.223408  <8>[   14.635563] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-driver-present RESULT=3Dpass>
    2021-12-20T17:49:09.224754  /lava-70133/1/../bin/lava-test-case
    2021-12-20T17:49:09.225001  <8>[   14.652726] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dsimple-mfd-i2c-probed RESULT=3Dpass>
    2021-12-20T17:49:09.225238  /lava-70133/1/../bin/lava-test-case   =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64  | lab-collabora | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c26c46974e41b039719e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-collabora/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c26c46974e41b0397=
19f
        new failure (last pass: next-20211217) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+crypto      | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c415581641a67d39712c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+crypto
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/x86_=
64/x86_64_defconfig+crypto/gcc-10/lab-collabora/baseline-minnowboard-turbot=
-E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c415581641a67d397=
12d
        new failure (last pass: next-20211217) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig             | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c58df6682cea0939711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3826.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-minnowboard-turbot-E3826.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c58df6682cea09397=
11f
        new failure (last pass: next-20211217) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
minnowboard-turbot-E3826     | x86_64 | lab-collabora | gcc-10   | x86_64_d=
efconfig+debug       | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c71de4810eddb23971a1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+debug
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/x86_=
64/x86_64_defconfig+debug/gcc-10/lab-collabora/baseline-minnowboard-turbot-=
E3826.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/x86/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c71de4810eddb2397=
1a2
        new failure (last pass: next-20211216) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c93707f0b8b2c839711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c93707f0b8b2c8397=
11f
        failing since 6 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv2-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c80c26872b204d39711e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c80c26872b204d397=
11f
        failing since 6 days (last pass: v5.16-rc4-6579-gea922272cbe5, firs=
t fail: v5.16-rc5-6644-gbcd5ddb85fad) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-baylibre  | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c90f274eb2e009397120

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c90f274eb2e009397=
121
        failing since 5 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, firs=
t fail: next-20211214) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
qemu_arm64-virt-gicv3-uefi   | arm64  | lab-collabora | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c7a18077100c73397122

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c7a18077100c73397=
123
        failing since 5 days (last pass: v5.16-rc5-6644-gbcd5ddb85fad, firs=
t fail: next-20211214) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | clang-13 | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c2fa3ff0f68b06397199

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/clang-13/lab-cip/baseline-zynqmp-zcu=
102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c2fa3ff0f68b06397=
19a
        failing since 27 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | clang-13 | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c5666e44d671fd397146

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211217053149+c446a=
c46746e-1~exp1~20211217173222.36)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/clang-13/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c5666e44d671fd397=
147
        failing since 26 days (last pass: next-20211118, first fail: next-2=
0211124) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c192edadddfa3c3971ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c192edadddfa3c397=
1eb
        failing since 27 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c34adb9ca589df397162

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+config_arm64_64k_pages=3Dy/gcc-10/lab-cip/baseline-zynqmp-zcu10=
2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c34adb9ca589df397=
163
        failing since 27 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =



platform                     | arch   | lab           | compiler | defconfi=
g                    | regressions
-----------------------------+--------+---------------+----------+---------=
---------------------+------------
zynqmp-zcu102                | arm64  | lab-cip       | gcc-10   | defconfi=
g+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/61c0c7be499f639fce397150

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211220/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61c0c7be499f639fce397=
151
        failing since 27 days (last pass: next-20211118, first fail: next-2=
0211123) =

 =20
