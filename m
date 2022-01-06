Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B6248654A
	for <lists+linux-next@lfdr.de>; Thu,  6 Jan 2022 14:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbiAFN2y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Jan 2022 08:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiAFN2y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jan 2022 08:28:54 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8DFC061245
        for <linux-next@vger.kernel.org>; Thu,  6 Jan 2022 05:28:54 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id g22so2555293pgn.1
        for <linux-next@vger.kernel.org>; Thu, 06 Jan 2022 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=incbBslRQ7JPiglWxldNZCNW80JzvDy9d4K8s6rsH68=;
        b=HPlvkeq61eKj2mrJW4OIQjfCOEQmDvAZ1dTllATW48znCDFjR5z1nxZInSOGTjleoI
         Xuy4ZrM0qhX7hG5nVHnY3+ZmLQ5jxwUfxPndI1sIMxxKCe6EKhPfZN0jk8XUEVB2Y7eQ
         Ix4FX1lgSlu0y3CbIKZdyZ5V0/Thq8WUVZhWMqf4Y3G2r6dAZ45pSzWtC/QwdByiBzx1
         H4o8TCKWDTWa6bB9yffxUXcouFvXtd0t/FTQ/oZF+sIRnbF3l71M8/Na9T6AyPFcuDKH
         ZIsTXs6/i/jcK21l03t5jxcVYDcB5GfM5l1qLuq1RDgy+lm2N/PTRbXkc1EPXvIDnwNT
         Nhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=incbBslRQ7JPiglWxldNZCNW80JzvDy9d4K8s6rsH68=;
        b=H6hg1vRpgxatO7C9WKK2tTZLeJPrh6QKCghZ2qiwIi9h88mt2OmNcYk2RC1hxQt4pN
         rDxMabWD6z4P2YcHhMSJkrSJb8A7p+ksBMZlZsSJzxHoyDpOWIAdmFz+NbhbW5HYMIRd
         nM22e/gaLfO9LoOrv0IyxqnScXrIUU0iO5wb7vjn5LY1sA4gwfMm7TmVX4i3p3iRNPuM
         fjvy4J9nsy/1S5GmNGC1IOOFERF5UyG6w4DyCxdzULZXRBJU5zrFRXVmb7xaDDaUfS0f
         Ht8TudohO9u+itkLQu7e7GgWSlTnPGDUiEOmqDeIs6+d50sOCyZBSGKIhtw3eg5rlRUn
         RH9g==
X-Gm-Message-State: AOAM5324EwDRd3xFqYg62roOw+73/VZJFCXWmjo2aMhGb/C583goU1vt
        ou0OHQdPkK8tI+H49t+VvZDrm0PfUDLIy7zs
X-Google-Smtp-Source: ABdhPJwqfQuN5q6NThyhzX34eQgAZ9/2Wg9EitpVOf+XLoEs+c4f5JnDag03CTPD93nDNVhtFCxocg==
X-Received: by 2002:a63:9f12:: with SMTP id g18mr48032298pge.534.1641475733289;
        Thu, 06 Jan 2022 05:28:53 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t80sm2113844pgb.23.2022.01.06.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 05:28:52 -0800 (PST)
Message-ID: <61d6ee94.1c69fb81.7c6a2.50d4@mx.google.com>
Date:   Thu, 06 Jan 2022 05:28:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.16-rc8-104-g4774f91d5489
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes baseline: 577 runs,
 8 regressions (v5.16-rc8-104-g4774f91d5489)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 577 runs, 8 regressions (v5.16-rc8-104-g4774f9=
1d5489)

Regressions Summary
-------------------

platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =

r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =

sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.16-rc8-104-g4774f91d5489/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.16-rc8-104-g4774f91d5489
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4774f91d548918d974e6e7637769ce25c8cc614f =



Test Regressions
---------------- =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b1d46d8a10abcfef674e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm/multi_v7_defconfig+config_thumb2_kernel=3Dy/gcc-10/lab=
-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d6b1d46d8a10abcfef6=
74f
        failing since 57 days (last pass: v5.15-rc7-176-gbfbd58926fc5, firs=
t fail: v5.15-12053-g6f9f2ed9499c) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre  | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b1f696a50714c0ef674c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a3=
11d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig/gcc-10/lab-baylibre/baseline-meson-g12b-a3=
11d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d6b1f696a50714c0ef6=
74d
        new failure (last pass: v5.16-rc8-88-g99ae9b78c633) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b21840333e3c8aef6752

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+config_cpu_big_endian=3Dy/gcc-10/lab-bayli=
bre/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64be/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d6b21840333e3c8aef6=
753
        new failure (last pass: v5.16-rc8-88-g99ae9b78c633) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b0eb6c998751a0ef6746

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-=
salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-r8a77950-=
salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d6b0eb6c998751a0ef6=
747
        new failure (last pass: v5.16-rc6-233-g727655660152) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
r8a77950-salvator-x          | arm64 | lab-baylibre  | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b4700281430f4bef6769

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-bayli=
bre/baseline-r8a77950-salvator-x.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d6b4700281430f4bef6=
76a
        new failure (last pass: v5.16-rc8-76-gf3c3fc1577d6) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora | gcc-10   | multi_v7_=
defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b80e1d33f90034ef67b6

  Results:     69 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm/multi_v7_defconfig+config_smp=3Dn/gcc-10/lab-collabora=
/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm/multi_v7_defconfig+config_smp=3Dn/gcc-10/lab-collabora=
/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.cros-ec-keyb-probed: https://kernelci.org/test/case/id/=
61d6b80e1d33f90034ef67f7
        new failure (last pass: v5.16-rc8-88-g99ae9b78c633)

    2022-01-06T09:35:58.542067  /lava-5363868/1/../bin/lava-test-case<8>[  =
 12.733972] <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=3Dcros-ec-keyb-probed RESULT=
=3Dfail>   =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
                    | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b152058b924b4bef6757

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig/gcc-10/lab-clabbe/baseline-sun50i-a64-bana=
napi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d6b152058b924b4bef6=
758
        new failure (last pass: v5.16-rc8-88-g99ae9b78c633) =

 =



platform                     | arch  | lab           | compiler | defconfig=
                    | regressions
-----------------------------+-------+---------------+----------+----------=
--------------------+------------
sun50i-a64-bananapi-m64      | arm64 | lab-clabbe    | gcc-10   | defconfig=
+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/61d6b3abd5ab35d481ef673d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.16-rc8-1=
04-g4774f91d5489/arm64/defconfig+config_randomize_base=3Dy/gcc-10/lab-clabb=
e/baseline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20211210.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/61d6b3abd5ab35d481ef6=
73e
        failing since 13 days (last pass: v5.16-rc6-213-gcac41c6f3ed1, firs=
t fail: v5.16-rc6-233-g727655660152) =

 =20
