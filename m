Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09E17E7F4C
	for <lists+linux-next@lfdr.de>; Fri, 10 Nov 2023 18:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjKJRws (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Nov 2023 12:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjKJRwf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Nov 2023 12:52:35 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBBD729C
        for <linux-next@vger.kernel.org>; Thu,  9 Nov 2023 22:28:16 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-da0344eb3fdso1730844276.3
        for <linux-next@vger.kernel.org>; Thu, 09 Nov 2023 22:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1699597695; x=1700202495; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd1tmJMLQevyhGNQpdi9dx0lCCDfHQ5unXXyYQpmKJs=;
        b=Ka3M7eRWp4XlsYNs9w5CPqqjJdUnr7/jUuSE0e/PPrlIvM7XjnqHMcYU1rslg1jXsD
         MvHcraoOzimgK6nEFyoyegI7HFMZmFf0GaS+jwyioAXJMDytX5C2s3W05msJdChL67CP
         Y3pseK//0ZNcjO6Tx+JYNCAXt44+YnciBJ2+oVErYcD6UI5ZGEy5pBDsTlSpVRkrEY0l
         fkoipEunowv9rfgOncbZ7NCOY74w/lQkaph7E1I6O43c+mcyc821vCgsRHvrzT+nzZ9Y
         EMxLZLx9HoT4P3r+mu69T4/1RdOpcvSIepnzuwrMRpf6JTPf2o9+CdMU0EJJhsD3MYbF
         Aryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699597695; x=1700202495;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jd1tmJMLQevyhGNQpdi9dx0lCCDfHQ5unXXyYQpmKJs=;
        b=hfgO26m0dDfLf+A2R1PeazB3hKelulHAl7nshL/mWz+v6m2MS5Ivks22RMnHQK/a0u
         Z6ei8eY9DxrsxBonL5bWC0BLahYjVIwTvBLlIrY1s/yAjDDRVjDNYIl9I1OB0yQiHS34
         gLXSPeD5D6PxaV/RnVVN1aSzx50Xk3x148k4yUbPeIep3s6FIiyiwVI4BJX8UYuFbIks
         Bai1Icps3SYYQKd/+uhfffiFWWwuNyrxXaoqr6AeE9pyOFu9h16WVhvNKvTNVS/0L4Jw
         kDlCgZW1cM1xaUrkRvOdXgvk6A5WAgj0vbDOL3PfLou4VFM5BgUhXaE/kkzhNZknvtRD
         AS8Q==
X-Gm-Message-State: AOJu0YwQqL0CdWc7N50qSfbXoQfyfbzGmkbhjfOlnQJvA9kkz2ueCiMv
        T675baelIlFR37PUIZ2q3JwaCnNASuVJRCfGjP93GA==
X-Google-Smtp-Source: AGHT+IEnqFWnp6VITskdMA1wbvAphs9z4zg6vTFkE1l8NFzRV6YbxXFxKYYiGKNAyrjm+7ka3AIeJw==
X-Received: by 2002:a25:d203:0:b0:da0:4d4c:4ca7 with SMTP id j3-20020a25d203000000b00da04d4c4ca7mr6275525ybg.16.1699597694778;
        Thu, 09 Nov 2023 22:28:14 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id m14-20020a654c8e000000b005b856fab5e9sm5058372pgt.18.2023.11.09.22.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 22:28:14 -0800 (PST)
Message-ID: <654dcd7e.650a0220.ad85e.de86@mx.google.com>
Date:   Thu, 09 Nov 2023 22:28:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231110
X-Kernelci-Report-Type: test
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master baseline: 397 runs, 13 regressions (next-20231110)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 397 runs, 13 regressions (next-20231110)

Regressions Summary
-------------------

platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
k3-am625-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =

k3-j721e-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =

kontron-pitx-imx8m         | arm64 | lab-kontron   | gcc-10   | defconfig  =
                  | 2          =

qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2      | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =

qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =

r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =

sun50i-a64-bananapi-m64    | arm64 | lab-clabbe    | gcc-10   | defconfig+k=
selftest          | 1          =

sun50i-h6-pine-h64         | arm64 | lab-clabbe    | gcc-10   | defconfig+k=
selftest          | 1          =

sun50i-h6-pine-h64         | arm64 | lab-collabora | gcc-10   | defconfig+k=
selftest          | 1          =

zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
231110/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20231110
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      8728c14129df7a6e29188a2e737b4774fb200953 =



Test Regressions
---------------- =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
k3-am625-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9e44d1682078bfefcf03

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-am625-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9e44d1682078bfefc=
f04
        new failure (last pass: next-20231103) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
k3-j721e-sk                | arm64 | lab-baylibre  | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9db40683a7d7dbefcef3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-baylibre/baseline-k3-j721e-sk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9db40683a7d7dbefc=
ef4
        failing since 6 days (last pass: next-20231025, first fail: next-20=
231103) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
kontron-pitx-imx8m         | arm64 | lab-kontron   | gcc-10   | defconfig  =
                  | 2          =


  Details:     https://kernelci.org/test/plan/id/654d917fe64b0abdf8efcef6

  Results:     51 PASS, 2 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/654d917fe64b0abdf8efcefd
        new failure (last pass: next-20231109)

    2023-11-10T02:12:05.630927  / # #
    2023-11-10T02:12:05.731558  export SHELL=3D/bin/sh
    2023-11-10T02:12:05.731812  #
    2023-11-10T02:12:05.832340  / # export SHELL=3D/bin/sh. /lava-394225/en=
vironment
    2023-11-10T02:12:05.832605  =

    2023-11-10T02:12:05.933107  / # . /lava-394225/environment/lava-394225/=
bin/lava-test-runner /lava-394225/1
    2023-11-10T02:12:05.933618  =

    2023-11-10T02:12:05.944881  / # /lava-394225/bin/lava-test-runner /lava=
-394225/1
    2023-11-10T02:12:06.003824  + export 'TESTRUN_ID=3D1_bootrr'
    2023-11-10T02:12:06.003993  + cd /l<8>[   15.746342] <LAVA_SIGNAL_START=
RUN 1_bootrr 394225_1.5.2.4.5> =

    ... (10 line(s) more)  =


  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/654=
d917fe64b0abdf8efcf0d
        new failure (last pass: next-20231109)

    2023-11-10T02:12:08.389917  /lava-394225/1/../bin/lava-test-case
    2023-11-10T02:12:08.390058  <8>[   18.227142] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2023-11-10T02:12:08.390140  /lava-394225/1/../bin/lava-test-case   =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9acc56d5581e6cefcf05

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9acc56d5581e6cefc=
f06
        new failure (last pass: next-20231106) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2      | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9a59bf48d6bfe6efcef5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9a59bf48d6bfe6efc=
ef6
        new failure (last pass: next-20231106) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-baylibre  | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9a6a6b9f3a4e43efcf72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-baylibre/baseline-qemu_arm64-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9a6a6b9f3a4e43efc=
f73
        failing since 4 days (last pass: next-20231101, first fail: next-20=
231106) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
qemu_arm64-virt-gicv2-uefi | arm64 | lab-collabora | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9a82c1640c253fefcf0f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm64-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9a82c1640c253fefc=
f10
        failing since 4 days (last pass: next-20231101, first fail: next-20=
231106) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
r8a774a1-hihope-rzg2m-ex   | arm64 | lab-cip       | gcc-10   | defconfig+C=
ON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9da3f2222f94f7efcef9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-cip/baseline-r8a774a1-hih=
ope-rzg2m-ex.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/654d9da3f2222f94f7efcf02
        failing since 100 days (last pass: next-20230712, first fail: next-=
20230801)

    2023-11-10T03:03:50.543228  + set +x
    2023-11-10T03:03:50.546428  <8>[   28.452196] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1036157_1.5.2.4.1>
    2023-11-10T03:03:50.652837  / # #
    2023-11-10T03:03:52.108194  export SHELL=3D/bin/sh
    2023-11-10T03:03:52.128957  #
    2023-11-10T03:03:52.129249  / # export SHELL=3D/bin/sh
    2023-11-10T03:03:54.076071  / # . /lava-1036157/environment
    2023-11-10T03:03:57.658145  /lava-1036157/bin/lava-test-runner /lava-10=
36157/1
    2023-11-10T03:03:57.679235  . /lava-1036157/environment
    2023-11-10T03:03:57.679531  / # /lava-1036157/bin/lava-test-runner /lav=
a-1036157/1 =

    ... (27 line(s) more)  =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-a64-bananapi-m64    | arm64 | lab-clabbe    | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9b5c4af2f1bd80efcf12

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-a64-bananapi-m64.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9b5c4af2f1bd80efc=
f13
        failing since 272 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64         | arm64 | lab-clabbe    | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9b0cdb9e17ff14efcf04

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-clabbe/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9b0cdb9e17ff14efc=
f05
        failing since 272 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
sun50i-h6-pine-h64         | arm64 | lab-collabora | gcc-10   | defconfig+k=
selftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9ac956d5581e6cefcf02

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+kselftest/gcc-10/lab-collabora/baseline-sun50i-h6-pine-h64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9ac956d5581e6cefc=
f03
        failing since 272 days (last pass: next-20230127, first fail: next-=
20230210) =

 =



platform                   | arch  | lab           | compiler | defconfig  =
                  | regressions
---------------------------+-------+---------------+----------+------------=
------------------+------------
zynqmp-zcu102              | arm64 | lab-cip       | gcc-10   | defconfig+d=
ebug              | 1          =


  Details:     https://kernelci.org/test/plan/id/654d9a5b6b9f3a4e43efcf62

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20231110/arm6=
4/defconfig+debug/gcc-10/lab-cip/baseline-zynqmp-zcu102.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230623.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/654d9a5b6b9f3a4e43efc=
f63
        new failure (last pass: next-20231106) =

 =20
